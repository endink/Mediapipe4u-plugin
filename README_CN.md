# Mediapipe4U 插件

基于 MediaPipe 的 UnrealEngine 动作捕捉插件。 

## 文档

- [简体中文](https://opensource.labijie.com/Mediapipe4u-plugin/)   

- [English (sorry it's google translate)](https://opensource-labijie-com.translate.goog/Mediapipe4u-plugin/?_x_tr_sch=http&_x_tr_sl=zh-CN&_x_tr_tl=en&_x_tr_hl=zh-CN&_x_tr_pto=wapp)

- [日本語 (申し訳ありませんが、それは単なるGoogle翻訳です)](https://opensource-labijie-com.translate.goog/Mediapipe4u-plugin/?_x_tr_sl=zh-CN&_x_tr_tl=ja&_x_tr_hl=zh-CN&_x_tr_pto=wapp)

- [한국어 (죄송합니다, 이것은 단지 구글 번역입니다)](https://opensource-labijie-com.translate.goog/Mediapipe4u-plugin/?_x_tr_sl=zh-CN&_x_tr_tl=ko&_x_tr_hl=zh-CN&_x_tr_pto=wapp)

## UE 插件下载地址   

|UE 版本| 下载地址 1 | 下载地址 2 | 更新时间 |
|---| --- | --- |----|
| UE 5.0 | [奶牛快传](https://cowtransfer.com/s/54d67876155441) | [OneDrive](https://1drv.ms/u/s!AkmROUeQfSBjzju38jL0wvqcVlKO?e=x0UKM3) | 2023-05-05 |
| UE 5.1 | [奶牛快传](https://cowtransfer.com/s/42ab1e385b8b40) | [OneDrive](https://1drv.ms/u/s!AkmROUeQfSBjzi5i8c9VEakVrQES) | 2023-04-23 |
   
> 插件由于采用预编译，包含大量 C++ 链接符号和调试符号，解压后会占用 **5G** 磁盘空间（大部分为 Intermediate 中的 UE 生成代码）   
> 你不需要担心磁盘占用问题，这只是开发期间的磁盘占用，在项目打包后，插件磁盘占用大约是 **200M**（主要为 GStreamer 动态库）

## M4U Remoting App 下载

| Android 版本 | 下载连接 | 更新时间 |
|---| --- | --- |
| Android 7.0 or later | [Download](https://github.com/endink/Mediapipe4u-plugin/releases/download/M4URemoting_20230421/M4URemoting_20230421.apk) | 2023-04-21 |


> **关于 M4U Remoting**   
>    
> <mark>Note</mark>    
> 这是一个付费授权许包含的功能: 可以从安卓设备中捕捉表情。     
> 免费授权许可用户也可以在编辑器中体验它, 但是它不能被打包，请悉知。   
> [M4U Remoting 文档](https://opensource.labijie.com/Mediapipe4u-plugin/features/m4u_remoting.html)

**Demo Project**   

- https://github.com/endink/MediaPipe4U-Demo  

> Demo 工程不包含插件，你需要自行下载插件，放到该工程的 Plugins 目录

---   

[![MediaPipe4U](./cover.gif "MediaPipe4U")](./cover.gif)

---   

**打包环境要求**   
- Visual Studio 2022   
- WINSDK: 10.0.22621 or later ([下载地址](https://developer.microsoft.com/zh-cn/windows/downloads/windows-sdk/))   
- Visual C++ Redistributable 14.35 or later  ([下载地址](https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist))   

---   

## 问题反馈

如果你遇到问题，请优先查看 [FAQ](./faq)，这里整理了许多网友遇到的问题，或许也是你遇到的问题，如果 FAQ 中找到不到，优先使用 github 提交 issue, 私信可能会导致问题被我遗忘。

---
## 性能

由于 MediaPipe Windows 版本不支持 GPU 推理，Windows 依靠 CPU 完成人形姿态预测（具体信息参考 MediaPipe）：

**测试环境**

CPU： AMD 3600 CPU   
内存: 32GB   
显卡: 1660s（此型号显卡无光追）   


**表现：** 

帧率(fps)： 18-24  

CPU 占用率：20% (测试 DEMO 仅包含 MetahumanLight 场景和 VRM 模型)  

---


**Follow Me**

[B站](https://space.bilibili.com/481665211)   

[Youtube](https://www.youtube.com/channel/UCiOTp6S7N3GX46_nLQ17CrA)   


国内如果视频无法显示，请访问[B站视频](https://www.bilibili.com/video/BV1JD4y1r7ow)   

