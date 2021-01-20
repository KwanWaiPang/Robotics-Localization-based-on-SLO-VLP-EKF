#!/usr/bin/expect
# update ip address and need to change tb_1, tb_2, and tb_3 
set user "ubuntu"
set ip "192.168.0.106"
set password "ubuntu"
set timeout 20
#opensend a ssh link, the comment must begin at a new line
spawn ssh $user@$ip 
expect {
	"(yes/no)?" { send "yes\r"; exp_continue;}
	"password:" { send "$password\r"; exp_continue;}
	"*@*" { send "ROS_NAMESPACE=tb_2 roslaunch turtlebot3_bringup turtlebot3_robot.launch multi_robot_name:=\"tb_2\" set_lidar_frame_id:=\"tb_2/base_scan\"\r"; }
}
interact


