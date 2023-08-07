[English](./README.md)
<br>
<br>
<p align="center" style="font-size:64px">
<img alt="MediaPipe4U" src="./logo.png">
<p>
<p align="center">
一个帮助你集成人工智能和机器学习技术到虚幻引擎的 UE 插件。
<br>
<br>
<a href=""><img src="https://img.shields.io/badge/OS-Windows X64-brightgreen.svg"></a>
<a href=""><img src="https://img.shields.io/badge/VC++ Runtime->=14.36.32532-aff.svg"></a>
<a href=""><img src="https://img.shields.io/badge/Windows SDK->=10.0.22621-orange.svg"></a>
<a href=""><img src="https://img.shields.io/badge/Visual Sutdio->=2022.17.6.3-blue"></a>
<a href=""><img src="https://img.shields.io/badge/Unreal Engine-5.0, 5.1, 5.2-purple.svg"></a>
<p align="center">
<a href="https://opensource.labijie.com/Mediapipe4u-plugin/update_logs/">最新动态</a>
| <a href="https://opensource.labijie.com/Mediapipe4u-plugin">文档</a>
| <a href="#Download">下载</a>
| <a href="https://github.com/endink/MediaPipe4U-Demo">Demo 工程</a>
| <a href="https://github.com/endink/Mediapipe4u-plugin/releases/tag/M4U_Remoting_App">M4U Remoting(Android App)</a>
| <a href="https://github.com/endink/Mediapipe4u-plugin/releases/tag/speech_models">语音模型包</a>
</p>
<p align="center">
<a href="https://opensource.labijie.com/Mediapipe4u-plugin/licensing/pay_license.html">免费版 vs 付费版</a>
</p>
</p>

# 简介

**MediaPipe4U**  提供了一系列的套件和工具，让你在虚幻引擎项目中快速应用人工智能（AI）和机器学习（ML）技术。您可以立即将这些解决方案集成到你的 UE 项目中，并根据您的需求对其进行自定义。包括动作捕捉、面部表情捕捉、语音合成 （TTS）、语音识别 （ASR） 等。所有功能都是实时的、离线的、低延迟的和易于使用的。

# 最新动态

`20230807`   

