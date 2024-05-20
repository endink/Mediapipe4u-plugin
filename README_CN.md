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
<img alt="Windows" src="./readme_images/windows_logo.svg">
<img alt="Android" src="./readme_images/android_logo.svg">
<img alt="Linux" src="./readme_images/linux_logo.svg">
<br>
<br>
<a href=""><img src="https://img.shields.io/badge/Platform-Windows, Android-red.svg"></a>
<a href=""><img src="https://img.shields.io/badge/Unreal Engine-5.1, 5.2, 5.4-purple.svg"></a>
<p align="center">
  <a href=""><img src="https://img.shields.io/badge/Windows-Win 10/11 X64-brightgreen.svg"></a>
  <a href=""><img src="https://img.shields.io/badge/Android->=8.0 (Arm64)-brightgreen.svg"></a>
  <a href=""><img src="https://img.shields.io/badge/VC++ Runtime->=14.36.32532-aff.svg"></a>
  <a href=""><img src="https://img.shields.io/badge/Windows SDK->=10.0.22621-orange.svg"></a>
  <a href=""><img src="https://img.shields.io/badge/Visual Sutdio->=2022.17.6.3-blue"></a>
</p>
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

最后更新：`20240520`   

- [new] :rainbow: Unreal Engine **5.4** 版本支持，我跳过了 5.3 版本，精力有限，实在抱歉。
- [new] :rainbow: 加入 **Control Rig** 支持 (预览质量). 新的动画蓝图节点 `ControlRigFromPose` 已经可用，可以将任意姿态转换到 ControlRig 蓝图中，方便使用 ControlRig 制作关节限制、全身 IK 等。
- [new] :fire: 对齐 google mediapipe 到最新版本，使用全新的 holistic task api, 整体追踪方案性能进一步提升，表情算解效果提升。
- [fix] #130: 当打包游戏时，mediapipe 模型文件丢失.
- [improve] 安卓平台性能优化, 现在，M4U 在安卓手机上可以跑到 **15**-**20** fps (CPU: 高通骁龙 870 ).
- [remove] :nauseated_face: LLM 插件被移除. 由于大语言模型（LLM）本地推理需要苛刻的硬件资源，加之 llama.cpp 长期高频发布，没有稳定版本，暂时移除这个插件，或许将来还会回归。
- [remove] :nauseated_face: 从这个版本开始,5.0.x 的 Unreal Engine 版本将不再支持. 因为 5.0.X 需要 VS 2019 才能编译，我的开发机中已经不再安装 VS 2019, 非常抱歉 ！旧版的 5.0.x 插件任然可用。

# 已知问题    
- Google 新版 holistic task api 没有支持 GPU，所以安卓平台使用 CPU 推理，Windows 一如既往，使用 CPU 推理。
- Unreal Engine **5.4** 开始，引擎自带的 `OpenCV` 插件不再包含预编译库 (dll 文件)，首次首次引擎时，由于 M4U 依赖 `OpenCV` 插件, UE Editor 启动时将尝试联网下载 `OpenCV` 源码并编译, 这个过程可能耗时较长，感觉像是引擎加载卡在 75%，请耐心等待并项目根目录下的 Saved 目录中的日志确认这个过程是否完成，对于中国用户来说，你可能还需要梯子联网。


## Release Notes
更多更新信息，请查看更新日志:
- [更新日志](https://opensource.labijie.com/Mediapipe4u-plugin/update_logs/)  

:green_heart:所有的功能都是纯 C++ 的，无需 Python, 无需任何外部程序。

# 功能

- 动作捕捉
  - 身体运动捕捉
  - 手指运动捕捉
  - 位移捕捉
  - 3D 模型驱动
  - 实时驱动
  - 支持普通摄像头
  - ControlRig 支持
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
  - CPU/GPU 推理 
  - 多模型支持
     - LLaMA/LLaMA2
     - ChatGLM (开发中...)
- 语音合成（TTS）
  - 离线合成
  - 实时合成
  - 3D 模型口型同步
  - 多模型支持
    - PaddleSpeech: 中文、英文
    - Bart: 13 种语言
- 语音识别（ASR）
  - 离线识别
  - 实时识别
  - 多模型支持
    - FunASR: 中文 
    - Whisper: 99 种语言
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
| UE 5.0 | [奶牛快传](https://cowtransfer.com/s/206ee1ac88964c) | [One Drive](https://1drv.ms/u/s!AkmROUeQfSBjz3pSY7YV9R7Rg87d?e=e3whKG) | 2023-10-10 |
| UE 5.1 | [奶牛快传](https://cowtransfer.com/s/e910b9a10b1b41) | [One Drive](https://1drv.ms/u/s!AkmROUeQfSBjz3s4EyOiiJJ-vzKj?e=2IFkuu) | 2023-10-10 |
| UE 5.2 | [奶牛快传](https://cowtransfer.com/s/e24b49901a4049) | [One Drive](https://1drv.ms/u/s!AkmROUeQfSBjz3muyv-KTSRYEdEj?e=7nneTd) | 2023-10-10 |


如果你想了解每一次发布包含的更新内容，请访问 [**更新日志**](https://opensource.labijie.com/Mediapipe4u-plugin/update_logs/)  页面  
   
> 插件由于采用预编译，包含大量 C++ 链接符号和调试符号，解压后会占用 **5G** 磁盘空间（大部分为 Intermediate 中的 UE 生成代码）   
> 你不需要担心磁盘占用问题，这只是开发期间的磁盘占用，在项目打包后，插件磁盘占用大约是 **200M**（主要为 GStreamer 动态库）


# 跨平台  

现在, M4U 支持 Android 和 Windows (Linux 支持即将到来)，但是各平台支持情况略有不同。

| 插件 (模块) | Windows | Android | Linux |
|---| --- | --- | ---- |
| MediaPipe4U             | :heavy_check_mark: | :heavy_check_mark: |Coming Soon|
| MediaPipe4ULiveLink     | :heavy_check_mark: | :heavy_check_mark: |Coming Soon|
| GStreamer               | :heavy_check_mark: | :x: |Coming Soon|
| MediaPipe4UGStreamer    | :heavy_check_mark: | :x: |Coming Soon|
| MediaPipe4UBVH          | :heavy_check_mark: | :x: |Coming Soon|
| MediaPipe4USpeech       | :heavy_check_mark: | :x: |Coming Soon|
| MediaPipe4ULLM          | :heavy_check_mark: | :x: |Coming Soon|

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

