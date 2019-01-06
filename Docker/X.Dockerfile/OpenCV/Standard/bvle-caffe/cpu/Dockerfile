# Base OS Use with bvlc/caffe cpu
FROM bvlc/caffe:cpu

# KEEP OS LIBRARY UP TO DATE

RUN \
  apt-get -y update && \
  apt-get -y upgrade && \
  apt-get -y dist-upgrade && \
  apt-get -y autoremove

# Common library
RUN \
  apt-get update -y && \
  apt-get install -y \
    apt-transport-https \
    ca-certificates \
    wget \
    curl \
    software-properties-common

# OpenCV
# Ref : https://docs.opencv.org/3.4/d7/d9f/tutorial_linux_install.html
# Ref : https://docs.opencv.org/3.4.1/d2/de6/tutorial_py_setup_in_ubuntu.html
# Ref : https://github.com/nuveo/docker-opencv/blob/master/debian/python3/2/Dockerfile
RUN \
  apt-get update -y && \
  apt-get install -y \
    # Build tools:
    build-essential cmake \
    # Python:
    python-dev python-numpy \
    # GUI:
    libgtk2.0-dev \
    # Media I/O:
    libjpeg-dev libwebp-dev libpng-dev libtiff5-dev libjasper-dev libopenexr-dev libgdal-dev \
    # Video I/O:
    libdc1394-22-dev libavcodec-dev libavformat-dev libswscale-dev libtheora-dev libvorbis-dev libxvidcore-dev libx264-dev yasm libopencore-amrnb-dev libopencore-amrwb-dev libv4l-dev libxine2-dev

# In this image, python3.4 is default, but not install pip module.
# Install pip
RUN \
  curl https://bootstrap.pypa.io/get-pip.py | python

# Declare variable
ENV GIT_REPOSITORY /usr/local
ENV OPENCV_VERSION 3.4.2
ENV OPENCV_REPOSITORY ${GIT_REPOSITORY}/opencv
ENV OPENCV_CONTRIB_REPOSITORY ${GIT_REPOSITORY}/opencv-contrib

# Download opencv source code
RUN \
  cd ${GIT_REPOSITORY} && \
  curl https://codeload.github.com/opencv/opencv/tar.gz/${OPENCV_VERSION} -o opencv-source.tar.gz && \
  curl https://codeload.github.com/opencv/opencv_contrib/tar.gz/${OPENCV_VERSION} -o opencv-contrib-source.tar.gz && \
  mkdir ${OPENCV_REPOSITORY} && \
  mkdir ${OPENCV_CONTRIB_REPOSITORY} && \
  tar -zxf opencv-source.tar.gz -C ${OPENCV_REPOSITORY} --strip-components=1 && \
  tar -zxf opencv-contrib-source.tar.gz -C ${OPENCV_CONTRIB_REPOSITORY} --strip-components=1 && \
  rm opencv-source.tar.gz && \
  rm opencv-contrib-source.tar.gz

# Generate build information by cmake
RUN \
  cd ${OPENCV_REPOSITORY} && \
  mkdir build && \
  cd build && \
  cmake -D CMAKE_BUILD_TYPE=RELEASE \
        -D CMAKE_INSTALL_PREFIX=${OPENCV_REPOSITORY} \
        -D OPENCV_EXTRA_MODULES_PATH=${OPENCV_CONTRIB_REPOSITORY}/modules \
        -D PYTHON2_EXECUTABLE=/usr/bin/python2.7 \
        -D OPENCV_PYTHON2_INSTALL_PATH=/usr/local/lib/python2.7/dist-packages \
        -D BUILD_EXAMPLES=ON ..

# Build & Install
RUN \
  cd ${OPENCV_REPOSITORY}/build && \
  make -j5 && \
  make install

# Copy python library
# Ref :https://breakthrough.github.io/Installing-OpenCV/#compiling-and-installing-opencv
# RUN \
#   cp ${OPENCV_REPOSITORY}/lib/cv2.so /usr/local/lib/python2.7/dist-packages/
#   cp ${OPENCV_REPOSITORY}/lib/python3/* /usr/local/lib/python3.4/dist-packages/
