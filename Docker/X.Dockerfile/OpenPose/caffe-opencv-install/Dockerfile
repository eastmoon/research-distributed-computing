# Base OS Use with cuda for ubuntu
# Ref : https://hub.docker.com/r/nvidia/cuda/
# Version : Cuda 8.0 , cudnn 6, ubuntu 14.04
#FROM nvidia/cuda:8.0-cudnn6-devel-ubuntu14.04

# Ref : https://hub.docker.com/r/bvlc/caffe
# Version : Cuda 8.0 , cudnn 6, ubuntu 16.04
FROM bvlc/caffe:gpu

# Common library
RUN \
  apt-get update -y && \
  apt-get install -y \
    apt-transport-https \
    ca-certificates \
    wget \
    curl \
    software-properties-common

# Git
RUN \
  # Add Git repository reference into apt system
  add-apt-repository ppa:git-core/ppa && \
  # Install
  apt-get update -y && \
  apt-get install -y git

# Install OpenCV & OpenCV-Python
# Ref : https://pypi.org/project/opencv-python/

# Python2 package
RUN \
  apt-get update -y && \
  apt-get install -y \
    # Python
    python-dev \
    python-pip
# Install Opencv-Python
# bvlc official image have python2, it will not install base package, upgrade it.
RUN \
  pip install --upgrade pip numpy&& \
  pip install opencv-python-headless opencv-contrib-python-headless

# Python3 package
RUN \
  apt-get update -y && \
  apt-get install -y \
    python3 \
    python3-dev \
    python3-pip
# Install Opencv-Python
RUN \
  pip3 install numpy opencv-python-headless opencv-contrib-python-headless

# Install OpenPose
# Ref : https://github.com/CMU-Perceptual-Computing-Lab/openpose/blob/master/doc/installation.md
# Download openpose by git
RUN \
  git clone https://github.com/CMU-Perceptual-Computing-Lab/openpose.git /usr/local/openpose

RUN \
  cd /usr/local/openpose/ && \
  mkdir build && \
  cd build && \
  cmake \
    -DCaffe_INCLUDE_DIRS=/opt/caffe/build/include/ \
    -DCaffe_LIBS=/opt/caffe/build/lib/libcaffe.so \
    -DBUILD_CAFFE=OFF ..

RUN \
  cd /usr/local/openpose/build && \
  make -j`nproc`
