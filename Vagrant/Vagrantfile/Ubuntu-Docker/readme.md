## § 簡介

使用 Vagrant 建立 Linux 環境並於其中安裝 Docker + Git 套件，執行 Docker file。

此項設計用於 Windows 作業系統無法直接執行 Docker 的情況。

## § 資訊

+ 基底：ubuntu/xenial64
> Ubuntu 16.04 64 bit 官方維護版本

+ 安裝：Docker CE (Community Edition)
> Ref : https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-docker-ce-1

+ 安裝：GIT

## § 執行

#### ◎ 進入主機

```
vagrant ssh
```

#### ◎ 下載 Docekr Repo

```
vagrant ssh -c "git clone https://github.com/eastmoon/Research-DistributionCalculation.git ~/repo"
```

#### ◎ 建置 Docker imgae by dockerfile

```
vagrant ssh -c "cd ~/repo/Docker/X.Dockerfile/Ubuntu-Update && sudo docker build --rm -t 'ubuntu-update:1.0.0' ."
```

#### ◎ 執行 Docker Container

```
vagrant ssh -c "sudo docker run --ti 'ubuntu-update:1.0.0'"
```
