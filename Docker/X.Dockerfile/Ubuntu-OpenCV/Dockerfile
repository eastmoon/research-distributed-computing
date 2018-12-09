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
# Ref : https://www.learnopencv.com/install-opencv-4-on-ubuntu-16-04/

# OpenCV common package
RUN \
  apt-get update -y && \
  apt-get upgrade -y && \
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
    libv4l-dev \
    v4l-utils \
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
    # Install Library for mathematics
    libatlas-base-dev \
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
ENV OPENCV_REPOSITORY ${OPENCV_REPOSITORY}/opencv
ENV OPENCV_CONTRIB_REPOSITORY ${OPENCV_REPOSITORY}/opencv_contrib

# Download opencv source code
RUN \
  mkdir ${GIT_REPOSITORY} && \
  cd ${GIT_REPOSITORY} && \
  curl https://codeload.github.com/opencv/opencv/tar.gz/${OPENCV_VERSION} -o opencv-source.tar.gz && \
  curl https://codeload.github.com/opencv/opencv_contrib/tar.gz/${OPENCV_VERSION} -o opencv-contrib-source.tar.gz && \
  mkdir opencv && \
  mkdir opencv-contrib && \
  tar -zxf opencv-source.tar.gz -C ./opencv --strip-components=1 && \
  tar -zxf opencv-contrib-source.tar.gz -C ./opencv-contrib --strip-components=1 && \
  rm opencv-source.tar.gz && \
  rm opencv-contrib-source.tar.gz


# OpenCV-Python build setting
# create virtual environment
ENV OPENCV_PYTHON3_WRAPPER ${GIT_REPOSITORY}/opencv-python3
# Install python 3
RUN \
  apt-get install -y python3-dev python3-pip python3-venv python3-testresources && \
  pip3 install -U pip numpy
# Startup virtual environment
RUN \
  python3 -m venv ${OPENCV_PYTHON3_WRAPPER}
RUN \
  source ${OPENCV_PYTHON3_WRAPPER}/bin/activate
# now install python libraries within this virtual environment
RUN \
  pip install \
    wheel \
    numpy \
    scipy \
    matplotlib \
    scikit-image \
    scikit-learn \
    ipython && \
RUN \
  pip install \
    dlib && \
  # quit virtual environment
  deactivate

# Build opencv by cmake
RUN \
  cd ${OPENCV_REPOSITORY} && \
  mkdir build && \
  cd build
