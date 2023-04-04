# Mediapipe4U

MediaPipe4U is an UnrealEngine plugin that integrated Google Mediapipe technology for capturing human motion (include body, fingers, face) and puppeteering 3D avatar through webcam, videos, and images in realtime.

[中文页面](./README_CN.md)

## Docment

- [简体中文](https://opensource.labijie.com/Mediapipe4u-plugin/)   

- [English (sorry it's google translate)](https://opensource-labijie-com.translate.goog/Mediapipe4u-plugin/?_x_tr_sch=http&_x_tr_sl=zh-CN&_x_tr_tl=en&_x_tr_hl=zh-CN&_x_tr_pto=wapp)

- [日本語 (申し訳ありませんが、それは単なるGoogle翻訳です)](https://opensource-labijie-com.translate.goog/Mediapipe4u-plugin/?_x_tr_sl=zh-CN&_x_tr_tl=ja&_x_tr_hl=zh-CN&_x_tr_pto=wapp)

- [한국어 (죄송합니다, 이것은 단지 구글 번역입니다)](https://opensource-labijie-com.translate.goog/Mediapipe4u-plugin/?_x_tr_sl=zh-CN&_x_tr_tl=ko&_x_tr_hl=zh-CN&_x_tr_pto=wapp)

## Download   

| Unreal Engine | China Site | Global Site | Update |
|---| --- | --- |----|
| UE 5.0 | [cowtransfer (China)](https://cowtransfer.com/s/468192b5dc704b) | [OneDrive](https://1drv.ms/u/s!AkmROUeQfSBjzhRE5StJc1uJ-SRP?e=DFALmH) | 2023-04-03 |
| UE 5.1 | [cowtransfer (China)](https://cowtransfer.com/s/0a716ad46d0948) | [OneDrive](https://1drv.ms/u/s!AkmROUeQfSBjzhMMCW2sFyYQOWav?e=grGhCD) | 2023-04-03 |
  


<!-- > ### 历史版本  
> 
> - **Unreal Engine 5.0**
>
>  - [One Drive](https://1drv.ms/u/s!AkmROUeQfSBjzgWrCryGWYDK1SJj?e=7KUhai) (2023-02-27)
>
>  - [奶牛快传](https://cowtransfer.com/s/148d44d7d7bb48) (2023-02-27)
>
>- **Unreal Engine 5.1**
>
>  - [One Drive](https://1drv.ms/u/s!AkmROUeQfSBjzgibw3mJ9vC1kfwl?e=BDsqXt) (2023-03-11)
>
>  - [奶牛快传](https://cowtransfer.com/s/57864613496641) (2023-03-11)    -->
  
Because the plugin is precompiled and contains a large number of C++ link symbols and debug symbols, it will cost **5G** disk space after decompression (most files are UE-generated binaries in Intermediate).   
Don't need to worry about disk usage, this is just disk usage during development, after the project is packaged, the plug-in disk usage is **200M** only (most files are GStreamer dynamic library).
  

**Demo Project**   

- https://github.com/endink/MediaPipe4U-Demo  

> The demo project does not contain plugins, you need to download the plugin and copy content to the project's plugins folder to run.

---   

**Video Tutorials (English)**

[![MediaPipeU Metahuman Tutorials](https://res.cloudinary.com/marcomontalbano/image/upload/v1680609544/video_to_markdown/images/youtube--XLmKnG6UMzo-c05b58ac6eb4c4700831b2b3070cd403.jpg)](https://www.youtube.com/watch?v=XLmKnG6UMzo "MediaPipeU Metahuman Tutorials")

**Video Tutorials (Chinese)**

[bilibili](https://www.bilibili.com/video/BV1124y157hz/?share_source=copy_web&vd_source=f77a8ce9c4c322dcc88515970bea1630)

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

## Update History (Chinese)

### 2023-04-03
- [fix] LOD 变化时，如果骨骼变化，引发程序崩溃
- [fix] MediaPipe 表情解算 BrowDown 时右眼误差
- [fix] UE Editor 中 LiveLink管理器状态和 MediaPipeFaceLinkActor 不一致
- [fix] MediaPipe4U LiveLink Source 无法删除的问题 

> **Google Translate**
> - [fix] When the LOD changes, if the skeleton changes, it causes the program to crash
> - [fix] There is an error in the right eye when MediaPipe face solves BrowDown
> - [fix] The LiveLink manager state in the UE Editor is inconsistent with the MediaPipeFaceLinkActor
> - [fix] MediaPipe4U LiveLink Source could not be removed 
   
[More Update Logs](https://opensource.labijie.com/Mediapipe4u-plugin/update_logs/)

