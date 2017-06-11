## Using ROS in Arduino:

1. At first installl rosserial. To do that run the command, ```$sudo apt-get install ros-kinetic-rosserial ros-kinetic-rosserial-server ros-kinetic-rosserial-arduino ros-kinetic-rosserial-python```.If you want to do for any other ROS distro then change kinetic with the one you are using.
2. Go to your sketchbook directory of arduino and run the following command from terminal ```$rosrun rosserial_arduino make_libraries.py sketchbook/libraries```.Replace sketchbook/libraries with exact location of your sketchbook of arduino.
3. The above terminal command will create the needed libraries of ROS inside the arduino sketchbook.
4. After uploading the codes to arduino,run the following command: ```$rosrun rosserial_python serial_node.py /dev/ttyACM0```.
5. It should be first identified if the arduino is getting connected to the laptop through the port ttyACM0 or not.To check use command ```$ls /dev/```.Find the port that is used by arduino and then use that.
6. Here rosserial_python node act as a bridging node.
