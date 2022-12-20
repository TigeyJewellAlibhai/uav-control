# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/ubuntu/catkin_ws/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ubuntu/catkin_ws/build

# Include any dependencies generated for this target.
include ubiquity_motor/CMakeFiles/ubiquity_motor.dir/depend.make

# Include the progress variables for this target.
include ubiquity_motor/CMakeFiles/ubiquity_motor.dir/progress.make

# Include the compile flags for this target's objects.
include ubiquity_motor/CMakeFiles/ubiquity_motor.dir/flags.make

ubiquity_motor/CMakeFiles/ubiquity_motor.dir/src/motor_message.cc.o: ubiquity_motor/CMakeFiles/ubiquity_motor.dir/flags.make
ubiquity_motor/CMakeFiles/ubiquity_motor.dir/src/motor_message.cc.o: /home/ubuntu/catkin_ws/src/ubiquity_motor/src/motor_message.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/catkin_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object ubiquity_motor/CMakeFiles/ubiquity_motor.dir/src/motor_message.cc.o"
	cd /home/ubuntu/catkin_ws/build/ubiquity_motor && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ubiquity_motor.dir/src/motor_message.cc.o -c /home/ubuntu/catkin_ws/src/ubiquity_motor/src/motor_message.cc

ubiquity_motor/CMakeFiles/ubiquity_motor.dir/src/motor_message.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ubiquity_motor.dir/src/motor_message.cc.i"
	cd /home/ubuntu/catkin_ws/build/ubiquity_motor && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/catkin_ws/src/ubiquity_motor/src/motor_message.cc > CMakeFiles/ubiquity_motor.dir/src/motor_message.cc.i

ubiquity_motor/CMakeFiles/ubiquity_motor.dir/src/motor_message.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ubiquity_motor.dir/src/motor_message.cc.s"
	cd /home/ubuntu/catkin_ws/build/ubiquity_motor && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/catkin_ws/src/ubiquity_motor/src/motor_message.cc -o CMakeFiles/ubiquity_motor.dir/src/motor_message.cc.s

ubiquity_motor/CMakeFiles/ubiquity_motor.dir/src/motor_serial.cc.o: ubiquity_motor/CMakeFiles/ubiquity_motor.dir/flags.make
ubiquity_motor/CMakeFiles/ubiquity_motor.dir/src/motor_serial.cc.o: /home/ubuntu/catkin_ws/src/ubiquity_motor/src/motor_serial.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/catkin_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object ubiquity_motor/CMakeFiles/ubiquity_motor.dir/src/motor_serial.cc.o"
	cd /home/ubuntu/catkin_ws/build/ubiquity_motor && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ubiquity_motor.dir/src/motor_serial.cc.o -c /home/ubuntu/catkin_ws/src/ubiquity_motor/src/motor_serial.cc

ubiquity_motor/CMakeFiles/ubiquity_motor.dir/src/motor_serial.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ubiquity_motor.dir/src/motor_serial.cc.i"
	cd /home/ubuntu/catkin_ws/build/ubiquity_motor && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/catkin_ws/src/ubiquity_motor/src/motor_serial.cc > CMakeFiles/ubiquity_motor.dir/src/motor_serial.cc.i

ubiquity_motor/CMakeFiles/ubiquity_motor.dir/src/motor_serial.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ubiquity_motor.dir/src/motor_serial.cc.s"
	cd /home/ubuntu/catkin_ws/build/ubiquity_motor && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/catkin_ws/src/ubiquity_motor/src/motor_serial.cc -o CMakeFiles/ubiquity_motor.dir/src/motor_serial.cc.s

ubiquity_motor/CMakeFiles/ubiquity_motor.dir/src/motor_hardware.cc.o: ubiquity_motor/CMakeFiles/ubiquity_motor.dir/flags.make
ubiquity_motor/CMakeFiles/ubiquity_motor.dir/src/motor_hardware.cc.o: /home/ubuntu/catkin_ws/src/ubiquity_motor/src/motor_hardware.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/catkin_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object ubiquity_motor/CMakeFiles/ubiquity_motor.dir/src/motor_hardware.cc.o"
	cd /home/ubuntu/catkin_ws/build/ubiquity_motor && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ubiquity_motor.dir/src/motor_hardware.cc.o -c /home/ubuntu/catkin_ws/src/ubiquity_motor/src/motor_hardware.cc

