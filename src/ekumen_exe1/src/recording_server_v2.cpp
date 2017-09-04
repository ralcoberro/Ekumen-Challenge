
#include "ros/ros.h"
//#include <tf/tf.h>
#include <tf/transform_listener.h>
//#include <geometry_msgs/Twist.h>
#include <turtlesim/Pose.h>
//#include <geometry_msgs/PoseStamped.h>
#include <turtlesim/Spawn.h>
#include <turtlesim/SetPen.h>
#include <turtlesim/TeleportAbsolute.h>
#include "ekumen_exe1/Recording.h"

int mode = 0;
bool init = false;
//geometry_msgs::Pose turtle_pos;

bool recording(ekumen_exe1::Recording::Request  &req, ekumen_exe1::Recording::Response &res)
{
   ROS_INFO("request: x=%ld", (long int)req.command);
   res.ret = req.command;
   mode = req.command;   

   ROS_INFO("sending back response: [%ld]", (long int)req.command);
   return true;
}

/*void poseCallback(const turtlesim::PoseConstPtr& msg)
{
  //ROS_INFO("Pose (X,Y): (%f, %f)", msg->x, msg->y);

  turtle_pos.position.x = msg->x;
  turtle_pos.position.y = msg->y;
  //turtle_pos.theta = msg->theta;
}*/

int main(int argc, char **argv)
{
   std::string turtle_name;
   double dist = 0.2f;
   double diffx;
   double diffy;

   ros::init(argc, argv, "recording_server");

   if (argc != 2){ROS_ERROR("need turtle name as argument"); return -1;};
   turtle_name = argv[1];

   std::vector<geometry_msgs::Pose> path;
   geometry_msgs::Pose goal;
   std::vector<geometry_msgs::Pose>::iterator itr = path.begin();

   ros::NodeHandle node;

   ros::service::waitForService("clear");
   /*ros::ServiceClient clear = node.serviceClient<clear>("clear");
   turtlesim::Clear clear_srv;
   if (!clear.call(clear_srv))
   {
      ROS_ERROR("Failed to call service Clear");
      return 1;
   }*/

   ros::service::waitForService(turtle_name+"/set_pen");
   ros::ServiceClient set_pen = node.serviceClient<turtlesim::SetPen>(turtle_name+"/set_pen");
   turtlesim::SetPen pen_srv;
   pen_srv.request.off = 0;
   if (!set_pen.call(pen_srv))
   {
      ROS_ERROR("Failed to call service SetPen");
      return 1;
   }

   ros::service::waitForService(turtle_name+"/teleport_absolute");
   ros::ServiceClient turtle_teleport = node.serviceClient<turtlesim::TeleportAbsolute>(turtle_name+"/teleport_absolute");
   turtlesim::TeleportAbsolute teleport_srv;

   //ros::Publisher turtle_vel = node.advertise<geometry_msgs::Twist>(turtle_name+"cmd_vel", 10);
   //geometry_msgs::Twist vel_msg;

   tf::TransformListener listener;
   tf::StampedTransform transform;
 
   ros::ServiceServer service = node.advertiseService("Recording", recording);

   //ros::Subscriber sub = node.subscribe(turtle_name+"/pose", 10, &poseCallback);

   ROS_INFO("Ready to start recording.");

  ros::Rate rate(1.0);
  while (node.ok())
  {
    switch(mode)
    {
	case 0:
       	    init = false;
            rate = 1.0;
	    break;

	case 1:
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
	      //listener.lookupTransform("/world", "/turtle1", ros::Time(0), transform);
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
		}
	    break;
	case 2:
	    if(init == false)
	    {
           	ROS_INFO("Playing Path...");
            	rate = 5.0;
		itr = path.begin();
		//clear.call(clear_srv);
	    	init = true;
            	//ROS_INFO("Playing Pose (X,Y): (%f, %f)", itr->position.x, itr->position.y);
	    }
            if(itr != path.end())
	    {
            	ROS_INFO("Playing Pose (X,Y): (%f, %f)", itr->position.x, itr->position.y);
		teleport_srv.request.x = itr->position.x;
		teleport_srv.request.y = itr->position.y;
		turtle_teleport.call(teleport_srv);
		if (!turtle_teleport.call(teleport_srv))
		{
		  ROS_ERROR("Failed to call service TeleportAbsolute");
		  return 1;
		}
		++itr;
		mode = 3;
	    }
	    else
		mode = 0;
	    break;
    } 
    ros::spinOnce();
    rate.sleep();
  }
 
   return 0;
}
