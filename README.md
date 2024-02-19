# OpenCV MinGW
This are instructions on how to build OpenCV from the original source. 

Compiled in Linux to run on Windows 10 64 bits.

For 32 bits, just change the ``mingw64_toolchain.cmake`` to ``mingw32_toolchain.cmake`` and use ``i686-w64-mingw32-g++`` instead of  ``x86_64-w64-mingw32-g++`` to compile. 

## Replication Instructions

### Create the build docker enviroment
On your Windows machine install Docker, open CMD and type these commands:

> cd /choose/any/path

> docker pull debian:11

> docker run -it --name=opencv_mingw  -v .:/output debian:11

> docker exec -it opencv_mingw /bin/sh

### Install linux dependencies
Now you are no longer in Windows, but inside a Linux Docker running Debian. Type these commands.

> apt update && apt install mingw-w64 make cmake g++ git -y

> mkdir /external && cd /external

### Clone this repository

> git clone https://github.com/savethebeesandseeds/opencv_mingw


### Download mingw-std-threads (as MinGW does not support linux threads)

> cd /external

> git clone https://github.com/meganz/mingw-std-threads

> cp /external/opencv_mingw/resources/generate-std-like-headers.sh /external/mingw-std-threads

> cd /external/mingw-std-threads

> chmod +x /external/mingw-std-threads/generate-std-like-headers.sh

> ./generate-std-like-headers.sh

### Download OpenCV source

> cd /external/

> git clone https://github.com/opencv/opencv.git

### Build OpenCV from source to target a Windows enviroment

Notice how many of the functionalities have been left outside, this is why i didn't distribute the build, I think it might offuscate people. 

> cp /external/opencv_mingw/resources/mingw64_toolchain.cmake /external/opencv

> cd /external/opencv

> mkdir build

> cd /external/opencv/build

> cmake \
      -DCMAKE_CXX_STANDARD=11 \
      -DCMAKE_INSTALL_PREFIX=/usr/x86_64-w64-mingw32-g++ \
      -DBUILD_SHARED_LIBS=OFF \
      -DBUILD_opencv_calib3d=OFF \
      -DBUILD_opencv_calib3d=OFF \
      -DBUILD_opencv_dnn=OFF \
      -DBUILD_opencv_features2d=OFF \
      -DBUILD_opencv_flann=OFF \
      -DBUILD_opencv_gapi=OFF \
      -DBUILD_opencv_highgui=OFF \
      -DBUILD_opencv_java=OFF \
      -DBUILD_opencv_js=OFF \
      -DBUILD_opencv_ml=OFF \
      -DBUILD_opencv_objc=OFF \
      -DBUILD_opencv_objdetect=OFF \
      -DBUILD_opencv_photo=OFF \
      -DBUILD_opencv_python3=OFF \
      -DBUILD_opencv_python2=OFF \
      -DBUILD_opencv_stitching=OFF \
      -DBUILD_opencv_ts=OFF \
      -DBUILD_opencv_video=OFF \
      -DBUILD_opencv_videoio=OFF \
      -DBUILD_opencv_world=OFF \
      -DBUILD_PROTOBUF=OFF \
      -DCMAKE_TOOLCHAIN_FILE=/external/opencv/mingw64_toolchain.cmake \
      /external/opencv

> make -j4

### Compile the test .exe code to run on Windows

> cd /src

> make test

On windows go to /choose/any/path and you'll see the test.exe, that you can no run with double click. 