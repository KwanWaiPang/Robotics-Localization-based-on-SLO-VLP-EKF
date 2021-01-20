# Toturial for ROS and VLP system installation
## Ubuntu Installation
1. Ubuntu 18.04 LTS is needed in the installation.
2. Download the Desktop version under the following link: 
[Ubuntu 18.04 LTS link](https://ubuntu.com/download/alternative-downloads)
3. Burn the system iso file into a USB disk as the following link:
[How to create a USB Stick](https://ubuntu.com/tutorials/create-a-usb-stick-on-windows#1-overview)
4. Install the system in the target computer.
If you want to install a brant new ubuntu system in you computer. Insert the stick USB disk and  go into the BIOS and set the computer boot from the USB disk. 
If you want to install a ubuntu system under your original Windows system. You can refer to the following link: [How to install the dual system in your computer](https://itsfoss.com/install-ubuntu-1404-dual-boot-mode-windows-8-81-uefi/)
5. Install GitHub in the system


## ROS melodic Installation
[Reference source](http://wiki.ros.org/melodic/Installation/Ubuntu)
1. Add the source from "packages.ros.org" to the source list of the target computer.

```shell
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
```
2. Set key:
```shell
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
```
3. Source Update
```shell
sudo apt update
```
4. Desktop environment installation
The complete installation includes ROS, rqt, rviz, robot-generic libraries, 2D/3D simulators 和 2D/3D perception and so on.
```shell
sudo apt install ros-melodic-desktop-full 
```
5. Install rospack-tools:
```shell
sudo apt install rospack-tools.
```

6. ROS desktop Initialization:
You need to intialize the rosdep before using. 
```shell
sudo rosdep init
rosdep update
```

6. Environment variables setting:
Add the environment variables of the whole system in .bashrc so it can be activated when a new shell is opened. We have provided a .bashrc file including all the enviroment setting we need.
So we just need to add the path of this file into the .bashrc file under home folder.
* first method:
```shell
echo "source ~/Robotics-Localization-based-on-SLO-VLP-EKF/.bashrc_vlp" >> ~/.bashrc
```
* second method:
Using the text editor like VScode, gedit to open the .bashrc file and then add the sentence "source ~/Robotics-Localization-based-on-SLO-VLP-EKF/.bashrc_vlp" at the end of this file.

7. Edit the .bashrc_vlp file to config the enviroment:
Modifiy the network settings: Add "export ROS_HOSTNAME=xxx.xxx.xxx.xxx" and "export ROS_MASTER_URI=http://xxx.xxx.xxx.xxx:11311" in the end of .bashrc_vlp file. The first is the ip address of your computer in the local area network. The second is the ip address of the master node.

8. After the modification, source .bashrc file to avtivate the settings.
```shell
source ~/.bashrc
```

## turtlebot3 and dependency installation
[Reference source](https://emanual.robotis.com/docs/en/platform/turtlebot3/quick-start/#pc-setup)
1. Install the dependent package
```shell
sudo apt install ros-melodic-joy ros-melodic-teleop-twist-joy ros-melodic-teleop-twist-keyboard ros-melodic-laser-proc ros-melodic-rgbd-launch ros-melodic-depthimage-to-laserscan ros-melodic-rosserial-arduino ros-melodic-rosserial-python ros-melodic-rosserial-server ros-melodic-rosserial-client ros-melodic-rosserial-msgs ros-melodic-amcl ros-melodic-map-server ros-melodic-move-base ros-melodic-urdf ros-melodic-xacro ros-melodic-compressed-image-transport ros-melodic-rqt-image-view ros-melodic-gmapping ros-melodic-navigation ros-melodic-interactive-markers ros-melodic-turtlebot3-gazebo
```
2. create the workspace in ~/ path
```shell
mkdir ~/catkin_ws
cd catkin_ws
mkdir src
cd src
```
3. Copy the folder ~/Robotics-Localization-based-on-SLO-VLP-EKF/turtlebot3 and ~/Robotics-Localization-based-on-SLO-VLP-EKF/turtlebot3_msgs under the ~/catkin_ws/src you create.
'''shell
cp -r ~/Robotics-Localization-based-on-SLO-VLP-EKF/turtlebot3 ~/catkin_ws/src
cp -r ~/Robotics-Localization-based-on-SLO-VLP-EKF/turtlebot3_msgs ~/catkin_ws/src
'''

3. locate to the path ~/catkin_ws and complile the robot project.
```shell
cd ~/catkin_ws && catkin_make
```

## Installation test
1. After the installation above is done, we need try to control the robot to verify whehter the installation is successful.
2. Before run the script, expect package need to be installed.
```shell
sudo apt install expect
```
3. locate under ~/Robotics-Localization-based-on-SLO-VLP-EKF/simple_control_script
4. Change the ip address in launch.sh to the ip address of the robot you want to control.
5. Then run the lauch.sh in the terminal.
```shell
cd  ~/Robotics-Localization-based-on-SLO-VLP-EKF/simple_control_script
sh launch_top.sh
```
6. Then you can use "w","s","x","a"and"d" to control the movement of the robot in the control window.

If the test is done. Congratulations! The installation is done.

## VLP software installation:
1. download the zip file from [link_3](https://github.com/KwanWaiPang/SLO-VLP-EKF/blob/main/vlp%20package.zip) and unzip to get two .deb package.
2. Add some alias into the ~/.bashrc so you could start and control the robot easier:
Add "alias cw='cd ~/catkin_ws'
alias cs='cd ~/catkin_ws/src'
alias cm='cd ~/catkin_ws && catkin_make -DCMAKE_BUILD_TYPE=Debug'
alias CM='cd ~/catkin_ws && catkin_make -DCMAKE_BUILD_TYPE=Debug'
alias rb1='ssh ubuntu@xxx.xxx.xxx.xxx'
alias ekf='roslaunch single_led EKF.launch'
alias keyboard='roslaunch turtlebot3_teleop turtlebot3_teleop_key.launch'"
into ~/.bashrc file
The ip address after rb1 is the ip adress of the robot we want to control.
## Start the robot and map:
1. open a new terminate and input "rb1" to connect the first robot and input "start" to start the VLP program . Open another terminate and input "rb2" to connect the second robot and input "start" to start the VLP program in the second robot.
2. Open another terminate and input "ekf" to open the map app.
3.dfd
