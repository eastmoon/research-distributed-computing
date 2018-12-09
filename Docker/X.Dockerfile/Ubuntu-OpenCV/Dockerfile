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
# Declare variable
ENV GIT_REPOSITORY /usr/git/
ENV OPENCV_VERSION 4.0.0
# OpenCV common package
RUN \
  apt-get update -y && \
  apt-get install -y \
    build-essential \
    cmake \
    libgtk2.0-dev \
    pkg-config \
    libavcodec-dev \
    libavformat-dev \
    libswscale-dev \
    python-dev \
    python-numpy \
    libtbb2 \
    libtbb-dev \
    libjpeg-dev \
    libpng-dev \
    libtiff-dev \
    libjasper-dev \
    libdc1394-22-dev

# Download opencv source code
RUN \
  mkdir ${GIT_REPOSITORY} && \
  cd ${GIT_REPOSITORY} && \
  curl https://codeload.github.com/opencv/opencv/zip/${OPENCV_VERSION} -o opencv-source.zip && \
  unzip -qq -d opencv-unzip opencv-source.zip && \
  mkdir opencv && \
  mv opencv-unzip/*/* opencv && \
  rm -rf opencv-unzip && \
  rm opencv-source.zip

# Build opencv by cmake
