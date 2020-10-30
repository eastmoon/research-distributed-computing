# Base OS Use with cuda for ubuntu
# Ref : https://hub.docker.com/r/nvidia/cuda/
# Version : Cuda 8.0 , cudnn 6, ubuntu 16.04
# FROM nvidia/cuda:8.0-cudnn6-devel-ubuntu16.04
FROM bvlc/caffe:gpu

# KEEP OS LIBRARY UP TO DATE
RUN \
  apt-get -y update && \
  apt-get -y upgrade && \
  apt-get -y dist-upgrade && \
  apt-get -y autoremove

# Dependent library
RUN \
  apt-get update -y && \
  apt-get --assume-yes install \
    build-essential unzip \
    # General dependencies
    libatlas-base-dev libprotobuf-dev libleveldb-dev libsnappy-dev libhdf5-serial-dev protobuf-compiler \
    libboost-all-dev \
    # Remaining dependencies, 14.04
    libgflags-dev libgoogle-glog-dev liblmdb-dev \
    # Python libs
    libopencv-dev python-opencv python-pip python-dev \
    cmake \
    libeigen3-dev libviennacl-dev \
    libnccl-dev \
    doxygen

# Upgrade python
RUN \
  pip install --upgrade numpy protobuf opencv-python

#
RUN \
  cp -ruax /opt/caffe/build/include/caffe/proto/ /opt/caffe/include/caffe

# Install OpenPose
# Ref : https://github.com/CMU-Perceptual-Computing-Lab/openpose/blob/master/doc/installation.md
# Download openpose by git
ENV GIT_REPOSITORY /usr/local
ENV OPENPOSE_REPOSITORY ${GIT_REPOSITORY}/openpose
RUN \
  git clone https://github.com/CMU-Perceptual-Computing-Lab/openpose.git ${OPENPOSE_REPOSITORY}

RUN \
  cd ${OPENPOSE_REPOSITORY} && \
  mkdir build && \
  cd build && \
  cmake \
    -D CMAKE_BUILD_TYPE="Release" \
    -D Caffe_INCLUDE_DIRS=/opt/caffe/include \
    -D Caffe_LIBS=/opt/caffe/build/lib/libcaffe.so \
    -D BUILD_CAFFE=OFF \
    -D BUILD_PYTHON=ON \
    -D BUILD_EXAMPLES=OFF \
    -D BUILD_DOCS=OFF \
    ..

RUN \
  cd ${OPENPOSE_REPOSITORY}/build && \
  make -j"$(nproc)" && \
  make install

ENV PYTHONPATH $PYTHONPATH:/usr/local/python/
