## 封裝 vagrant box

#### 1、查詢 VirtualBox VM

透過 VirtualBox CLI 查詢現存的 VM 列表

```
"c:\Program Files\Oracle\VirtualBox\VBoxManage.exe" list vms
```
> 以上指令是基於預設安裝 VirtualBox 會安裝於 Windows 作業系統 C: 目錄下方

```
$ "c:\Program Files\Oracle\VirtualBox\VBoxManage.exe" list vms
"base_default_1604472560206_47830" {d3e41a56-9fe3-4167-877f-eaf9a87b680b}
```

若查詢結果如上，則 ```base_default_1604472560206_47830``` 即為 VM 實際名稱，此名稱後面的亂數編號是 Vagrant 在產生虛擬機時編寫上去。

#### 2、封裝 Box

透過 Vagrant 的 package 封裝 VirtualBox 虛擬主機

```
vagrant package --base [VirtualBox VM name]
```

實際範例參考前述虛擬機名稱，並指定輸出檔名

```
vagrant package --base base_default_1604472560206_47830
```

#### 3、加入 Box 清單

透過 Vagrant 的 box 匯入封裝的映像檔

```
vagrant box add %cd%\package.box  --name iwa-base
```

匯入成功後可以刪除此封裝

```
del package.box
```

#### 注意事項

不同的虛擬機在匯出時會因為 Vagrant 使用的認證機制導致匯出檔案在被其他 Vagrant 專案開啟時會出現問題，這部分解決方案有文獻，但是否適用仍需確認。

+ ["Warning: Authentication failure. Retrying... " after packaging box](https://github.com/hashicorp/vagrant/issues/5186#issuecomment-312349002)

目前使用方式如下：
```
# Vagrant public authentication error.
# Ref : https://github.com/hashicorp/vagrant/issues/5186#issuecomment-312349002
config.ssh.insert_key = false
```
> 在 Vagrantfile 內添加此設定
