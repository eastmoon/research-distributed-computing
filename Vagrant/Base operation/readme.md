# Vagrant

## § 操作

#### § 初始化

Vagrant 專案是以檔案夾為基礎，每個虛擬機對應一個專案目錄，此概念與 Java、node.js 專案相同，所有虛擬機專案相關設定、操作指令、掛接目錄應皆屬於此目錄下，以便於專案控管。

此外，Vagrant 的虛擬機來源與 Docker 想同，[Vagrant Cloud](https://app.vagrantup.com/boxes/search) 是一個相同於 Docker Hub 的虛擬機資源管理中心；因此，在初始化階段應指定特定 box，做為本虛擬機的起始作業系統與環境；倘若不指定 box，則可日後於 vagrantfile 中以程式撰寫。

```
vagrant init
```
> 初始化所在檔案夾為 vagrant 專案

```
vagrant init ubuntu/trusty64
```
> 初始化所在檔案夾為 vagrant 專案且預設使用 ubuntu/trusty64 為 box

#### § 啟動

啟動虛擬機，在啟動後，可於 VirtualBox 中看到被呼叫起來的虛擬機。

```
vagrant up
```

Vagrant 專案啟動時會依據 vagrantfile 中的細節參數來設定虛擬機對外的網路設定，而這部分於每次執行時皆會重新執行；但 ```config.vm.provision``` 僅會執行一次，直到本專案對應的虛擬機被移除在開啟才會重新執行，而描述於此設定的腳本是用於當虛擬機起始時必定會執行之運作，例如環境設定、安裝軟體等。

#### § 關閉

關閉虛擬機，在關閉後，可於 VirtualBox 中看到虛擬機呈現停機狀態；須注意這狀態是讓虛擬機停止運作並釋放無需使用的資源，但實際仍占用了硬碟空間等必要資源。

```
vagrant halt
```

#### § 移除

移除虛擬機，在移除後，VirtualBox 將無法看到與本專案對應的虛擬機，並相對應釋放硬碟空間與資源。

```
vagrant destroy
```

#### § 操作

對虛擬機進行操作，此操作方式是讓本機 (host) 與虛擬機 (guest) 經由 SSH 機制互相溝通，除了直接進入虛擬機外，亦可透過一行式的命令讓虛擬機運作並將結果回傳至掛載的目錄內。

```
vagrant ssh
```

#### § 封裝

```
vagrant package --base [VirtualBox.name] --output [path/name.box]
```

## 文獻

---

+ [使用Vagrant進行伺服器環境部署](http://www.cc.ntu.edu.tw/chinese/epaper/0040/20170320_4006.html)
+ [Vagrant Tutorial（1）雲端研發人員，你也需要虛擬機！](http://www.codedata.com.tw/social-coding/vagrant-tutorial-1-developer-and-vm/)
+ [Vagrant Tutorial（2）跟著流浪漢把玩虛擬機](http://www.codedata.com.tw/social-coding/vagrant-tutorial-2-playing-vm-with-vagrant/)
+ [Vagrant Tutorial（3）細說虛擬機生滅狀態](http://www.codedata.com.tw/social-coding/vagrant-tutorial-3-vm-lifecycle/)
+ [Vagrant Tutorial（4）虛擬機，若即若離的國中之國](http://www.codedata.com.tw/social-coding/vagrant-tutorial-4-guest-host-communication/)
+ [Vagrant Tutorial（5）客製化虛擬機內容的幾種方法](http://www.codedata.com.tw/social-coding/vagrant-tutorial-5-vm-customization/)

---

