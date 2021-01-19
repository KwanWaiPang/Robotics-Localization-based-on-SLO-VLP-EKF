#! /bin/bash
# use to start the ROS server
# Comment out this line if the ROS master is on ther servr and this laptop is jsut a host. 
# gnome-terminal --window -e 'bash -c "roscore;exec bash"'
###############################################################
# rb1: _launch for control, _cam for webcam, _mvcam for VLC receiver
gnome-terminal --window -e 'bash -c "expect srb_launch.sh;exec bash"'
gnome-terminal --window -e 'bash -c "expect srb_launch_cam.sh;exec bash"'
gnome-terminal --window -e 'bash -c "expect srb_launch_mvcam.sh;exec bash"'
# start the keyboard control
gnome-terminal --window -e 'bash -c "rosrun turtlebot3_teleop turtlebot3_teleop_key;exec bash"'
gnome-terminal --window -e 'bash -c "rosrun image_view image_view image:=/usb_cam/image_raw;exec bash"'


###############################################################

sleep 2s
# This is for a common keyboard
# gnome-terminal --window -e 'bash -c "roslaunch turtlebot3_teleop turtlebot3_teleop_key.launch;exec bash"'
# start the map and display window
gnome-terminal --window -e 'bash -c "rosrun single_led single_led_locator_multi_spin_odom_ROI_from_mvcam_ID_decoding;exec bash"'
gnome-terminal --window -e 'bash -c "roslaunch turtlebot3_navigation turtlebot3_navigation.launch map_file:=$HOME/map/3.yaml;exec bash"'
gnome-terminal --window -e 'bash -c "roslaunch robot_localization ekf_template_single.launch;exec bash"'
gnome-terminal --window -e 'bash -c "rosrun single_led ekf_translater;exec bash"'