- [new] :rainbow:新增**离线**大语言模型（LLM）功能，支持离线部署并推理 llama2 模型([文档](https://opensource.labijie.com/Mediapipe4u-plugin/llm/))。   
- [new] :rainbow:新增 LLM Speech 功能，集成语音插件到 LLM， 可以自动朗读模型生成结果。
- [new] :rainbow:发布新的 ONNX 语音模型包（音质更好），新增四个语音模型包：中文、中文男声、英文、英文女声（[语音包发布页](https://github.com/endink/Mediapipe4u-plugin/releases/tag/speech_models)）。
- [new] TTS 推理支持 Onnx 推理，可以使用质量更高的声码器。   
- [new] 加入异步开启摄像头支持（StartCameraAsync），防止摄像头启动时界面卡顿。   
- [new] MediaPipeSpeechActor 中加入 TTS 蓝图操作函数（LocalTTSComponent 部分函数不再支持蓝图访问）。   
- [improve] TTS 支持文本朗读排队，可以连续朗读多个文本（SpeakText 函数新增 StopPrevious 参数）。   
- [improve] 当 NvAR SDK 未安装时打包不会再失败，而是给出警告信息。   
- [improve] 移除 pdb 文件，进一步缩减打包尺寸。   
- [fix] 修复表情捕捉时如果开启 Unreal Engine 的 LiveLink 界面将导致程序崩溃。   
- [fix] 修复语音识别事件中直接进行 UI 处理时程序崩溃（[#90](https://github.com/endink/Mediapipe4u-plugin/issues/90)）。   
- [fix] 修复 Pose Asset Baker 工具在 UE 5.2 版本使用崩溃问题 ([#88](https://github.com/endink/Mediapipe4u-plugin/issues/88))。
- [fix] TTS 停止朗读小概率发生无法停止。
- [fix] TTS/ASR 解析文件夹时编码存在问题，可能导致在磁盘创建错误的文件夹。   

## Release Notes
更多更新信息，请查看更新日志:
- [更新日志](https://opensource.labijie.com/Mediapipe4u-plugin/update_logs/)  

# 功能

- 动作捕捉
  - 身体运动捕捉
  - 手指运动捕捉
  - 位移捕捉
  - 3D 模型驱动
  - 实时驱动
  - 支持普通摄像头
- 表情捕捉
  - 面部表情
  - Arkit Blendshape 兼容 (52 个表情) 
  - Live link 兼容
  - 实时驱动
  - 支持普通摄像头
- 多捕捉源
  - 普通摄像头
  - 视频文件
  - 图片
  - 流媒体 (RTMP/SMTP)
  - 安卓设备（手机、平板） (M4U Remoting)
- 大语言模型（LLM）
  - 离线部署和推理
  - 模型支持: LLaMA2
  - CPU 推理 
  - 纯 C++: UE 插件, 无需 Python 和外部程序
- 语音合成（TTS）
  - 离线合成
  - 实时合成
  - 3D 模型口型同步
- 语音识别（ASR）
  - 离线识别
  - 实时识别
- 动画导出
  - BVH 数据导出 
- 纯插件
  - 无需外部程序
  - Unreal Engine 中完成一切

# 文档

- [简体中文](https://opensource.labijie.com/Mediapipe4u-plugin/)   

- [English (sorry it's google translate)](https://opensource-labijie-com.translate.goog/Mediapipe4u-plugin/?_x_tr_sch=http&_x_tr_sl=zh-CN&_x_tr_tl=en&_x_tr_hl=zh-CN&_x_tr_pto=wapp)

- [日本語 (申し訳ありませんが、それは単なるGoogle翻訳です)](https://opensource-labijie-com.translate.goog/Mediapipe4u-plugin/?_x_tr_sl=zh-CN&_x_tr_tl=ja&_x_tr_hl=zh-CN&_x_tr_pto=wapp)

- [한국어 (죄송합니다, 이것은 단지 구글 번역입니다)](https://opensource-labijie-com.translate.goog/Mediapipe4u-plugin/?_x_tr_sl=zh-CN&_x_tr_tl=ko&_x_tr_hl=zh-CN&_x_tr_pto=wapp)

# Download

|UE 版本| 下载地址 1 | 下载地址 2 | 更新时间 |
|---| --- | --- |----|
| UE 5.0 | [奶牛快传](https://cowtransfer.com/s/24af2cb737ea4b) | [One Drive](https://1drv.ms/u/s!AkmROUeQfSBjzzL3p1oJhOwVLtwa?e=0dC6LE) | 2023-08-07 |
| UE 5.1 | [奶牛快传](https://cowtransfer.com/s/6bc307201a2741) | [One Drive](https://1drv.ms/u/s!AkmROUeQfSBjzzG2jd-jJtN9LMWa?e=FBh7UV) | 2023-08-07 |
| UE 5.2 | [奶牛快传](https://cowtransfer.com/s/3f80899c0a8c44) | [One Drive](https://1drv.ms/u/s!AkmROUeQfSBjzzAk1Wl2yf_wa8Ty?e=0ADBWg) | 2023-08-07 |

如果你想了解每一次发布包含的更新内容，请访问 [**更新日志**](https://opensource.labijie.com/Mediapipe4u-plugin/update_logs/)  页面  
   
> 插件由于采用预编译，包含大量 C++ 链接符号和调试符号，解压后会占用 **5G** 磁盘空间（大部分为 Intermediate 中的 UE 生成代码）   
> 你不需要担心磁盘占用问题，这只是开发期间的磁盘占用，在项目打包后，插件磁盘占用大约是 **200M**（主要为 GStreamer 动态库）

## 免费授权文件

授权文件会不定期的在[讨论区](https://github.com/endink/Mediapipe4u-plugin/discussions/82) 中发布, 新版本的插件包中也会自动包含授权文件。   

# M4U Remoting App

| Android 版本 | 下载连接 | 更新时间 |
|---| --- | --- |
| Android 7.0 or later | [Download](https://github.com/endink/Mediapipe4u-plugin/releases/download/M4URemoting_20230421/M4URemoting_20230421.apk) | 2023-04-21 |


> **关于 M4U Remoting**   
>    
> <mark>Note</mark>    
> 这是一个付费授权许包含的功能: 可以从安卓设备中捕捉表情。     
> 免费授权许可用户也可以在编辑器中体验它, 但是它不能被打包，请悉知。   
> [M4U Remoting 文档](https://opensource.labijie.com/Mediapipe4u-plugin/features/m4u_remoting.html)

# Demo 工程

克隆或下载下列 Github 仓库获的 Demo 工程源代码:

- https://github.com/endink/MediaPipe4U-Demo  

> Demo 工程不包含插件，你需要自行下载插件，放到该工程的 Plugins 目录


<!-- [![MediaPipe4U](./cover.gif "MediaPipe4U")](./cover.gif) -->

# 插件视频

**英文视频教程 (油管)**

[![MediaPipeU Metahuman Tutorials](https://res.cloudinary.com/marcomontalbano/image/upload/v1680609544/video_to_markdown/images/youtube--XLmKnG6UMzo-c05b58ac6eb4c4700831b2b3070cd403.jpg)](https://www.youtube.com/watch?v=XLmKnG6UMzo "MediaPipeU Metahuman Tutorials")

**中文视频教程 (bilibili)**

[bilibili](https://www.bilibili.com/video/BV1124y157hz/)
 

## FAQ

如果你遇到问题，请优先查看 [FAQ](./faq)，这里整理了许多网友遇到的问题，或许也是你遇到的问题，如果 FAQ 中找到不到，优先使用 github 提交 issue, 私信可能会导致问题被我遗忘。

## 性能

由于 MediaPipe Windows 版本不支持 GPU 推理，Windows 依靠 CPU 完成人形姿态预测（具体信息参考 MediaPipe）：

**测试环境**

CPU： AMD 3600 CPU   
内存: 32GB   
显卡: 1660s（此型号显卡无光追）   


**表现：** 

帧率(fps)： 18-24  

CPU 占用率：20% (测试 DEMO 仅包含 MetahumanLight 场景和 VRM 模型)  



# Follow Me

[B站](https://space.bilibili.com/481665211)   

[Youtube](https://www.youtube.com/channel/UCiOTp6S7N3GX46_nLQ17CrA)   


国内如果视频无法显示，请访问[B站视频](https://www.bilibili.com/video/BV1JD4y1r7ow)   

