## RUNNING THE REPOSITORY

### INITIAL CONNECTION AND NETWORK ESTABLISHMENT

1. Connect router to the NUC via a LAN cable ( preferably by a short LAN cable) and then connect the router to your laptop by another LAN cable(preferably a shorter one).The NUC should be connected to the appropriate power supply as well as the router.
2. Switch on the NUC (short press for 2-3 sec.). A blue light should indicate that it is on. Make sure all LAN's are connected properly. 
3. Open a terminal on your laptop and type 
            ```$ssh -X auviitk@varun.local``` 
On being prompted, type the password for the NUC.
4. After acceptance of password type 
            ```$gnome-terminal``` 
and then press enter.
5. Increase the number of terminal windows in the new window opened by pressing ctrl+shift+T.
6. open 
            ```$roscore```
in one window.

### ARDUINO AND ROSSERIAL
7. type 
            ```$arduino```
in another window. Arduino ide will open. Go to File-->Sketchbook-->new_arduino.
8. The code  will open in a new arduino window. upload it on the arduino, and minimize the window. 
9. In the new terminal window, type 
            ```$rosrun rosserial_python serial_node.py /dev/arduino```

and press enter.

### CAMERA TESTING
10. For the camera : run in a new window 
            ```$roslaunch hardware_ arduino hardware_nodes.launch```
This will launch all the nodes.
11. To see the feed from the front camera, run 
            ```$rosrun image_view image_view image:=/varun/sensors/front_camera/image_raw```
12. To see the feed from the bottom camera, run
            ```$rosrun image_view image_view image:=/varun/sensors/bottom_camera/image_raw```

### GUI SETUP
13. run 
            ```$rosrun remote_control remote_gui.py```
in one terminal window and in another run 
            ```$rosrun remote_control monitor.py```
 Note: you have to run the gui using keyboard(W,A,S,D) and not by mouse.
### THRUSTER TESTING
14. First, make sure that the rosserial node is running.
15. Then run 
            ```$rostopic pub /pwm/forward std_msgs/Int32 -- <pwm_value>```
16. Similarly for sideward and upward replace forward with sideward or upward respectively in the above command.
17. To stop the thruster break from the command by pressing Ctrl+C and then run the above command with 0 pwm value.
18. To reverse the direction of the thrusters, enter the pwm value with a minus sign in front.

### PRESSURE SENSOR DATA
19. To view the data being published type the command
            ```$rostopic echo /varun/sensors/pressure_sensor/depth```
and run it.

