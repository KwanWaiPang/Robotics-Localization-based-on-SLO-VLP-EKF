#!/usr/bin/expect
# update ip address and need to change tb_1, tb_2, and tb_3 
set user "ubuntu"
set ip "192.168.0.102"
set password "ubuntu"
set timeout 20
#opensend a ssh link, the comment must begin at a new line
spawn ssh $user@$ip 
expect {
	"(yes/no)?" { send "yes\r"; exp_continue;}
	"password:" { send "$password\r"; exp_continue;}
	"*@*" { send "rosrun mvcam mvcam_ROI_max_flag __ns:=tb_2\r"; }
}
interact


