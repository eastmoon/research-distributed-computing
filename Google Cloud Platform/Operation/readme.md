# VM Instances operation

進行 Google Cloud Platform 主機操作前，需先以 Create 命令建立完成主機。

## [列舉虛擬主機](https://cloud.google.com/sdk/gcloud/reference/compute/instances/list?hl=zh-tw)

```
gcloud compute instances list
```

## [開啟虛擬主機](https://cloud.google.com/sdk/gcloud/reference/compute/instances/start?hl=zh-tw)

```
gcloud compute instances start test-instance
```
> 目標虛擬機可以為複數主機，並可使用 ```--async``` 做非同步操作，避免操作導致延遲。

## [關閉虛擬主機](https://cloud.google.com/sdk/gcloud/reference/compute/instances/stop?hl=zh-tw)

```
gcloud compute instances stop test-instance
```
> 目標虛擬機可以為複數主機，並可使用 ```--async``` 做非同步操作，避免操作導致延遲。

## [移除虛擬主機](https://cloud.google.com/sdk/gcloud/reference/compute/instances/delete?hl=zh-tw)

```
gcloud compute instances delete test-instance
```
> 目標虛擬機可以為複數主機，並可使用 ```--async``` 做非同步操作，避免操作導致延遲。

## [SSH 連線至虛擬機](https://cloud.google.com/sdk/gcloud/reference/compute/ssh?hl=zh-tw)

```
gcloud compute ssh test-instance
```
> 若操作 gcloud 的主機未與虛擬機進行 SSH 認證，在進行此操作時會自動執行[gcloud compute config-ssh](https://cloud.google.com/sdk/gcloud/reference/compute/config-ssh?hl=zh-tw)
