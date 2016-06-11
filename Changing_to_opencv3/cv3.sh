#!/bin/bash
mkdir tmp
cd tmp
# the two lines below will fail in case it's not the first time we clone
git clone https://github.com/Itseez/opencv.git
git clone https://github.com/Itseez/opencv_contrib.git

# revert the main CMakeLists.txt file in case it's not the first time
cd opencv
git clean -dxf
git reset --hard HEAD
git pull --rebase
# this tag is from April 14th 2016 and fixes compilation on OSX
git checkout 0df901b3891a8e3983bc4ad488289efe865eb87c

cd ../opencv_contrib
git pull --rebase
cd ../

cp -fr ./opencv_contrib/modules ./opencv/opencv_contrib

cd opencv
# revert the main CMakeLists.txt file in case it's not the first time
cd opencv && git checkout CMakeLists.txt && cd ../
sed -i 's/set(OPENCV_EXTRA_MODULES_PATH "" CACHE PATH "Where to look for additional OpenCV modules")/set(OPENCV_EXTRA_MODULES_PATH "${CMAKE_CURRENT_SOURCE_DIR}\/opencv_contrib\/" CACHE PATH "Where to look for additional OpenCV modules")/' ./CMakeLists.txt
# Disable tests
sed -i 's/OCV_OPTION(BUILD_PERF_TESTS         "Build performance tests"                     ON  IF (NOT APPLE_FRAMEWORK) )/OCV_OPTION(BUILD_PERF_TESTS         "Build performance tests"                     OFF)/' ./CMakeLists.txt
sed -i 's/OCV_OPTION(BUILD_TESTS              "Build accuracy \& regression tests"           ON  IF (NOT APPLE_FRAMEWORK) )/OCV_OPTION(BUILD_TESTS              "Build accuracy \& regression tests"           OFF)/' ./CMakeLists.txt
# Enable Qt
sed -i 's/OCV_OPTION(WITH_QT             "Build with Qt Backend support"               OFF  IF (NOT ANDROID AND NOT IOS AND NOT WINRT) )/OCV_OPTION(WITH_QT             "Build with Qt Backend support"               ON  IF (NOT ANDROID AND NOT IOS AND NOT WINRT) )/' ./CMakeLists.txt
# Enable mangled path to have two OpenCV installable side by side
sed -i 's/OCV_OPTION(INSTALL_TO_MANGLED_PATHS "Enables mangled install paths, that help with side by side installs." OFF IF (UNIX AND NOT ANDROID AND NOT APPLE_FRAMEWORK AND BUILD_SHARED_LIBS) )/OCV_OPTION(INSTALL_TO_MANGLED_PATHS "Enables mangled install paths, that help with side by side installs." ON)/' ./CMakeLists.txt                                                                           
#sed -i 's/OCV_OPTION(WITH_IPP            "Include Intel IPP support"                   NOT MINGW IF (X86_64 OR X86) AND NOT WINRT )/OCV_OPTION(WITH_IPP            "Include Intel IPP support"                   OFF)/' ./CMakeLists.txt                                 
sed -i 's/set(OPENCV_DLLVERSION "")/set(OPENCV_DLLVERSION "3")/' ./CMakeLists.txt                                                    
echo "install(FILES package.xml DESTINATION share/opencv3)" >> ./CMakeLists.txt                                                      
                                                                                                                                     
cd ../                                                                                                                               
                                                                                                                                     
# when configuring bloom the first time, use the tar file created above                                                              
rm ./opencv.tar.gz                                                                                                                   
tar --exclude-vcs -zcvf ./opencv.tar.gz ./opencv/* 