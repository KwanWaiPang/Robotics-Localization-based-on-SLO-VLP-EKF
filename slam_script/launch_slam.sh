#! /bin/bash
# for use as the master, uncomment below 
gnome-terminal --window -e 'bash -c "roscore;exec bash"'
###############################################################
gnome-terminal --window -e 'bash -c "expect rb_launch.sh;exec bash"'
sleep 10s
gnome-terminal --window -e 'bash -c "roslaunch turtlebot3_slam turtlebot3_slam.launch;exec bash"'
###############################################################
#export TURTLEBOT3_MODEL=burger
###############################################################
sleep 10s
gnome-terminal --window -e 'bash -c "roslaunch turtlebot3_teleop turtlebot3_teleop_key.launch;exec bash"'
