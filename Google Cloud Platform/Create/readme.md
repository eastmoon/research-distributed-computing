# VM Instances

+ [建立虛擬機](https://cloud.google.com/compute/docs/instances/create-start-instance?hl=zh-tw)
+ [管理虛擬機](https://cloud.google.com/compute/docs/instances/managing-instance-access?hl=zh-tw)
+ [連線至虛擬機](https://cloud.google.com/compute/docs/instances/connecting-to-instance?hl=zh-tw)

## Create Compute instance

建立虛擬機主要採用 [gcloud compute instances API](https://cloud.google.com/sdk/gcloud/reference/compute/instances/create?hl=zh-tw)，相關設定範例如下：

#### 建立虛擬機

```
gcloud compute instances create test-instance \
	--image-family ubuntu-1604-lts \
	--image-project ubuntu-os-cloud
```
> 建立一個虛擬機，依據 Ubuntu-1604 映像檔，來源 ubuntu-os-cloud；可用[公開映像檔參考列表](https://cloud.google.com/compute/docs/images#os-compute-support)

#### 建立特定主機類型的虛擬機

```
gcloud compute instances create test-instance \
	--image-family ubuntu-1604-lts \
	--image-project ubuntu-os-cloud \
  --machine-type n1-standard-1
```
> 建立一個 n1-standard-1 (擁有 1 個 vCPU 與 3.75 GB 記憶體的標準機器類型) 虛擬機；可用[主機類型參考列表](https://cloud.google.com/compute/docs/images#os-compute-support)


#### 建立於特定區域內的虛擬機

```
gcloud compute instances create test-instance \
	--image-family ubuntu-1604-lts \
	--image-project ubuntu-os-cloud \
  --zone asia-east1-a
```
> 建立一個位在 asia-east1-a 虛擬機；可用[地區與區域參考列表](https://cloud.google.com/compute/docs/regions-zones/?hl=zh-tw)

#### 設置虛擬機的主要硬碟

```
gcloud compute instances create test-instance \
	--image-family ubuntu-1604-lts \
	--image-project ubuntu-os-cloud \
  --boot-disk-size 50GB \
  --boot-disk-type pd-standard
```
> 建立一個擁有 50GB 標準開機硬碟的虛擬機；若於建立主機後再擴增硬碟，參考[新增永久磁碟或調整其大小](https://cloud.google.com/compute/docs/disks/add-persistent-disk)

#### 設置虛擬機的次要硬碟

```
gcloud compute instances create test-instance \
	--image-family ubuntu-1604-lts \
	--image-project ubuntu-os-cloud \
  --create-disk size=20GB,type=pd-standard
```
> 建立一個擁有 20GB 標準次要硬碟的虛擬機；若於建立主機後再擴增硬碟，參考[新增永久磁碟或調整其大小](https://cloud.google.com/compute/docs/disks/add-persistent-disk)

#### 建立配 GPU 的虛擬機

```
gcloud compute instances create test-instance \
	--image-family ubuntu-1604-lts \
	--image-project ubuntu-os-cloud \
  --zone us-central1-a \
  --accelerator type=nvidia-tesla-k80,count=1
```
> 建立一個位在 us-central1-a 虛擬機，並設置[加速器 (GPU)](https://cloud.google.com/sdk/gcloud/reference/compute/instances/create?hl=zh-tw#--accelerator) 1 個 NVIDIA Tesla K80
>
> 若要確認可用加速器列表，使用```gcloud compute accelerator-types list```。
>
> 若出現 <span style="color:red">"Instances with guest accelerators do not support live migration."</span>，其主要問題依據[文獻](https://groups.google.com/forum/#!topic/gce-discussion/e9K3h3fQuJk)是因為目前帳號並未[申請配額](https://cloud.google.com/compute/quotas?hl=zh-tw)(Quota)。
