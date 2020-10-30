# [OpenCV](https://docs.opencv.org/3.4/d7/d9f/tutorial_linux_install.html)

+ Standard
  - ubuntu, OS base on Ubuntu 14.04
  - nvidia, OS base on nvidia/cuda:8.0-cudnn6-devel-ubuntu14.04
  - bvle, OS base on bvlc/caffe
    - bvlc/caffe:cpu
    - bvlc/caffe:gpu

以編譯模式安裝完 OpenCV

+ Full
> ※ 此專案測試中

所有相依可能之套件安裝後進行編譯。

+ Opencv-Python

以 Python 封裝之版本安裝。

#### ◎ 檢測

##### § OpenCV

+ [Python 確認版本](https://docs.opencv.org/3.4.1/d2/de6/tutorial_py_setup_in_ubuntu.html)
```
import cv2
print(cv2.__version__)
```
> python

##### § Cuda

+ [How to get the cuda version?](https://stackoverflow.com/questions/9727688/how-to-get-the-cuda-version)
```
// Check CUDA
nvcc --version
// Check cuDNN
cat /usr/local/cuda/include/cudnn.h | grep CUDNN_MAJOR -A 2
```
> linux command line

##### § Caffe

+ [Installing Caffe on Ubuntu 16.04 (GPU Mode with CUDA)](https://chunml.github.io/ChunML.github.io/project/Installing-Caffe-Ubuntu/)
```
caffe --version
```
> linux command line

```
import caffe
```
> python

##### § PCI information

+ [How To Use lspci, lsscsi, lsusb, And lsblk To Get Linux System Devices Information](https://www.2daygeek.com/check-system-hardware-devices-bus-information-lspci-lsscsi-lsusb-lsblk-linux/#)
```
lspci -v
```
> linux command line

※ 若使用 Docker for Window 啟動的 Docker container 並無法取得正確的資訊
> + [Using NVIDIA GPU within Docker Containers](https://marmelab.com/blog/2018/03/21/using-nvidia-gpu-within-docker-container.html)
>
> + [在 Docker Container 裡使用 GPU Resource](https://ithelp.ithome.com.tw/articles/10195029)
>
> NVIDIA-Docker can't run on window.


#### ◎ 參考
