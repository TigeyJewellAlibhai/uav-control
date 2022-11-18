## raspi

Login:
```
ssh ubuntu@pidrone.local
pass: ubuntu
```

Startup camera and mavros:
```
cd catkin_ws/src
roslaunch mavros apm.launch fcu_url:=/dev/ttyAMA0:921600
rosservice call /mavros/set_stream_rate 0 10 1

roslaunch raspicam_node camerav2_410x308_30fps.launch
```

Starting apriltag detection:
```
roslaunch raspicam_node camerav2_1280x960.launch enable_raw:=true
roslaunch apriltag_ros continuous_detection.launch camera_name:=raspicam_node image_topic:=image
```

CAREFUL:
```
cd uav_control
python3 vision1.py
```

CAREFUL:
```
cd aruco_gridboard/script
python3 mavros_control_square.py
```

---------------------------------------------------------------
## laptop

Start up laptop env:
```
source /opt/ros/noetic/setup.bash
export ROS_MASTER_URI="http://pidrone.local:11311"
cd catkin_ws/src
```

Watch things:
```
rqt
rviz
rostopic list
```
