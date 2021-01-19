#!/usr/bin/expect
set user "ubuntu"
set ip "192.168.0.104"
set password "ubuntu"
set timeout 20
#opensend a ssh link, the comment must begin at a new line
spawn ssh $user@$ip 
expect {
	"(yes/no)?" { send "yes\r"; exp_continue;}
	"password:" { send "$password\r"; exp_continue;}
	"*@*" { send "roslaunch turtlebot3_bringup turtlebot3_robot.launch\r"; }
}
interact


