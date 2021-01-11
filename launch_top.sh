#! /bin/bash
gnome-terminal --window -e 'bash -c "roscore;exec bash"'
gnome-terminal --window -e 'bash -c "expect launch.sh;exec bash"'
sleep 2s
gnome-terminal --window -e 'bash -c "roslaunch turtlebot3_teleop turtlebot3_teleop_key.launch;exec bash"'
