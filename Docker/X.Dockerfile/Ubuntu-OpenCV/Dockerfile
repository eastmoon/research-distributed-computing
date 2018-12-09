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
# Ref : https://www.learnopencv.com/install-opencv-4-on-ubuntu-16-04/
# Declare variable
ENV GIT_REPOSITORY /usr/git/
ENV OPENCV_VERSION 4.0.0
ENV OPENCV_REPOSITORY ${OPENCV_REPOSITORY}/opencv
ENV OPENCV_CONTRIB_REPOSITORY ${OPENCV_REPOSITORY}/opencv_contrib

# OpenCV common package
RUN \
  apt-get update -y && \
  apt-get install -y \
    # Compiler Tools
    build-essential \
    cmake \
    checkinstall \
    pkg-config \
    # Language Tools
    yasm \
    gfortran \
    # Python
    python-dev \
    python-numpy \
    # Install Library for GUI
    libgtk2.0-dev \
    libtbb2 \
    libtbb-dev \
    qt5-default \
    # Install Library for Video/Image/Audio process
    libavcodec-dev \
    libavformat-dev \
    libswscale-dev \
    libxine2-dev \
    libjpeg8-dev \
    libjpeg-dev \
    libpng-dev \
    libpng12-dev \
    libtiff-dev \
    libtiff5-dev \
    libjasper-dev \
    libgstreamer0.10-dev \
    libgstreamer-plugins-base0.10-dev \
    libfaac-dev \
    libmp3lame-dev \
    libtheora-dev \
    libvorbis-dev \
    libxvidcore-dev \
    libopencore-amrnb-dev \
    libopencore-amrwb-dev \
    libavresample-dev \
    x264 \
    ffmpeg-devel \
    # Install Library for mathematics
    libatlas-base-dev \
    # Install Library for hardware communication
    libdc1394-22-dev

# Download opencv source code
RUN \
  mkdir ${GIT_REPOSITORY} && \
  cd ${GIT_REPOSITORY} && \
  curl https://codeload.github.com/opencv/opencv/tar.gz/${OPENCV_VERSION} -o opencv-source.tar.gz && \
  curl https://codeload.github.com/opencv/opencv_contrib/tar.gz/${OPENCV_VERSION} -o opencv-contrib-source.tar.gz && \
  mkdir opencv && \
  mkdir opencv-contrib && \
  tar -zxf opencv-source.tar.gz -C ./opencv --strip-components=1 \
  tar -zxf opencv-contrib-source.tar.gz -C ./opencv-contrib --strip-components=1 \
  rm opencv-source.zip && \
  rm opencv-contrib-source.tar.gz

# Build opencv by cmake
RUN \
  cd ${OPENCV_REPOSITORY} && \
  mkdir build && \
  cd build && \
  cmake -D CMAKE_BUILD_TYPE=RELEASE \
        -D CMAKE_INSTALL_PREFIX=${OPENCV_REPOSITORY} \
        -D INSTALL_C_EXAMPLES=ON \
        -D WITH_TBB=ON \
        -D WITH_QT=ON \
        -D WITH_OPENGL=ON \
        -D OPENCV_EXTRA_MODULES_PATH=${OPENCV_CONTRIB_REPOSITORY}/modules \
        -D BUILD_EXAMPLES=ON ..
