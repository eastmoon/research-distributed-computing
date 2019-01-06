# Base OS Use with cuda for ubuntu
# Ref : https://hub.docker.com/r/nvidia/cuda/
# Version : Cuda 8.0 , cudnn 6, ubuntu 14.04
# FROM nvidia/cuda:8.0-cudnn6-devel-ubuntu14.04
FROM opencv:bvle-caffe-cpu

# KEEP OS LIBRARY UP TO DATE
RUN \
  apt-get -y update && \
  apt-get -y upgrade && \
  apt-get -y dist-upgrade && \
  apt-get -y autoremove

# Dependent library
# libgoogle-glog-dev, for openpose
# libopenblas-dev, for caffe

# Install OpenPose
# Ref : https://github.com/CMU-Perceptual-Computing-Lab/openpose/blob/master/doc/installation.md
# Download openpose by git
ENV OPENPOSE_REPOSITORY ${GIT_REPOSITORY}/openpose
RUN \
  git clone https://github.com/CMU-Perceptual-Computing-Lab/openpose.git ${OPENPOSE_REPOSITORY}

RUN \
  cd ${OPENPOSE_REPOSITORY} && \
  mkdir build && \
  cd build && \
  cmake \
    -D OpenCV_INCLUDE_DIRS=${OPENCV_REPOSITORY}/build/include \
    -D OpenCV_LIBS_DIR=${OPENCV_REPOSITORY}/build/lib \
    -D BUILD_PYTHON=ON \
    ..

RUN \
  make -j5 && \
  make install
