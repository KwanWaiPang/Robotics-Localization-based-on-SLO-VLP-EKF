#! /bin/bash
# use to start the ROS server
gnome-terminal --window -e 'bash -c "roscore;exec bash"'
###############################################################
# rb1: _launch for control, _cam for webcam, _mvcam for VLC receiver
gnome-terminal --window -e 'bash -c "expect rb1_launch.sh;exec bash"'
gnome-terminal --window -e 'bash -c "expect rb1_launch_cam.sh;exec bash"'
gnome-terminal --window -e 'bash -c "expect rb1_launch_mvcam.sh;exec bash"'
###############################################################
sleep 2s
# start the keyboard control
gnome-terminal --window -e 'bash -c "roslaunch turtlebot3_teleop turtlebot3_teleop_key.launch;exec bash"'
# start the map window
gnome-terminal --window -e 'bash -c "roslaunch single_led EKF.launch;exec bash; echo \"map started.\""'

###############################################################
# rb2 control initialization 
#gnome-terminal --window -e 'bash -c "expect rb2_launch.sh;exec bash"'
#gnome-terminal --window -e 'bash -c "expect rb2_launch_cam.sh;exec bash"'
#gnome-terminal --window -e 'bash -c "expect rb2_launch_mvcam.sh;exec bash"'


