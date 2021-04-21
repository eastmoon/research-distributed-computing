# Vagrant

## § 簡介

Vagrant 是基於 Infrastructure as Code (IaC) 概念的虛擬環境操作工具，其操作裝置可以是 VirtualBox、VMWave 等。

## §安裝

1. 安裝 VirtualBox
> 必須安裝 window host、Oracle VM VirtualBox Extension Pack，並保持兩個版本一致。
>
> [Oracle VM VirtualBox 如何安裝 Extension Pack ?](https://www.arthurtoday.com/2011/01/oracle-vm-virtualbox-40-extension-pack_14.html)

https://www.virtualbox.org/

2. 安裝 Vagrant

https://www.vagrantup.com/downloads.html

3. 重啟電腦，並於 Terminal 測試 Vagrant 命令

```
// 列出說明
vagrant --help
// 列出版本
vagrant --version
```

4. 安裝 SSH 工具

這邊可以選擇安裝 [WinSCP](https://winscp.net/eng/docs/lang:cht)、[Git](https://git-scm.com/)，若要確認電腦是否已經有該工具，可以於 Terminal 中輸入 ssh 確認是否存在可用功能。

關於 SSH 運作目的是在於操作指令```vagrant ssh```，可以想見的 vagrant 為便於指令操作，因此除透過 ssh 傳遞指令外，在連入虛擬機時也是以相同方式運作；而相關於 vagrantfile 的設定更多是 ssh 的密碼結構與細節，若採用預設則是 vagrant 內定的 default 參數。

5. VirtualBox Guest Additions

在多數情況下，使用 Guest Additions 可以開通諸多硬體功能接通，對此，若有需要則需安裝可自動更新 Guest Additions 的套件 [Vagrant-vbguest](https://github.com/dotless-de/vagrant-vbguest)。

```
vagrant plugin install vagrant-vbguest
```

6. PCI Passthougnt

[Virtualbox PCI passthrough](https://www.virtualbox.org/manual/ch09.html#pcipassthrough)
