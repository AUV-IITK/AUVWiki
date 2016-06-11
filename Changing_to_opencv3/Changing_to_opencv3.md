### A Transition to the NEXT level
## After banging my head for about 4 hours I was finally able to run my opencv code through ROS.

+ add #include "opencv2/videoio/videoio.hpp" 
- #include "opencv2/core/core.hpp" in place of opencv2/core.hpp  (as all the header files are in a folder)
- in CMake add or replace the previously similar line with find_package( OpenCV 3.0.0 REQUIRED core highgui imgproc imgcodecs videoio (or any other dependent library))

If this does not work proceed to the next steps

+  1. download the script 'cv3,sh' in this repository.
   2. open a terminal in the same directory
   3. sudo cp -r cv3.sh /usr/local/bin/
   4. chmod +x cv3.sh
   5. cd /usr/local/bin/
   6. cv3.sh
   7. sit back and relax with a good internet
   8. cd ../include
   9. sudo mv opencv opencv2 ~/ (or delete them as they are useless)
   10. cd ../local/include 
   11. sudo cp -r opencv opencv2 /usr/include
