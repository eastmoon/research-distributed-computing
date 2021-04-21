# Vagrant 技術議題

## [Vagrant cant see the powershell](https://github.com/hashicorp/vagrant/issues/9629)

安裝完畢後，任何 Vagrant 指令皆顯示無法找到 Powershell 工具，導致無法正常使用；使用 ```vagrant /? --debug``` 檢查其運作過程，可以確定問題在執行以下命令後的異常

```
C:\Windows\System32\WindowsPowerShell\v1.0\powershell -NoLogo -NoProfile -NonInteractive -ExecutionPolicy Bypass -Command Write-Output $PSVersionTable.PSVersion.Major
```
> 此命令是取回當前 Powershell 的主要版本編號

但可以確認的是取回執行正常，但後期判斷卻出現以下錯誤

```
ERROR vagrant: #<Vagrant::Errors::PowerShellInvalidVersion: The version of powershell currently installed on this host is less than
the required minimum version. Please upgrade the installed version of powershell to the minimum required version and run the command again.

Installed version: N/A
Minimum required version: 3
```

以下為文獻建議處置方式：

+ open with admin vagrant.exe (C:\HashiCorp\Vagrant\bin)
+ open with admin CMD
+ open with admin Powershell (C:\Windows\System32\WindowsPowerShell\v1.0)
+ disabled HYPER-V
+ PowerShell command: $env:VAGRANT_POWERSHELL_VERSION_DETECTION_TIMEOUT = "60"

但目前皆無法使其正常，最後測試是使用 ```Git Bash``` 才能正常運作；可以解釋的邏輯錯誤應該是 Windows 在 PowerShell 或其相關程式中無法正確取回版本編號，導致系統認定輸出為 ```N/A```，而透過不同的 Console 可正常亦表示是在解析 tty 回傳或相關邏輯異常導致。
