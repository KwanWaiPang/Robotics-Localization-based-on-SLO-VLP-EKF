#! /bin/bash
# Comment out this line if the ROS Master is already running and this laptop is used a host.
# gnome-terminal --window -e 'bash -c "roscore;exec bash"'
###############################################################
# rb1: _launch for control, _cam for webcam, _mvcam for VLC receiver
gnome-terminal --window -e 'bash -c "expect rb1_launch.sh;exec bash"'
gnome-terminal --window -e 'bash -c "expect rb1_launch_cam.sh;exec bash"'
gnome-terminal --window -e 'bash -c "expect rb1_launch_mvcam.sh;exec bash"'
# start the keyboard control
gnome-terminal --window -e 'bash -c "ROS_NAMESPACE=tb_1 rosrun turtlebot3_teleop turtlebot3_teleop_key;exec bash"'
#gnome-terminal --window -e 'bash -c "rosrun image_view image_view image:=/tb_1/usb_cam/image_raw"'

###############################################################
# rb2 control initialization 
# gnome-terminal --window -e 'bash -c "expect rb2_launch.sh;exec bash"'
# gnome-terminal --window -e 'bash -c "expect rb2_launch_cam.sh;exec bash"'
# gnome-terminal --window -e 'bash -c "expect rb2_launch_mvcam.sh;exec bash"'
# start the keyboard control
# gnome-terminal --window -e 'bash -c "ROS_NAMESPACE=tb_2 rosrun turtlebot3_teleop turtlebot3_teleop_key;exec bash"'
#gnome-terminal --window -e 'bash -c "rosrun image_view image_view image:=/tb_2/usb_cam/image_raw"'

###############################################################
# rb3 control initialization 
# gnome-terminal --window -e 'bash -c "expect rb3_launch.sh;exec bash"'
# gnome-terminal --window -e 'bash -c "expect rb3_launch_cam.sh;exec bash"'
# gnome-terminal --window -e 'bash -c "expect rb3_launch_mvcam.sh;exec bash"'
# start the keyboard control
# gnome-terminal --window -e 'bash -c "ROS_NAMESPACE=tb_3 rosrun turtlebot3_teleop turtlebot3_teleop_key;exec bash"'
#gnome-terminal --window -e 'bash -c "rosrun image_view image_view image:=/tb_3/usb_cam/image_raw"'

###############################################################

sleep 2s
# This is only for a common keyboard to simultaneously control all three robots.
# gnome-terminal --window -e 'bash -c "roslaunch turtlebot3_teleop turtlebot3_teleop_key.launch;exec bash"'

# start the map and display window
gnome-terminal --window -e 'bash -c "roslaunch single_led EKF.launch;exec bash"'




