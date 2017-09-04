
#include "ros/ros.h"
//#include <tf/tf.h>
#include <tf/transform_listener.h>
//#include <geometry_msgs/Twist.h>
#include <turtlesim/Pose.h>
//#include <geometry_msgs/PoseStamped.h>
#include <turtlesim/Spawn.h>
#include <turtlesim/SetPen.h>
#include <turtlesim/TeleportAbsolute.h>
#include <std_srvs/Empty.h>
#include "ekumen_exe1/Recording.h"
#include "ekumen_exe1/Path_pos.h"

int mode = 0;
bool init = false;
geometry_msgs::Pose turtle_pos;
geometry_msgs::Twist vel_msg;
double pFactor = 1.0f, pAngleFactor = 4.0f, distTolFactor = 0.1f;
ros::Publisher turtle_vel;

//! Service Callback for Commands processing
bool recording(ekumen_exe1::Recording::Request  &req, ekumen_exe1::Recording::Response &res)
{

   ROS_INFO("request: x=%ld", (long int)req.command);
   res.ret = req.command;
   mode = req.command;   

   ROS_INFO("sending back response: [%ld]", (long int)req.command);
   return true;
}

//! Pose Transform Callback for Recording the instantaneous Robot Pose
void poseCallback(const turtlesim::PoseConstPtr& msg)
{
  turtle_pos.position.x = msg->x;
  turtle_pos.position.y = msg->y;
  turtle_pos.position.z = 0;
  turtle_pos.orientation.z = msg->theta;
  turtle_pos.orientation.x = 0;
  turtle_pos.orientation.y = 0;
  turtle_pos.orientation.w = 0;
}

//! Returns the distance between the Robot and the Next Goal
double getDistance(const geometry_msgs::Pose &goal)
{
   double diffx = goal.position.x - turtle_pos.position.x;
   double diffy = goal.position.y - turtle_pos.position.y;
   return sqrt(pow(diffx, 2) + pow(diffy, 2));
}

//! Returns the angle between the Robot and the Netx Goal
double getAngle(const geometry_msgs::Pose &goal)
{
   double diffx = goal.position.x - turtle_pos.position.x;
   double diffy = goal.position.y - turtle_pos.position.y;
   return (atan2(diffy, diffx) - turtle_pos.orientation.z);
}

//! Set the Robot velocity (linear and angular). Returns False if the Goal was reached
bool robotMoveToGoal(const geometry_msgs::Pose &goal, const double distTolerance)
{
   double distance = getDistance(goal);
   if(distance > distTolerance)
   {
      vel_msg.linear.x = pFactor * distance;
      vel_msg.linear.y = 0;
      vel_msg.linear.z = 0;

      vel_msg.angular.z = pAngleFactor * getAngle(goal);

      ROS_INFO("Vel msg (Linear, angle): (%f, %f)", vel_msg.linear.x, vel_msg.angular.z);
      turtle_vel.publish(vel_msg);

      return true;
   }
   else
   {
      vel_msg.linear.x = 0;
      vel_msg.linear.y = 0;
      vel_msg.linear.z = 0;
      vel_msg.angular.z = 0;
      return false;
   }
}


int main(int argc, char **argv)
{
   std::string turtle_name;
   double dist = 0.2f;
   double diffx;
   double diffy;

   ros::init(argc, argv, "recording_server");

   if (argc != 2){ROS_ERROR("need turtle name as argument"); return -1;};
   turtle_name = argv[1];

   //! Goal and Path declarations
   std::vector<geometry_msgs::Pose> path;
   geometry_msgs::Pose goal;
   std::vector<geometry_msgs::Pose>::iterator itr = path.begin();

   //! Node and Services Associations
   ros::NodeHandle node;

   ros::service::waitForService("clear");
   ros::ServiceClient clear = node.serviceClient<std_srvs::Empty>("clear");
   std_srvs::Empty empty;
   if (!clear.call(empty))
   {
      ROS_ERROR("Failed to call service Clear");
      return 1;
   }

   ros::service::waitForService(turtle_name+"/set_pen");
   ros::ServiceClient set_pen = node.serviceClient<turtlesim::SetPen>(turtle_name+"/set_pen");
   turtlesim::SetPen pen_srv;
   pen_srv.request.off = 0;
   if (!set_pen.call(pen_srv))
   {
      ROS_ERROR("Failed to call service SetPen");
      return 1;
   }

   //ros::service::waitForService(turtle_name+"/teleport_absolute");
   //ros::ServiceClient turtle_teleport = node.serviceClient<turtlesim::TeleportAbsolute>(turtle_name+"/teleport_absolute");
   //turtlesim::TeleportAbsolute teleport_srv;

   turtle_vel = node.advertise<geometry_msgs::Twist>(turtle_name+"/cmd_vel", 10);

   ros::Publisher path_topic = node.advertise<ekumen_exe1::Path_pos>(turtle_name+"/pos", 10);
   ekumen_exe1::Path_pos position;

   tf::TransformListener listener;
   tf::StampedTransform transform;
 
   ros::ServiceServer service = node.advertiseService("Recording", recording);

   ros::Subscriber sub = node.subscribe(turtle_name+"/pose", 10, &poseCallback);

   ROS_INFO("Ready to start recording.");

  ros::Rate rate(1.0);
  while (node.ok())
  {
    switch(mode)
    {
	case 0:
       	    //! Initial state. Do initialization
	    init = false;
            rate = 1.0;
	    break;

	case 1:
       	    //! Recording state (from Gazebo)
	    if(init == false)
	    {
            	rate = 1.0;
		path.clear();
		goal.position.x = 0;
		goal.position.y = 0;
	    	init = true;
	    }
	    try
	    {
	      listener.lookupTransform("/odom", "/base_footprint", ros::Time(0), transform);
	    }
	    catch (tf::TransformException &ex) {
	      ROS_ERROR("%s",ex.what());
	      ros::Duration(1.0).sleep();
	      continue;
	    }
		diffx = fabs(goal.position.x-transform.getOrigin().x());
		diffy = fabs(goal.position.y-transform.getOrigin().y());
                //ROS_INFO("Diff: (%f, %f)", diffx, diffy);

	    if((diffx > dist) || (diffy > dist))
		{
            	    ROS_INFO("Recording Pose (X,Y): (%f, %f)", transform.getOrigin().x(), transform.getOrigin().y());
		    goal.position.x = transform.getOrigin().x();
		    goal.position.y = transform.getOrigin().y();
            	    path.push_back(goal);
		    position.x = goal.position.x;
		    position.y = goal.position.y;
		    position.angle = transform.getRotation().getAngle();
		    path_topic.publish(position);
		}
	    break;
	case 2:
       	    //! Path playing usig Turtlesim
	    if(init == false)
	    {
           	//ROS_INFO("Playing Path...");
            	rate = 10.0;
		itr = path.begin();
	        if (!clear.call(empty))
	        {
	           ROS_ERROR("Failed to call service Clear");
	           return 1;
	        }
	    	init = true;
            	ROS_INFO("Playing Pose (X,Y): (%f, %f)", itr->position.x, itr->position.y);
	    }
            if(itr != path.end())
	    {
            	//ROS_INFO("Playing Pose (X,Y): (%f, %f)", itr->position.x, itr->position.y);
		if (!robotMoveToGoal(*itr, distTolFactor))
		{
           	   ROS_INFO("Goal Reached!!");
		   ++itr;
		   //mode = 3;
		}
	    }
	    else
            {
           	ROS_INFO("Path End...");
		mode = 0;
            }
	    break;
    } 
    ros::spinOnce();
    rate.sleep();
  }
 
   return 0;
}
