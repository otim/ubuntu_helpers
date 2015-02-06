#!/bin/bash

echo "*** add user to dialout for asctec hl ***"
username=`whoami`
sudo adduser $username dialout
echo

# --- SET UP ROS ---

# add ros repository to package manager
UBUNTU_VERSION=$(lsb_release -a)
if [[ $UBUNTU_VERSION == *13.10* ]]
then 
    sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu saucy main" > /etc/apt/sources.list.d/ros-latest.list'
elif [[ $UBUNTU_VERSION == *14.04* ]]
then
    sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu trusty main" > /etc/apt/sources.list.d/ros-latest.list'
else
    echo "Unknown Ubuntu Version for ROS Indigo"
fi



# add key to ros repository
wget http://packages.ros.org/ros.key -O - | sudo apt-key add -

# update package manager
sudo apt-get update 

# install ros indigo
sudo apt-get install ros-indigo-desktop-full -y

# initialize rosdep
sudo rosdep init
rosdep update

# ros python install helper
sudo apt-get install python-rosinstall -y

# install node manager
sudo apt-get install ros-indigo-node-manager-fkie -y

# install catkin tools
sudo apt-get install python-catkin-tools -y


echo
echo "*** SETTING UP ROS ***"
echo

cd ~

source /opt/ros/indigo/setup.bash

# create catkin workspace
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/src
catkin_init_workspace

cd ~/catkin_ws/
catkin build

cd ~

# add ros to bash
sh -c 'echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc'
