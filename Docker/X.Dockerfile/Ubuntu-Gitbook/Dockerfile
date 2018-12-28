# Image From Ubuntu-NVM dockerfile.
# This image must build before using this Dockerfile.
From nvm

# Install node and npm
ENV NODE_VERSION 8.11.0
RUN \
    . "$NVM_DIR/nvm.sh" \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

# add node and npm to path so the commands are available
ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

# Install linux package for node package dependency.
# https://github.com/Automattic/node-canvas/wiki/Installation---Ubuntu-and-other-Debian-based-systems
RUN \
  apt-get -y update && \
  apt-get -y install build-essential libcairo2-dev libpango1.0-dev libjpeg-dev libgif-dev librsvg2-dev

# Install node package
RUN \
  npm install -g yarn && \
  yarn global add node-gyp && \
  yarn global add canvas

# Install calibre
# https://calibre-ebook.com/download_linux
