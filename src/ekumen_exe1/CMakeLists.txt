cmake_minimum_required(VERSION 2.8.3)
project(ekumen_exe1)

## Compile as C++11, supported in ROS Kinetic and newer
# add_compile_options(-std=c++11)

## Find catkin and any catkin packages
find_package(catkin REQUIRED COMPONENTS roscpp rospy std_msgs message_generation tf)

## Declare ROS messages and services
add_message_files(FILES Num.msg Path_pos.msg)
add_service_files(FILES Recording.srv)

## Generate added messages and services
generate_messages(DEPENDENCIES std_msgs)

## Declare a catkin package
catkin_package(
  CATKIN_DEPENDS message_runtime
)

## Build talker and listener
include_directories(include ${catkin_INCLUDE_DIRS})

add_executable(talker src/talker.cpp)
target_link_libraries(talker ${catkin_LIBRARIES})
add_dependencies(talker ekumen_exe1_generate_messages_cpp)

add_executable(listener src/listener.cpp)
target_link_libraries(listener ${catkin_LIBRARIES})
add_dependencies(listener ekumen_exe1_generate_messages_cpp)

add_executable(recording_server src/recording_server.cpp)
target_link_libraries(recording_server ${catkin_LIBRARIES})
add_dependencies(recording_server ekumen_exe1_gencpp)

add_executable(recording_server_v2 src/recording_server_v2.cpp)
target_link_libraries(recording_server_v2 ${catkin_LIBRARIES})
add_dependencies(recording_server_v2 ekumen_exe1_gencpp)

add_executable(recording_server_v3 src/recording_server_v3.cpp)
target_link_libraries(recording_server_v3 ${catkin_LIBRARIES})
add_dependencies(recording_server_v3 ekumen_exe1_gencpp)

add_executable(recording_client src/recording_client.cpp)
target_link_libraries(recording_client ${catkin_LIBRARIES})
add_dependencies(recording_client ekumen_exe1_gencpp)

add_executable(turtle_tf_broadcaster src/turtle_tf_broadcaster.cpp)
target_link_libraries(turtle_tf_broadcaster ${catkin_LIBRARIES})
add_dependencies(turtle_tf_broadcaster ekumen_exe1_gencpp)

add_executable(turtle_tf_listener src/turtle_tf_listener.cpp)
target_link_libraries(turtle_tf_listener ${catkin_LIBRARIES})
add_dependencies(turtle_tf_listener ekumen_exe1_gencpp)

add_executable(turtle_tf_listener_rec src/turtle_tf_listener_rec.cpp)
target_link_libraries(turtle_tf_listener_rec ${catkin_LIBRARIES})
add_dependencies(turtle_tf_listener_rec ekumen_exe1_gencpp)

add_executable(move_base src/move_base.cpp)
target_link_libraries(move_base ${catkin_LIBRARIES})
add_dependencies(move_base ekumen_exe1_gencpp)

# %EndTag(FULLTEXT)%
