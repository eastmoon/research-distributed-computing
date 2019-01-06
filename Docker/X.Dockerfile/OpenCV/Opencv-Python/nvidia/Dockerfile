FROM nvidia/cuda:8.0-cudnn6-devel-ubuntu14.04

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
# Ref : https://pypi.org/project/opencv-python/

# OpenCV common package
RUN \
  apt-get update -y && \
  apt-get upgrade -y && \
  apt-get install -y \
    # Python
    python-dev \
    python-pip \
    # OpenCV
    libopencv-dev \
    python-opencv

# Install pip
RUN \
  curl https://bootstrap.pypa.io/get-pip.py | python
