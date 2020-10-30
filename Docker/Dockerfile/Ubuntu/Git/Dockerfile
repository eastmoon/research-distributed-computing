FROM ubuntu:14.04

RUN \
  apt-get update -y && \
  apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    traceroute \
    software-properties-common

RUN \
  # Add Git repository reference into apt system
  add-apt-repository ppa:git-core/ppa && \
  # Update information
  apt-get update -y && \
  # Install Docker
  apt-get install -y git
