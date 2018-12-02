# Docker

## § 簡介

Docker產生出來的Container只能是Linux系統，因此Docker只能運行或安裝在純Linux環境下；而Docker支援絕大部分的Linux，只要該Linux的核心版本編號夠新。

## § 安裝

### ○ 注意事項
在非Linux作業系統下，如Mac或Windows，則需透過VM (Virtual Box) 來啟動Linux環境，並安裝Docker。
因此，在Docker網站有提供額外方案，Docker Toolbox : Kitematic、boot2docker。

透過此工具，會自動偵測環境，並協助安裝所需的工具；並可藉由此工具抓取Image，並經由使用者介面操作Docker。
> 目前的Kitematic在啟動時會自動啟動VM中的Linux環境。
> 要注意，即使現行存在可執行於Windows環境的Docker ( Docker for windows )，這仍是透過VM模擬其運作。

### ● Virtual Box 中安裝 Docker

1. 下載並安裝Virtual Box

https://www.virtualbox.org/

2. 下載Ubuntu ISO

http://www.ubuntu.com/download/server

3. 在Virtual Box中安裝Ubuntu OS

http://blog.xuite.net/yh96301/blog/220731233

```
// 於安裝完畢後，啟動Terminal，更新所有套件，並以此確保網路正常運作。
> sudo apt-get update
> sudo apt-get upgrade
```
4. 安裝SSH溝通機制

A. 安裝SSH

安裝指令
```
> sudo apt-get update
> sudo apt-get upgrade
> sudo apt-get install openssh-server
```
本地測試伺服器狀態
```
> ssh 10.0.2.15
```

B. 安裝 Putty for window

[Putty download] (http://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html)

C. VM設定VPN

在VM中做以下設定
> 設定值 > 網路 > 進階 > 連接埠傳送 > 新增
> 主機：VirtualBox ethernet card ip and custom port，192.168.56.1 : 256
> 客機：Ubuntu ethernet and SSH Server prot, 10.0.2.15 : 22

D. 重新啟動並使用Putty連線

5. 安裝Docker

於Virtual Box開啟網頁下載對應作業系統的Docker版本

[Docker installaion] (https://docs.docker.com/engine/installation/)

```
> sudo apt-get update
> sudo apt-get upgrade
> curl -fsSL https://get.docker.com | sudo sh
```

-----
Error : got permission denied while trying to connect to the docker daemon socket.

[Link 1] (http://askubuntu.com/questions/615394)

[Link 2] (http://stackoverflow.com/questions/27528337)

-----
[Install Docker Toolbox on Windows] (https://docs.docker.com/toolbox/toolbox_install_windows/)

[Docker Toolbox : Kitematic] (https://kitematic.com/)

[Get started with Docker for Windows] (https://docs.docker.com/docker-for-windows/)

[Example: Install Docker on Ubuntu Linux] (https://docs.docker.com/engine/getstarted/linux_install_help/)

[Install Docker and run hello-world] (https://docs.docker.com/engine/getstarted/step_one/)

[在Mac及Windows下安裝Docker] (https://joshhu.gitbooks.io/docker_theory_install/content/DockerBible/macwindowsdocker.html)

[利用 Putty Windows實體電腦 連線 Ubuntu虛擬機器] (http://kanchengzxdfgcv.blogspot.tw/2015/10/putty-windows-ubuntu-oracle-vm.html)

[数据库不适合Docker及容器化的7大原因] (http://mp.weixin.qq.com/s/bx_zgJs88GljYH0zdvDCTQ)

-----
