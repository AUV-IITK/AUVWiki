## Errors during repo running

### During GUI running
1. Make sure that the python code is indented properly.
2. Source your catkin workspace.

### During camera running
1. If the camera is not running inspite of correct node then its user permissions should be changed.
2. For identifying the port, connect only one camera at a time for identifying the port, run the command ```$ls /dev/video*```.
3. After obtaining the port of camera, run the commands ```$sudo chmod 777 /dev/<---camera port--->``` and ```$sudo chown auviitk:auviitk /dev/<---camera port--->```.

### ZSH corrupt file
1. Run the commands ```$mv .zsh_history .zsh_history_bad``` then ```$strings .zsh_history_bad > .zsh_history``` and ```$fc -R .zsh_history```.
