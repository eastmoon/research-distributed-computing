# 基於 VMWare 軟體的虛擬化系統架構

## 軟體

### 架構說明

+ Workstation
電腦用虛擬化軟體，主要用於開發人員於電腦模擬多個作業系統使用

![vSphere 產品架構圖](https://docs.vmware.com/tw/VMware-vSphere/images/GUID-5EB66614-1EE8-4F39-8C8B-1E97EEE76791-high.png)

+ vSphere
伺服器虛擬化軟體，主要用於伺服器虛擬化管理，其中包括以下服務
	- [ESXi](https://zh.wikipedia.org/zh-tw/VMware_ESXi)：企業用硬體虛擬化作業系統，此軟體並非安裝於作業系統內，而是本身即為作業系統
	- [vCenter](https://en.wikipedia.org/wiki/VCenter)：一套中央管理工具，用於管理複數虛擬機與 ESXi 主機
		- vMotion：讓虛擬機在不同 ESXi 主機間做到轉移，其技術 vLM ( vMotion Live migration ) 是一種將記憶體、緩存等資料以區塊方式逐一轉一至目標主機的新虛擬機區塊，僅在最後一刻短暫關閉主機，轉移最後一部分不停機無法轉移的部分，並當一切完成後開啟新虛擬機。
		- svMotion ( Storage vMotion )：本質上與 vMotion 概念相同，差別在於會及時儲存虛擬機硬碟資料，當新虛擬機啟動時直接使用硬碟，做到最短時間轉移。
	- [vSAN](https://docs.vmware.com/tw/VMware-vSphere/7.0/com.vmware.vsphere.vsan-planning.doc/GUID-18F531E9-FF08-49F5-9879-8E46583D4C70.html)：一套虛擬機資源管理系統，考量 svMotion 中的及時硬碟資料儲存，其 vSAN 就是將叢集中的所有 ESXi 主機硬碟資源進行儲存，以確保 vMotion、HA、DRS 等共用儲存區的 VMWare 運作。

### 授權規範

+ Workstaation：一組授權金鑰用於單一主機
+ vSphere：一組授權金鑰用於單一 CPU，列如 vSphere 安裝主機用於雙 CPU 主機，則需要兩組授權金鑰
	- VMware Essentials plus ( Ess. Plus )：一組授權金鑰可用於 3 主機 ( 6 CPU )
	- VMWare vCenter Standard：單一組機的 vCenter 授權，可用於管理 3 台以上的 ESXi 主機

## 硬體

### 單體 ESXi 主機

+ [VMware ESXi 安裝和設定](https://docs.vmware.com/tw/VMware-vSphere/7.0/vsphere-esxi-703-installation-setup-guide.pdf)
+ [Installing ESXi on a supported USB flash drive or SD flash card](https://kb.vmware.com/s/article/2004784)
+ [Connecting to a remote ESX / ESXi / vCenter Server from VMware Workstation](https://kb.vmware.com/s/article/2005822)
+ [ESXi hardware requirement](https://docs.vmware.com/tw/VMware-vSphere/7.0/com.vmware.esxi.upgrade.doc/GUID-DEB8086A-306B-4239-BF76-E354679202FC.html)

**A free version of ESXi is available as a separate download. When downloading the free version of ESXi, a license key is created that's identical to paid versions but with more software limitations.**

單體主機安裝 ESXi 可透過 VMWare 官方文件說明來下載 ISO 檔後建立安裝 USB，並以此在實體主機上安裝作業系統；原則上，單體主機上的 ESXi 僅是用於管理虛擬機，若要匯入虛擬機則可以用 vSphere 或 workstation 來達到。

##### 關於 ESXi 評估和授權模式

您可以使用評估模式來深入瞭解 ESXi 主機的全套功能。評估模式提供的功能集相當於 vSphere Enterprise Plus 授權。在評估模式到期之前，您必須為您的主機指派可支援正在使用的所有功能的授權。

ESXi 主機的安裝版本永遠以評估模式安裝。ESXi Embedded 由硬體廠商預先安裝在內部儲存裝置上。它可能處於評估模式或已預先授權。評估期為 60 天，從開啟 ESXi 主機時開始計算。在 60 天的評估期間，您可以隨時從授權模式轉換為評估模式。評估期剩餘時間等於評估期時間減去已用時間。

### 單體 vSphere 主機

+ [VMWare vSphere 安裝和設定](https://docs.vmware.com/tw/VMware-vSphere/6.5/vsphere-esxi-vcenter-server-652-installation-setup-guide.pdf)
+ [VMware Compatibility Guide](https://www.vmware.com/resources/compatibility/search.php)

vSphere 的兩個核心元件是 ESXi 和 vCenter Server，因此在安裝上本身需確保可安裝 ESXi，其後差別在於單機與複數主機的狀況，若為複數則會額外詢問並登錄其他主機。

### 雙主機叢集

![VMWare HA architecture](https://i0.wp.com/www.chriscolotti.us/wp-content/uploads/2013/11/vmw-dgrm-vsphere-087b-lg.jpg)

雙主機叢集是確保 VMWare 的高可用性 ( high availability、HA ) 啟動的最基本系統結構，這結構最基本會需要如下設備：

+ 見證主機 ( 用於監控 VMWare 運作狀態 )
+ 可安裝 ESXi 的標準主機兩台
+ 高速資料存儲與傳輸用主機一台

### 私有雲

![vCenter system architecture](https://www.instana.com/media/core-components-of-vsphere-are-esxi-and-vcenter-se.png)

私有雲概念為由複數的 ESXi 主機來做到整個主機叢集的 HA、FT、DRS 功能的系統結構，在此架構下設備約莫如下：

+ 見證主機一台 ( 用於 vSAN 機制 )
+ 安裝 vCenter 的標準主機一台
+ 安裝 ESXi 的標準主機 N 台
+ 高速資料存儲與傳輸用主機一台

在此架構下，原則上授權的 CPU 越多軟體費用越高，但依據『ESXi 評估和授權模式』可用於建立以下結構

+ 常態用服務主機，設定為授權
+ 測試用服務主機，設定為評估，評估其到達後重設 ESXi 主機

## 參考

+ [VMware ESXi](https://www.techtarget.com/searchvmware/definition/VMware-ESXi)
+ [New Walkthroughs for vCenter High Availability](https://blogs.vmware.com/vsphere/2016/12/new-walkthroughs-vcenter-high-availability.html)
+ [VMware HA and DRS Explained](https://www.vembu.com/blog/ha-vs-drs-in-vmware-vsphere/)
+ [VMware vSphere HA and DRS Compared and Explained](https://www.nakivo.com/blog/vmware-vsphere-ha-and-drs-compared-and-explained/)