
#include "ros/ros.h"
//#include <tf/tf.h>
#include <tf/transform_listener.h>
#include <geometry_msgs/Twist.h>
//#include <geometry_msgs/PoseStamped.h>
#include <turtlesim/Spawn.h>
#include "ekumen_exe1/Recording.h"

int mode = 0;
bool init = false;

bool recording(ekumen_exe1::Recording::Request  &req, ekumen_exe1::Recording::Response &res)
{
   ROS_INFO("request: x=%ld", (long int)req.command);
   res.ret = req.command;
   mode = req.command;   

   ROS_INFO("sending back response: [%ld]", (long int)req.command);
   return true;
}

int main(int argc, char **argv)
{
   std::vector<geometry_msgs::PoseStamped> path;
   geometry_msgs::PoseStamped goal;
   std::vector<geometry_msgs::PoseStamped>::iterator itr = path.begin();
   ros::init(argc, argv, "recording_server");
   ros::NodeHandle node;

   ros::service::waitForService("spawn");
   ros::ServiceClient add_turtle = node.serviceClient<turtlesim::Spawn>("spawn");
   turtlesim::Spawn srv;
   add_turtle.call(srv);
   ros::Publisher turtle_vel = node.advertise<geometry_msgs::Twist>("turtle1/cmd_vel", 10);
   geometry_msgs::Twist vel_msg;

   tf::TransformListener listener;
   tf::StampedTransform transform;
 
   ros::ServiceServer service = node.advertiseService("Recording", recording);
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
	    	init = true;
	    }
	    try
	    {
	      listener.lookupTransform("/world", "/turtle1", ros::Time(0), transform);
	    }
	    catch (tf::TransformException &ex) {
	      ROS_ERROR("%s",ex.what());
	      ros::Duration(1.0).sleep();
	      continue;
	    }
	    if((abs(goal.pose.position.x-transform.getOrigin().x()) > 0.1) ||
	    	(abs(goal.pose.position.y-transform.getOrigin().y()) > 0.1))
		{
            	    ROS_INFO("Recording Pose (X,Y): (%f, %f)", transform.getOrigin().x(), transform.getOrigin().y());
		    goal.pose.position.x = transform.getOrigin().x();
		    goal.pose.position.y = transform.getOrigin().y();
            	    path.push_back(goal);
		}
	    break;
	case 2:
	    if(init == false)
	    {
            	rate = 5.0;
		itr = path.begin();
	    	init = true;
            	ROS_INFO("Playing Pose (X,Y): (%f, %f)", itr->pose.position.x, itr->pose.position.y);
	    }
            if(itr != path.end())
	    {
            	//ROS_INFO("Playing Pose (X,Y): (%f, %f)", itr->pose.position.x, itr->pose.position.y);

	        try
	        {
	          listener.lookupTransform("/world", "/turtle1", ros::Time(0), transform);
	        }
	        catch (tf::TransformException &ex) {
	         ROS_ERROR("%s",ex.what());
	         ros::Duration(1.0).sleep();
	         continue;
	        }

            	//ROS_INFO("Transform Pose (X,Y): (%f, %f)", transform.getOrigin().x(), transform.getOrigin().y());
		
		double x = itr->pose.position.x - transform.getOrigin().x();
		double y = itr->pose.position.y - transform.getOrigin().y();
            	//ROS_INFO("Result (X,Y): (%f, %f)", x, y);
    		
		double fi_to_goal = atan2(y, x);
		if(fi_to_goal < 0)
			fi_to_goal += 6.28;
		double fi_turtle = transform.getRotation().getAngle();
		double diff = fi_to_goal - fi_turtle;
            	ROS_INFO("Angles (Goal,Turtle, Diff): (%f, %f, %f)", fi_to_goal, fi_turtle, diff);

		if(diff < -3.1416) 
		{
			diff += 6.28;
            		ROS_INFO("Diff corrected: %f", diff);
		}
		else if(diff > 3.1416)
		{
			diff -= 6.28;
            		ROS_INFO("Diff corrected: %f", diff);
		}

		vel_msg.angular.z = diff;
    		vel_msg.linear.x = 0.2 * sqrt(pow(x, 2) + pow(y, 2));
            	ROS_INFO("Vel msg (Linear, angle): (%f, %f)", vel_msg.linear.x, vel_msg.angular.z);
    		turtle_vel.publish(vel_msg);

		if(vel_msg.linear.x < 0.1)
		{
		  ++itr;
		  mode = 3;
		}
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
