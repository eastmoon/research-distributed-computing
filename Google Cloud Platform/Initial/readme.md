# gcloud environment initial

#### 1、從 docker hub 抓取 google/cloud-sdk

```
docker pull google/cloud-sdk
```

將最新版本的 google cloud sdk 映像檔抓取自本機。

#### 2、進入 Docker

```
docker run -ti google/cloud-sdk bash
```

經由本機的 docker 裝置登入容器，並逐步完成後續的初始化設定。

#### 3、初始化 gcloud

```
gcloud init
```

初始化階段會要求設定帳號資訊，並透過網頁認證登入，將該帳號與本容器內的 gcloud SDK 進行環境資訊同步；此部分必須手動設定完成，並可同時規劃多組帳號的認證。

#### 4、設定 SSH

```
gcloud compute config-ssh
```
> 詳細設定參考 [config-ssh](https://cloud.google.com/sdk/gcloud/reference/compute/config-ssh?hl=zh-tw)

初始化容器內的 SSH 憑證，以便 gcloud 與虛擬主機進行 SSH 連線與 SCP 操作。

#### 5、導出 Container

```
docker export [conatiner-name/container-id] > my-cloud-sdk.tar
```
> 導出容器

```
docker import my-cloud-sdk.tar [image-name:tag]
```
> 導入壓縮檔為映像檔

## 結論

目前的實驗結果在上述流程皆需手動設置詳細參數，並無法以腳本命令一次設定完畢。

而即使導出後再導入的映像檔，雖保留了 SSH 檔，但並無法保留 gcloud 初始化參數。

這部份還有待研究，從而確保建立私有管理容器；或於容器初始化階段即執行登入腳本，並確保登入容器不會被移除，僅用 stop、restart 參數控制執行狀態，且以 exec 對其呼叫與執行。
