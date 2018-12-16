# Install Docker、Git
# Ref : https://docs.docker.com/install/linux/docker-ce/ubuntu/#set-up-the-repository
# Ref : https://git-scm.com/download/linux
# Upadte information
apt-get update -y
# Install common package
apt-get install -y \
  apt-transport-https \
  ca-certificates \
  curl \
  software-properties-common

# Pre-install

# --- Docker ---
# Download Docker GPG reference & Add key into apt system
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# Add Docker repository reference into apt system
sudo add-apt-repository \
  "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) \
  stable"

# --- GIT ---
# Add Git repository reference into apt system
sudo add-apt-repository ppa:git-core/ppa

# --- Nvidia driver ---
# Download CUDA repo, file name "cuda-repo-<distro>_<version>_<architecture>.deb"
# Ref : http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/
sudo wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_10.0.130-1_amd64.deb
# Install
sudo dpkg -i cuda-repo-ubuntu1604_10.0.130-1_amd64.deb
# Add apt-key
sudo apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub
# Remove deb file
#rm cuda-repo-ubuntu1604_10.0.130-1_amd64.deb

# --- Nvidia Docker ---
# Add the package repositories
sudo curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
sudo curl -s -L https://nvidia.github.io/nvidia-docker/$(. /etc/os-release;echo $ID$VERSION_ID)/nvidia-docker.list | \
  sudo tee /etc/apt/sources.list.d/nvidia-docker.list

# Install
# Update information
apt-get update -y
# Install Docker
apt-get install -y docker-ce git cuda nvidia-docker2
