## § 簡介

使用 Vagrant 建立 Linux 環境並於其中安裝 Nvidia + Docker + Git 套件，執行需運行 CUDA 相關的 Docker file。

此項設計用於 Windows 作業系統無法直接執行 Docker 的情況。

## § 資訊

+ 基底：ubuntu/xenial64
> Ubuntu 16.04 64 bit 官方維護版本

+ 安裝：GIT

+ 安裝：Docker CE (Community Edition)
> Ref : https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-docker-ce-1

+ 安裝：Nvidia driver
> Ref : https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html#package-manager-installation
> Ref : https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html#ubuntu-installation
> Deb ref : http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1404/x86_64/

+ 安裝：Nvidia-Docker
> Ref : https://github.com/NVIDIA/nvidia-docker

## § 執行
