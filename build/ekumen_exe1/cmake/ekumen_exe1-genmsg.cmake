# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "ekumen_exe1: 2 messages, 1 services")

set(MSG_I_FLAGS "-Iekumen_exe1:/home/rodrigo/catkin_ws/src/ekumen_exe1/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(ekumen_exe1_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/rodrigo/catkin_ws/src/ekumen_exe1/srv/Recording.srv" NAME_WE)
add_custom_target(_ekumen_exe1_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ekumen_exe1" "/home/rodrigo/catkin_ws/src/ekumen_exe1/srv/Recording.srv" ""
)

get_filename_component(_filename "/home/rodrigo/catkin_ws/src/ekumen_exe1/msg/Path_pos.msg" NAME_WE)
add_custom_target(_ekumen_exe1_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ekumen_exe1" "/home/rodrigo/catkin_ws/src/ekumen_exe1/msg/Path_pos.msg" ""
)

get_filename_component(_filename "/home/rodrigo/catkin_ws/src/ekumen_exe1/msg/Num.msg" NAME_WE)
add_custom_target(_ekumen_exe1_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ekumen_exe1" "/home/rodrigo/catkin_ws/src/ekumen_exe1/msg/Num.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(ekumen_exe1
  "/home/rodrigo/catkin_ws/src/ekumen_exe1/msg/Path_pos.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ekumen_exe1
)
_generate_msg_cpp(ekumen_exe1
  "/home/rodrigo/catkin_ws/src/ekumen_exe1/msg/Num.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ekumen_exe1
)

### Generating Services
_generate_srv_cpp(ekumen_exe1
  "/home/rodrigo/catkin_ws/src/ekumen_exe1/srv/Recording.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ekumen_exe1
)

### Generating Module File
_generate_module_cpp(ekumen_exe1
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ekumen_exe1
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(ekumen_exe1_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(ekumen_exe1_generate_messages ekumen_exe1_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/rodrigo/catkin_ws/src/ekumen_exe1/srv/Recording.srv" NAME_WE)
add_dependencies(ekumen_exe1_generate_messages_cpp _ekumen_exe1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rodrigo/catkin_ws/src/ekumen_exe1/msg/Path_pos.msg" NAME_WE)
add_dependencies(ekumen_exe1_generate_messages_cpp _ekumen_exe1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rodrigo/catkin_ws/src/ekumen_exe1/msg/Num.msg" NAME_WE)
add_dependencies(ekumen_exe1_generate_messages_cpp _ekumen_exe1_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ekumen_exe1_gencpp)
add_dependencies(ekumen_exe1_gencpp ekumen_exe1_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ekumen_exe1_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(ekumen_exe1
  "/home/rodrigo/catkin_ws/src/ekumen_exe1/msg/Path_pos.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ekumen_exe1
)
_generate_msg_eus(ekumen_exe1
  "/home/rodrigo/catkin_ws/src/ekumen_exe1/msg/Num.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ekumen_exe1
)

### Generating Services
_generate_srv_eus(ekumen_exe1
  "/home/rodrigo/catkin_ws/src/ekumen_exe1/srv/Recording.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ekumen_exe1
)

### Generating Module File
_generate_module_eus(ekumen_exe1
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ekumen_exe1
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(ekumen_exe1_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(ekumen_exe1_generate_messages ekumen_exe1_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/rodrigo/catkin_ws/src/ekumen_exe1/srv/Recording.srv" NAME_WE)
add_dependencies(ekumen_exe1_generate_messages_eus _ekumen_exe1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rodrigo/catkin_ws/src/ekumen_exe1/msg/Path_pos.msg" NAME_WE)
add_dependencies(ekumen_exe1_generate_messages_eus _ekumen_exe1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rodrigo/catkin_ws/src/ekumen_exe1/msg/Num.msg" NAME_WE)
add_dependencies(ekumen_exe1_generate_messages_eus _ekumen_exe1_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ekumen_exe1_geneus)
add_dependencies(ekumen_exe1_geneus ekumen_exe1_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ekumen_exe1_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(ekumen_exe1
  "/home/rodrigo/catkin_ws/src/ekumen_exe1/msg/Path_pos.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ekumen_exe1
)
_generate_msg_lisp(ekumen_exe1
  "/home/rodrigo/catkin_ws/src/ekumen_exe1/msg/Num.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ekumen_exe1
)

### Generating Services
_generate_srv_lisp(ekumen_exe1
  "/home/rodrigo/catkin_ws/src/ekumen_exe1/srv/Recording.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ekumen_exe1
)

### Generating Module File
_generate_module_lisp(ekumen_exe1
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ekumen_exe1
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(ekumen_exe1_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(ekumen_exe1_generate_messages ekumen_exe1_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/rodrigo/catkin_ws/src/ekumen_exe1/srv/Recording.srv" NAME_WE)
add_dependencies(ekumen_exe1_generate_messages_lisp _ekumen_exe1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rodrigo/catkin_ws/src/ekumen_exe1/msg/Path_pos.msg" NAME_WE)
add_dependencies(ekumen_exe1_generate_messages_lisp _ekumen_exe1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rodrigo/catkin_ws/src/ekumen_exe1/msg/Num.msg" NAME_WE)
add_dependencies(ekumen_exe1_generate_messages_lisp _ekumen_exe1_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ekumen_exe1_genlisp)
add_dependencies(ekumen_exe1_genlisp ekumen_exe1_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ekumen_exe1_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(ekumen_exe1
  "/home/rodrigo/catkin_ws/src/ekumen_exe1/msg/Path_pos.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ekumen_exe1
)
_generate_msg_nodejs(ekumen_exe1
  "/home/rodrigo/catkin_ws/src/ekumen_exe1/msg/Num.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ekumen_exe1
)

### Generating Services
_generate_srv_nodejs(ekumen_exe1
  "/home/rodrigo/catkin_ws/src/ekumen_exe1/srv/Recording.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ekumen_exe1
)

### Generating Module File
_generate_module_nodejs(ekumen_exe1
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ekumen_exe1
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(ekumen_exe1_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(ekumen_exe1_generate_messages ekumen_exe1_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/rodrigo/catkin_ws/src/ekumen_exe1/srv/Recording.srv" NAME_WE)
add_dependencies(ekumen_exe1_generate_messages_nodejs _ekumen_exe1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rodrigo/catkin_ws/src/ekumen_exe1/msg/Path_pos.msg" NAME_WE)
add_dependencies(ekumen_exe1_generate_messages_nodejs _ekumen_exe1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rodrigo/catkin_ws/src/ekumen_exe1/msg/Num.msg" NAME_WE)
add_dependencies(ekumen_exe1_generate_messages_nodejs _ekumen_exe1_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ekumen_exe1_gennodejs)
add_dependencies(ekumen_exe1_gennodejs ekumen_exe1_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ekumen_exe1_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(ekumen_exe1
  "/home/rodrigo/catkin_ws/src/ekumen_exe1/msg/Path_pos.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ekumen_exe1
)
_generate_msg_py(ekumen_exe1
  "/home/rodrigo/catkin_ws/src/ekumen_exe1/msg/Num.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ekumen_exe1
)

### Generating Services
_generate_srv_py(ekumen_exe1
  "/home/rodrigo/catkin_ws/src/ekumen_exe1/srv/Recording.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ekumen_exe1
)

### Generating Module File
_generate_module_py(ekumen_exe1
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ekumen_exe1
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(ekumen_exe1_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(ekumen_exe1_generate_messages ekumen_exe1_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/rodrigo/catkin_ws/src/ekumen_exe1/srv/Recording.srv" NAME_WE)
add_dependencies(ekumen_exe1_generate_messages_py _ekumen_exe1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rodrigo/catkin_ws/src/ekumen_exe1/msg/Path_pos.msg" NAME_WE)
add_dependencies(ekumen_exe1_generate_messages_py _ekumen_exe1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rodrigo/catkin_ws/src/ekumen_exe1/msg/Num.msg" NAME_WE)
add_dependencies(ekumen_exe1_generate_messages_py _ekumen_exe1_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ekumen_exe1_genpy)
add_dependencies(ekumen_exe1_genpy ekumen_exe1_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ekumen_exe1_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ekumen_exe1)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ekumen_exe1
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(ekumen_exe1_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ekumen_exe1)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ekumen_exe1
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(ekumen_exe1_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ekumen_exe1)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ekumen_exe1
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(ekumen_exe1_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ekumen_exe1)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ekumen_exe1
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(ekumen_exe1_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ekumen_exe1)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ekumen_exe1\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ekumen_exe1
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(ekumen_exe1_generate_messages_py std_msgs_generate_messages_py)
endif()
