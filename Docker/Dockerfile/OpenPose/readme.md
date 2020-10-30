# [OpenPose](https://github.com/CMU-Perceptual-Computing-Lab/openpose)

OpenPose 是一套基於 OpencCV 為基礎的姿態辨識工具。

## 需求

硬體需求上

+ RAM
  + Nvidia GPU version
    - NVIDIA graphics card with at least 1.6 GB
    - RAM at least 2.5 GB
    - 強烈建議: cuDNN
  + AMD GPU version
    - Vega series graphics card
    - RAM at least 2 GB
  + CPU version
    - RAM at least 8 8G
+ CPU
  - At least 8 core

## 相依

+ [OpenCV](https://opencv.org/) 2.x、3.x
> 基礎運速核心

+ [Caffc](http://caffe.berkeleyvision.org/installation.html)
> DL ( Deep learning ) framework

+ [GFlags](https://github.com/gflags/gflags)
> 教學範例需引用之框架

## Docker images

考量上述相依，若找尋與其他函示庫共通的相依兩個基礎環境
+ [CUDA](https://hub.docker.com/r/nvidia/cuda/)
+ [Caffc](https://hub.docker.com/r/bvlc/caffe/)

參考其可運用的版本，雖使用 CUDA 安裝可運用較高版本的環境，但在此選擇 Caffc 官方提供的基礎環境避免過高 CUDA 版本導致相依問題。
相關可用版本可以參考 [Caffc official image](https://github.com/BVLC/caffe/tree/master/docker)

+ [Dockerfile - OpenPose 1.4.0, OpenCV, CUDA 8, CuDNN 6, Python2.7](https://gist.github.com/moiseevigor/11c02c694fc0c22fccd59521793aeaa6)

## 使用說明

+ [Multi-Person Pose Estimation in OpenCV using OpenPose](https://www.learnopencv.com/multi-person-pose-estimation-in-opencv-using-openpose/)
+ [使用docker部署openpose](https://zhuanlan.zhihu.com/p/49295126)
