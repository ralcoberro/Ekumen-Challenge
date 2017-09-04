#include "ros/ros.h"
#include "ekumen_exe1/Recording.h"
#include <cstdlib>

int main(int argc, char **argv)
{
  ros::init(argc, argv, "recording_client");
  if (argc != 3)
  {
    ROS_INFO("usage: recording_client X Y");
    return 1;
  }

  ros::NodeHandle n;
  ros::ServiceClient client = n.serviceClient<ekumen_exe1::Recording>("recording");
  ekumen_exe1::Recording srv;
  srv.request.a = atoll(argv[1]);
  srv.request.b = atoll(argv[2]);
  if (client.call(srv))
  {
    ROS_INFO("Sum: %ld", (long int)srv.response.sum);
  }
  else
  {
    ROS_ERROR("Failed to call service recording");
    return 1;
  }
 
  return 0;
}
