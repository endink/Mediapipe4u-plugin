[简体中文](./README_CN.md)

# MediaPipe4U

<p align="left">
    <a href=""><img src="https://img.shields.io/badge/OS-Windows X64-brightgreen.svg"></a>
    <a href=""><img src="https://img.shields.io/badge/VC++ Runtime->=14.36.32532-aff.svg"></a>
    <a href=""><img src="https://img.shields.io/badge/Visual Sutdio->=2022.17.6.3-blue"></a>
    <a href=""><img src="https://img.shields.io/badge/Unreal Engine-5.0, 5.1-yellow.svg"></a>
</p>

MediaPipe4U provides a suite of libraries and tools for you to quickly apply artificial intelligence (AI) and machine learning (ML) techniques in Unreal Engine project. You can plug these solutions into your UE project immediately, customize them to your needs. Include motion capture , facial expression capture for your 3D avatar, text to speech (TTS), speech recorgnization (ASR), etc. All features are real-time, offline, low latency and easy to use.


## Document

- [中文文档](https://opensource.labijie.com/Mediapipe4u-plugin/)   

- [English (sorry it's google translate)](https://opensource-labijie-com.translate.goog/Mediapipe4u-plugin/?_x_tr_sch=http&_x_tr_sl=zh-CN&_x_tr_tl=en&_x_tr_hl=zh-CN&_x_tr_pto=wapp)

- [日本語 (申し訳ありませんが、それは単なるGoogle翻訳です)](https://opensource-labijie-com.translate.goog/Mediapipe4u-plugin/?_x_tr_sl=zh-CN&_x_tr_tl=ja&_x_tr_hl=zh-CN&_x_tr_pto=wapp)

- [한국어 (죄송합니다, 이것은 단지 구글 번역입니다)](https://opensource-labijie-com.translate.goog/Mediapipe4u-plugin/?_x_tr_sl=zh-CN&_x_tr_tl=ko&_x_tr_hl=zh-CN&_x_tr_pto=wapp)

## Unreal Plugin Download   

| Unreal Engine | China Site | Global Site | Update |
|---| --- | --- |----|
| UE 5.0 | [cowtransfer](https://cowtransfer.com/s/65dfb07d5ab049) | [One Drive](https://1drv.ms/u/s!AkmROUeQfSBjzn607nI2T98QsMEk?e=EkoGWg) | 2023-06-28 |
| UE 5.1 | [cowtransfer](https://cowtransfer.com/s/14fda3e9ca6b46) | [One Drive](https://1drv.ms/u/s!AkmROUeQfSBjzn9bhIUyOO4f9Sj1?e=OrYkkR) | 2023-06-28 |

If you want to know what's news in each release, please visit the page below:   
  
- [Release Notes (English, it's google translate)](https://opensource-labijie-com.translate.goog/Mediapipe4u-plugin/update_logs/?_x_tr_sl=zh-CN&_x_tr_tl=en&_x_tr_hl=zh-CN&_x_tr_pto=wapp)   
- [Release Notes (简体中文)](https://opensource.labijie.com/Mediapipe4u-plugin/update_logs/)   

  
> Because the plugin is precompiled and contains a large number of C++ link symbols and debug symbols, it will cost **10G** disk space after decompression (most files are UE-generated binaries in Intermediate).   
> Don't need to worry about disk usage, this is just disk usage during development, after the project is packaged, the plug-in disk usage is **300M** only (most files are GStreamer dynamic library and speech models).


## Free License File Release

The license file will be published in the [discussion](https://github.com/endink/Mediapipe4u-plugin/discussions/82), and the plugin package file will automatically include an license file.   

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


## Demo Project    
Please clone this repository to get demo project:   
- https://github.com/endink/MediaPipe4U-Demo  

> The demo project does not contain plugins, you need to download the plugin and copy content to the project's plugins folder to run.

---   


**Packaging Environment Requirements**   
- Visual Studio 2022 17.6.3 or later   
- WINSDK: 10.0.22621 or later ([下载地址](https://developer.microsoft.com/zh-cn/windows/downloads/windows-sdk/))   
- Visual C++ Redistributable 14.36.32532 or later  ([下载地址](https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist))   

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