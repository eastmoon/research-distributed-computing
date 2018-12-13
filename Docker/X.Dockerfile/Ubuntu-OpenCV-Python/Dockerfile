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
# Ref : https://pypi.org/project/opencv-python/

# OpenCV common package
RUN \
  apt-get update -y && \
  apt-get install -y \
    # Python
    python-dev \
    python-pip \
    python3-dev \
    python3-pip 


# Install Opencv-Python
RUN \
  pip install numpy opencv-python-headless opencv-contrib-python-headless

RUN \
  pip3 install numpy opencv-python-headless opencv-contrib-python-headless
