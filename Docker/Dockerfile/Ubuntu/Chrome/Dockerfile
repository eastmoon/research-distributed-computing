# Install Linux OS : Ubuntu 14.04
FROM ubuntu:14.04

# Update package manager
RUN apt-get -y update

# Install os tools
RUN apt-get -y install curl
RUN apt-get -y install traceroute

# Polyfill ubuntu 14.04 / 16.04 command
RUN apt-get -y install software-properties-common

# Install git
# Ref : https://git-scm.com/download/linux
RUN \
    add-apt-repository ppa:git-core/ppa \
    && apt update \
    && apt-get -y install git-all
RUN apt-get -y install git-all

# Install nvm
# Ref : https://github.com/creationix/nvm#install-script
ENV NVM_DIR /usr/local/nvm
RUN curl --silent -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash

# Install node and npm
ENV NODE_VERSION 8.2.1
RUN \
    . "$NVM_DIR/nvm.sh" \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

# add node and npm to path so the commands are available
ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

# Install Python.
RUN \
  apt-get update && \
  apt-get install -y python python-dev python-pip python-virtualenv && \
  rm -rf /var/lib/apt/lists/*

# Install OpenJDK.
# Ref : https://github.com/nimmis/docker-java/blob/master/14.04-openjdk-8-jdk/Dockerfile
RUN \
  add-apt-repository ppa:openjdk-r/ppa && \
  apt-get update && \
  apt-get install -y --no-install-recommends openjdk-8-jdk && \
	apt-get clean && \
  rm -rf /var/lib/apt/lists/*

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

# Install chrome
RUN \
  curl -s -o - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
  sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' && \
  apt-get update && \
  apt-get install -y --no-install-recommends google-chrome-stable \
  && rm -rf /var/lib/apt/lists/*

# Add Chrome as a user
RUN \
  groupadd -r chrome && \
  useradd -r -g chrome -G audio,video chrome && \
  mkdir -p /home/chrome && \
  chown -R chrome:chrome /home/chrome
