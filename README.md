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
5. ROS desktop Initialization:
You need to intialize the rosdep before using. 
```shell
sudo rosdep init
rosdep update
```
if it shows "the command cannot be found.". Then you need to install rospack-tools and then run the intialization again.
```shell
sudo apt install rospack-tools.
```
6. Environment variables setting:
Add the environment variables of the rosdep in .bashrc so it can be activated when a new shell is opened. 
* first method:
```shell
echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
```
* second method:
Using the text editor like VScode, gedit to open the .bashrc file and then add the sentence "source /opt/ros/melodic/setup.bash" at the end of this file.


## turtlebot3 and dependency installation
[Reference source](https://emanual.robotis.com/docs/en/platform/turtlebot3/quick-start/#pc-setup)
1. Edit the /opt/ros/melodic/setup.bash file to config the enviroment:
Add the network settings: Add "export ROS_HOSTNAME=xxx.xxx.xxx.xxx" and "export ROS_MASTER_URI=http://xxx.xxx.xxx.xxx:11311" in the end of setup.bash file. The first is the ip address of your computer in the local area network. The second is the ip address of the master node.
After all enviroment settings are completed, running the following command to activate the settings:
```shell
source /opt/ros/melodic/setup.bash 
```
2. Install the dependent package
```shell
sudo apt install ros-melodic-desktop-full ros-melodic-joy ros-melodic-teleop-twist-joy ros-melodic-teleop-twist-keyboard ros-melodic-laser-proc ros-melodic-rgbd-launch ros-melodic-depthimage-to-laserscan ros-melodic-rosserial-arduino ros-melodic-rosserial-python ros-melodic-rosserial-server ros-melodic-rosserial-client ros-melodic-rosserial-msgs ros-melodic-amcl ros-melodic-map-server ros-melodic-move-base ros-melodic-urdf ros-melodic-xacro ros-melodic-compressed-image-transport ros-melodic-rqt-image-view ros-melodic-gmapping ros-melodic-navigation ros-melodic-interactive-markers ros-melodic-turtlebot3-gazebo
```
3. create the workspace in ~/ path
```shell
mkdir ~/catkin_ws
cd catkin_ws
mkdir src
cd src
mkdir turtlebot3
```
download the zip file form [link_1](https://github.com/KwanWaiPang/SLO-VLP-EKF/tree/master) and unzip into turtlebot3 folder.
download the zip file from [link_2](https://github.com/KwanWaiPang/SLO-VLP-EKF/blob/main/turtlebot3_msgs.zip) and unzip into catkin_ws folder.

4. locate to the path ~/catkin_ws and make
```shell
cd ~/catkin_ws && catkin_make
```
5. Environment variables setting:
Add "source ~/catkin_ws/devel/setup.bash" for the enviroment varibles for the robot.
Add "export TURTLEBOT3_MODEL=burger" for robot configuration in ~/.bashrc file.

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
