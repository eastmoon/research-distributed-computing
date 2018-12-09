FROM ubuntu:16.04

# Install common package
RUN \
  apt-get update -y && \
  apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    zip \
    unzip \
    software-properties-common

# Git
RUN \
  # Add Git repository reference into apt system
  add-apt-repository ppa:git-core/ppa && \
  # Install
  apt-get update -y && \
  apt-get install -y git

# OpenCV
# Ref : https://docs.opencv.org/3.4/d7/d9f/tutorial_linux_install.html
# Ref : https://docs.opencv.org/3.4.1/d2/de6/tutorial_py_setup_in_ubuntu.html
# Ref : https://github.com/nuveo/docker-opencv/blob/master/debian/python3/2/Dockerfile

# OpenCV common package
RUN \
  apt-get update -y && \
  apt-get upgrade -y && \
  apt-get install -y \
    # Compiler Tools
    build-essential \
    cmake \
    pkg-config \
    # Python
    python-dev \
    python-numpy \
    # Install Library for GUI
    libgtk2.0-dev \
    libtbb2 \
    libtbb-dev \
    # Install Library for Video/Image/Audio process
    libavcodec-dev \
    libavformat-dev \
    libswscale-dev \
    libjpeg-dev \
    libpng-dev \
    libtiff-dev \
    libjasper-dev \
    # Install Library for hardware communication
    libdc1394-22-dev

# Set v41 link
RUN \
  cd /usr/include/linux && \
  ln -s -f ../libv4l1-videodev.h videodev.h && \
  cd /

# Declare variable
ENV GIT_REPOSITORY /usr/git
ENV OPENCV_VERSION 4.0.0
ENV OPENCV_REPOSITORY ${GIT_REPOSITORY}/opencv
ENV OPENCV_CONTRIB_REPOSITORY ${GIT_REPOSITORY}/opencv-contrib

# Download opencv source code
RUN \
  mkdir ${GIT_REPOSITORY} && \
  cd ${GIT_REPOSITORY} && \
  curl https://codeload.github.com/opencv/opencv/tar.gz/${OPENCV_VERSION} -o opencv-source.tar.gz && \
  curl https://codeload.github.com/opencv/opencv_contrib/tar.gz/${OPENCV_VERSION} -o opencv-contrib-source.tar.gz && \
  mkdir ${OPENCV_REPOSITORY} && \
  mkdir ${OPENCV_CONTRIB_REPOSITORY} && \
  tar -zxf opencv-source.tar.gz -C ${OPENCV_REPOSITORY} --strip-components=1 && \
  tar -zxf opencv-contrib-source.tar.gz -C ${OPENCV_CONTRIB_REPOSITORY} --strip-components=1 && \
  rm opencv-source.tar.gz && \
  rm opencv-contrib-source.tar.gz

# Build opencv by cmake
RUN \
  cd ${OPENCV_REPOSITORY} && \
  mkdir build && \
  cd build && \
  cmake -D CMAKE_BUILD_TYPE=RELEASE \
        -D CMAKE_INSTALL_PREFIX=${OPENCV_REPOSITORY} \
        -D OPENCV_EXTRA_MODULES_PATH=${OPENCV_CONTRIB_REPOSITORY}/modules \
        -D BUILD_EXAMPLES=ON ..

RUN \
  cd ${OPENCV_REPOSITORY}/build && \
  make -j7 && \
  make install && \
  pip install --upgrade pip opencv-python
