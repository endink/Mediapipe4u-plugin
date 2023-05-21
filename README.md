# MediaPipe4U

MediaPipe4U is an UnrealEngine plugin that integrated Google Mediapipe technology for capturing human motion (include body, fingers, face) and puppeteering 3D avatar through webcam, videos, and images in realtime.

[中文页面](./README_CN.md)

## Document

- [中文文档](https://opensource.labijie.com/Mediapipe4u-plugin/)   

- [English (sorry it's google translate)](https://opensource-labijie-com.translate.goog/Mediapipe4u-plugin/?_x_tr_sch=http&_x_tr_sl=zh-CN&_x_tr_tl=en&_x_tr_hl=zh-CN&_x_tr_pto=wapp)

- [日本語 (申し訳ありませんが、それは単なるGoogle翻訳です)](https://opensource-labijie-com.translate.goog/Mediapipe4u-plugin/?_x_tr_sl=zh-CN&_x_tr_tl=ja&_x_tr_hl=zh-CN&_x_tr_pto=wapp)

- [한국어 (죄송합니다, 이것은 단지 구글 번역입니다)](https://opensource-labijie-com.translate.goog/Mediapipe4u-plugin/?_x_tr_sl=zh-CN&_x_tr_tl=ko&_x_tr_hl=zh-CN&_x_tr_pto=wapp)

## Unreal Plugin Download   

| Unreal Engine | China Site | Global Site | Update |
|---| --- | --- |----|
| UE 5.0 | [cowtransfer](https://cowtransfer.com/s/53032f0a9ad24f) | [OneDrive](https://1drv.ms/u/s!AkmROUeQfSBjzlHuVnXW-DHlS3Jq?e=Q4TrOA) | 2023-05-21 |
| UE 5.1 | [cowtransfer](https://cowtransfer.com/s/51224c59e9d64d) | [OneDrive](https://1drv.ms/u/s!AkmROUeQfSBjzlAlzXHG4pZaDOTU?e=jdOdGF) | 2023-05-21 |
  

  
> Because the plugin is precompiled and contains a large number of C++ link symbols and debug symbols, it will cost **10G** disk space after decompression (most files are UE-generated binaries in Intermediate).   
> Don't need to worry about disk usage, this is just disk usage during development, after the project is packaged, the plug-in disk usage is **300M** only (most files are GStreamer dynamic library and speech models).


## M4U Remoting App Download

| Android Version | Download Link | Update |
|---| --- | --- |
| Android 7.0 or later | [Download](https://github.com/endink/Mediapipe4u-plugin/releases/download/M4URemoting_20230421/M4URemoting_20230421.apk) | 2023-04-21 |


> **About M4U Remoting**   
>    
> <mark>Note</mark>    
> This is a commercial license exclusive feature: capturing facial expressions from android device.   
> Free license only supports using in UE Editor, cannot be packaged this feature.   
> [M4U Remoting Document](https://opensource.labijie.com/Mediapipe4u-plugin/features/m4u_remoting.html)
  
## Speech Packages Download

| Language | China Site | Global Site | Update |
|---| --- | --- | --- |
| Chinese Mandarin | [cowtransfer](https://cowtransfer.com/s/986250aed0314f) | [Github](https://github.com/endink/Mediapipe4u-plugin/releases/download/speech_model_Mandarin_20230521/speech_model_Mandarin_20230521.7z) | 2023-05-21 |


**Demo Project**   

- https://github.com/endink/MediaPipe4U-Demo  

> The demo project does not contain plugins, you need to download the plugin and copy content to the project's plugins folder to run.

---   


**Packaging Environment Requirements**   
- Visual Studio 2022   
- WINSDK: 10.0.22621 or later ([下载地址](https://developer.microsoft.com/zh-cn/windows/downloads/windows-sdk/))   
- Visual C++ Redistributable 14.35 or later  ([下载地址](https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist))   

---


**Video Tutorials (English)**

[![MediaPipeU Metahuman Tutorials](https://res.cloudinary.com/marcomontalbano/image/upload/v1680609544/video_to_markdown/images/youtube--XLmKnG6UMzo-c05b58ac6eb4c4700831b2b3070cd403.jpg)](https://www.youtube.com/watch?v=XLmKnG6UMzo "MediaPipeU Metahuman Tutorials")

**Video Tutorials (Chinese)**

[bilibili](https://www.bilibili.com/video/BV1124y157hz/)

---   

## FAQ

If you have any questiongs, please check [FAQ](./faq) first. The problems listed there may be also yours. If you can’t find an answer in the FAQ, please post an issue. Private message or emal may cause the question to be mised .

---
## Performance

Since the Windows version of MediaPipe does not support GPU inference, Windows relies on the CPU to inferring human pose estimation (see MediaPipe offical site for more details).

**Hardware Evnrioment**

CPU： AMD 3600 CPU   
RAM: 32GB   
GPU: Nvidia 1660s


**Evaluation** 

Frame Rate： 18-24 fps 

CPU usage：20% (Based on DEMO project)  

---


**Follow Me**

[bilibili](https://space.bilibili.com/481665211)   

[Youtube](https://www.youtube.com/channel/UCiOTp6S7N3GX46_nLQ17CrA)   

## Latest Update (Chinese)

### 2023-05-21
[new] 新增 **MediaPipe4USpeech** （商业授权功能，免费授权无法打包）插支持离线 TTS 和音唇同步（[文档](https://opensource.labijie.com/Mediapipe4u-plugin/speech/)）。   
[new] ControlRigPose 烘焙工具，方便制作 Metahuman 的口型资产。   
[fix] 移除工具箱材质，使用 C++ 动态创建，修复 UE5.0 打包材质问题。   

### 2023-05-05
[fix] UE5.0 材质打包版本不正确

### 2023-04-23   
[new] :fire:加入 M4U Remoting, 支持从安卓设备捕捉表情 （[文档](https://opensource.labijie.com/Mediapipe4u-plugin/features/m4u_remoting.html)）。   
[new] Android 面补工具开放下载（商业授权功能，免费授权无法打包）   
[new] UE 编辑器工具新功能：   
- LiveLink 追踪
- 位移、姿势校准
- 面容校准


[new] 统一位置、姿态校准，从 AnimationInstance 访问 CalibrationCountDownSeconds 等参数；现在，支持手动校准位置和姿势（:red_circle:Break Changes）。   
[fix] 动补回调包发生错误时可能导致 texture 被占用无法释放   
[fix] 退出编辑器时概率引发崩溃   
[fix] UE 工具箱状态不同步   
   
[More Update Logs](https://opensource.labijie.com/Mediapipe4u-plugin/update_logs/)