ubiquity_motor/CMakeFiles/ubiquity_motor.dir/src/motor_hardware.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ubiquity_motor.dir/src/motor_hardware.cc.i"
	cd /home/ubuntu/catkin_ws/build/ubiquity_motor && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/catkin_ws/src/ubiquity_motor/src/motor_hardware.cc > CMakeFiles/ubiquity_motor.dir/src/motor_hardware.cc.i

ubiquity_motor/CMakeFiles/ubiquity_motor.dir/src/motor_hardware.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ubiquity_motor.dir/src/motor_hardware.cc.s"
	cd /home/ubuntu/catkin_ws/build/ubiquity_motor && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/catkin_ws/src/ubiquity_motor/src/motor_hardware.cc -o CMakeFiles/ubiquity_motor.dir/src/motor_hardware.cc.s

# Object files for target ubiquity_motor
ubiquity_motor_OBJECTS = \
"CMakeFiles/ubiquity_motor.dir/src/motor_message.cc.o" \
"CMakeFiles/ubiquity_motor.dir/src/motor_serial.cc.o" \
"CMakeFiles/ubiquity_motor.dir/src/motor_hardware.cc.o"

# External object files for target ubiquity_motor
ubiquity_motor_EXTERNAL_OBJECTS =

/home/ubuntu/catkin_ws/devel/lib/libubiquity_motor.so: ubiquity_motor/CMakeFiles/ubiquity_motor.dir/src/motor_message.cc.o
/home/ubuntu/catkin_ws/devel/lib/libubiquity_motor.so: ubiquity_motor/CMakeFiles/ubiquity_motor.dir/src/motor_serial.cc.o
/home/ubuntu/catkin_ws/devel/lib/libubiquity_motor.so: ubiquity_motor/CMakeFiles/ubiquity_motor.dir/src/motor_hardware.cc.o
/home/ubuntu/catkin_ws/devel/lib/libubiquity_motor.so: ubiquity_motor/CMakeFiles/ubiquity_motor.dir/build.make
/home/ubuntu/catkin_ws/devel/lib/libubiquity_motor.so: /opt/ros/noetic/lib/libcontroller_manager.so
/home/ubuntu/catkin_ws/devel/lib/libubiquity_motor.so: /opt/ros/noetic/lib/libclass_loader.so
/home/ubuntu/catkin_ws/devel/lib/libubiquity_motor.so: /usr/lib/arm-linux-gnueabihf/libPocoFoundation.so
/home/ubuntu/catkin_ws/devel/lib/libubiquity_motor.so: /usr/lib/arm-linux-gnueabihf/libdl.so
/home/ubuntu/catkin_ws/devel/lib/libubiquity_motor.so: /opt/ros/noetic/lib/libroslib.so
/home/ubuntu/catkin_ws/devel/lib/libubiquity_motor.so: /opt/ros/noetic/lib/librospack.so
/home/ubuntu/catkin_ws/devel/lib/libubiquity_motor.so: /usr/lib/arm-linux-gnueabihf/libpython3.8.so
/home/ubuntu/catkin_ws/devel/lib/libubiquity_motor.so: /usr/lib/arm-linux-gnueabihf/libboost_program_options.so.1.71.0
/home/ubuntu/catkin_ws/devel/lib/libubiquity_motor.so: /usr/lib/arm-linux-gnueabihf/libtinyxml2.so
/home/ubuntu/catkin_ws/devel/lib/libubiquity_motor.so: /opt/ros/noetic/lib/libdiagnostic_updater.so
/home/ubuntu/catkin_ws/devel/lib/libubiquity_motor.so: /opt/ros/noetic/lib/libroscpp.so
/home/ubuntu/catkin_ws/devel/lib/libubiquity_motor.so: /usr/lib/arm-linux-gnueabihf/libpthread.so
/home/ubuntu/catkin_ws/devel/lib/libubiquity_motor.so: /usr/lib/arm-linux-gnueabihf/libboost_chrono.so.1.71.0
/home/ubuntu/catkin_ws/devel/lib/libubiquity_motor.so: /usr/lib/arm-linux-gnueabihf/libboost_filesystem.so.1.71.0
/home/ubuntu/catkin_ws/devel/lib/libubiquity_motor.so: /opt/ros/noetic/lib/librosconsole.so
/home/ubuntu/catkin_ws/devel/lib/libubiquity_motor.so: /opt/ros/noetic/lib/librosconsole_log4cxx.so
/home/ubuntu/catkin_ws/devel/lib/libubiquity_motor.so: /opt/ros/noetic/lib/librosconsole_backend_interface.so
/home/ubuntu/catkin_ws/devel/lib/libubiquity_motor.so: /usr/lib/arm-linux-gnueabihf/liblog4cxx.so
/home/ubuntu/catkin_ws/devel/lib/libubiquity_motor.so: /usr/lib/arm-linux-gnueabihf/libboost_regex.so.1.71.0
/home/ubuntu/catkin_ws/devel/lib/libubiquity_motor.so: /opt/ros/noetic/lib/libxmlrpcpp.so
/home/ubuntu/catkin_ws/devel/lib/libubiquity_motor.so: /opt/ros/noetic/lib/libdynamic_reconfigure_config_init_mutex.so
/home/ubuntu/catkin_ws/devel/lib/libubiquity_motor.so: /opt/ros/noetic/lib/libroscpp_serialization.so
/home/ubuntu/catkin_ws/devel/lib/libubiquity_motor.so: /opt/ros/noetic/lib/librostime.so
/home/ubuntu/catkin_ws/devel/lib/libubiquity_motor.so: /usr/lib/arm-linux-gnueabihf/libboost_date_time.so.1.71.0
/home/ubuntu/catkin_ws/devel/lib/libubiquity_motor.so: /opt/ros/noetic/lib/libcpp_common.so
/home/ubuntu/catkin_ws/devel/lib/libubiquity_motor.so: /usr/lib/arm-linux-gnueabihf/libboost_system.so.1.71.0
/home/ubuntu/catkin_ws/devel/lib/libubiquity_motor.so: /usr/lib/arm-linux-gnueabihf/libboost_thread.so.1.71.0
/home/ubuntu/catkin_ws/devel/lib/libubiquity_motor.so: /usr/lib/arm-linux-gnueabihf/libconsole_bridge.so.0.4
/home/ubuntu/catkin_ws/devel/lib/libubiquity_motor.so: /home/ubuntu/catkin_ws/devel/lib/libur_serial.so
/home/ubuntu/catkin_ws/devel/lib/libubiquity_motor.so: /usr/lib/arm-linux-gnueabihf/libboost_thread.so.1.71.0
/home/ubuntu/catkin_ws/devel/lib/libubiquity_motor.so: /usr/lib/arm-linux-gnueabihf/libboost_atomic.so.1.71.0
/home/ubuntu/catkin_ws/devel/lib/libubiquity_motor.so: ubiquity_motor/CMakeFiles/ubiquity_motor.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ubuntu/catkin_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX shared library /home/ubuntu/catkin_ws/devel/lib/libubiquity_motor.so"
	cd /home/ubuntu/catkin_ws/build/ubiquity_motor && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ubiquity_motor.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
ubiquity_motor/CMakeFiles/ubiquity_motor.dir/build: /home/ubuntu/catkin_ws/devel/lib/libubiquity_motor.so

.PHONY : ubiquity_motor/CMakeFiles/ubiquity_motor.dir/build

ubiquity_motor/CMakeFiles/ubiquity_motor.dir/clean:
	cd /home/ubuntu/catkin_ws/build/ubiquity_motor && $(CMAKE_COMMAND) -P CMakeFiles/ubiquity_motor.dir/cmake_clean.cmake
.PHONY : ubiquity_motor/CMakeFiles/ubiquity_motor.dir/clean

ubiquity_motor/CMakeFiles/ubiquity_motor.dir/depend:
	cd /home/ubuntu/catkin_ws/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ubuntu/catkin_ws/src /home/ubuntu/catkin_ws/src/ubiquity_motor /home/ubuntu/catkin_ws/build /home/ubuntu/catkin_ws/build/ubiquity_motor /home/ubuntu/catkin_ws/build/ubiquity_motor/CMakeFiles/ubiquity_motor.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : ubiquity_motor/CMakeFiles/ubiquity_motor.dir/depend

