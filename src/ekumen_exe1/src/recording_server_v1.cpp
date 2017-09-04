
#include "ros/ros.h"
#include "ekumen_exe1/Recording.h"
bool add(ekumen_exe1::Recording::Request  &req,
         ekumen_exe1::Recording::Response &res)
{
   res.sum = req.a + req.b;
   ROS_INFO("request: x=%ld, y=%ld", (long int)req.a, (long int)req.b);
   ROS_INFO("sending back response: [%ld]", (long int)res.sum);
   return true;
}
 
int main(int argc, char **argv)
{
   ros::init(argc, argv, "recording_server");
   ros::NodeHandle n;
 
   ros::ServiceServer service = n.advertiseService("recording", add);
   ROS_INFO("Ready to recording.");
   ros::spin();
 
   return 0;
}
