#include "ros/ros.h"
#include "ekumen_exe1/Recording.h"
#include <cstdlib>

int main(int argc, char **argv)
{
  ros::init(argc, argv, "recording_client");
  if (argc != 2)
  {
    ROS_INFO("usage: recording_client start_recording|stop_recording");
    return 1;
  }

  ros::NodeHandle n;
  ros::ServiceClient client = n.serviceClient<ekumen_exe1::Recording>("Recording");
  ekumen_exe1::Recording srv;
  srv.request.command = atoll(argv[1]);
  if (client.call(srv))
  {
    ROS_INFO("Response: %ld", (long int)srv.response.ret);
  }
  else
  {
    ROS_ERROR("Failed to call service recording");
    return 1;
  }
 
  return 0;
}
