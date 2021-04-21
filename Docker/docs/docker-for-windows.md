# Docker

## § 簡介

Docker 產生出來的 Container 多是 Linux 核心的作業系統，因此為了便於軟體操作正常，基本只安裝在 Linux 對應之系統；但在 2061/07/29 Docker 公司發布了 Docker for Window 這個由社群推出的版本。

## § 安裝

### ○ 注意事項

Docker 安裝有兩個注意事項：

1. Docker for Windows requires [Microsoft Hyper-V](https://docs.microsoft.com/zh-tw/virtualization/hyper-v-on-windows/about/) to run
> Hyper-V 需硬體支援，這些相關設定會在 BIOS 中出現選項開關虛擬化 (Virtualization is enabled in BIOS)，相關細節可參考[虛擬化設定文獻(https://docs.docker.com/docker-for-windows/troubleshoot/#virtualization)
2. Windows 10 64bit: Pro, Enterprise or Education
3. SLAT-capable ([Second Level Address Translation](https://en.wikipedia.org/wiki/Second_Level_Address_Translation) capable)
> [Use command systeminfo to check](https://support.microsoft.com/zh-tw/help/2781250)
> Intel CPU i3, i5, i7 皆有支援
> AMD CPU 則是至 Barcelona 架構後皆有支援
4. At least 4GB RAM

### ● 安裝與設定

1. 下載並安裝

[download.docker.com](https://download.docker.com/win/stable/Docker%20for%20Windows%20Installer.exe)

2. 啟動下載軟體並依據指示安裝內容

-----
[新版 Docker for Windows 正式推出：全新安裝與快速上手] (https://blog.miniasp.com/post/2016/08/01/Docker-for-Windows-1-12-Released.aspx)

[Get started with Docker for Windows] (https://docs.docker.com/docker-for-windows/)

[Install Docker for Windows] (https://docs.docker.com/docker-for-windows/install/)

-----
