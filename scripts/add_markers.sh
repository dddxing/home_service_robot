#!/bin/sh

CATKIN_DIR="$( cd $( dirname $BASH_SOURCE[0] )/../.. >/dev/null && pwd )"
export TURTLEBOT_3D_SENSOR="kinect"
export ROBOT_INITIAL_POSE="-x 0 -y 0 -Y 0"

xterm -e " source /opt/ros/kinetic/setup.bash" &
sleep 5

xterm -e "roslaunch turtlebot_gazebo turtlebot_world.launch world_file:=/home/daming/udacity/catkin_ws/src/world/DamingWorld.world" &
sleep 5

xterm -e "roslaunch turtlebot_gazebo amcl_demo.launch map_file:=/home/daming/udacity/catkin_ws/src/map/map.yaml" &
sleep 5

xterm -e "roslaunch turtlebot_rviz_launchers view_navigation_daming.launch" &
sleep 5

xterm -e "rosrun add_markers add_markers" 


