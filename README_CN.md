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
<a href=""><img src="https://img.shields.io/badge/Unreal Engine-5.3 to 5.5-purple.svg"></a>
<p align="center">
  <a href=""><img src="https://img.shields.io/badge/Windows-Win 10/11 X64-brightgreen.svg"></a>
  <a href=""><img src="https://img.shields.io/badge/Android->=8.0 (Arm64)-brightgreen.svg"></a>
  <a href=""><img src="https://img.shields.io/badge/MSVC->=14.38.33130-aff.svg"></a>
  <a href=""><img src="https://img.shields.io/badge/Windows SDK->=10.0.22621-orange.svg"></a>
  <a href=""><img src="https://img.shields.io/badge/Visual Sutdio->=2022.17.6.3-blue"></a>
</p>
<p align="center">
<a href="https://opensource.labijie.com/Mediapipe4u-plugin/update_logs/">最新动态</a>
| <a href="https://opensource.labijie.com/Mediapipe4u-plugin">文档</a>
| <a href="#Download">下载</a>
| <a href="https://github.com/endink/Mediapipe4u-plugin/releases/tag/M4U_Remoting_App">M4U Remoting(Android App)</a>
| <a href="https://huggingface.co/endink/M4U-Speech-Models/tree/main">语音模型包</a>
</p>
<p align="center">
<a href="https://opensource.labijie.com/Mediapipe4u-plugin/licensing/paid_license/">免费版 vs 付费版</a>
</p>
<br>
<p align="left">
Demo 工程: <a href="https://gitlab.com/endink/MediaPipe4U-Demo">Full Demo (Windows)</a> | <a href="https://gitlab.com/endink/mediapipe4u-android-demo">Android Demo</a>
</p>
</p>

# 简介

**MediaPipe4U**  提供了一系列的套件和工具，让你在虚幻引擎项目中快速应用人工智能（AI）和机器学习（ML）技术。您可以立即将这些解决方案集成到你的 UE 项目中，并根据您的需求对其进行自定义。包括动作捕捉、面部表情捕捉、语音合成 （TTS）、语音识别 （ASR） 等。所有功能都是实时的、离线的、低延迟的和易于使用的。

# 最新动态

### 20250506

- [fix] :rainbow: 动作捕捉在 `Android` 平台无法工作 ([#221](https://github.com/endink/Mediapipe4u-plugin/issues/221), [#190](https://github.com/endink/Mediapipe4u-plugin/issues/221))。 

### 20250408

- [new] :rainbow: 免费版本现在可以打包所有功能，包括语音和表情捕捉。
- [new] :rainbow: Ollama 支持：接入 [Ollama](https://ollama.com/) 进行大语言模型推理，从而支持了众多 LLM 模型，例如：DeepSeek、LLaMA，Phi, Qwen, QWQ 等。
- [new] :rainbow: 对话组件 `LLMSpeechChatRuntime`：整合 LLM 、TTS、ASR，可以在蓝图中非常容易实现对话机器人。
- [new] :rainbow: 添加了新的 TTS 支持：[Kokoro](https://github.com/hexgrad/kokoro), [Melo](https://github.com/myshell-ai/MeloTTS)。 
- [new] :rainbow: 添加了新的 ASR 支持：[FunASR](https://github.com/modelscope/FunASR)(中英热词版)，[FireRedASR](https://github.com/FireRedTeam/FireRedASR) (中英/方言) ,[MoonShine](https://github.com/usefulsensors/moonshine) (英语), [SenseVoice](https://github.com/usefulsensors/moonshine) (多语言: 中文/英语/日语/韩语/粤语).
- [new] :rainbow: 添加了一个 Transformer 架构 TTS 模型：[F5-TTS](https://github.com/SWivid/F5-TTS)，具备零样本语音克隆能力 （使用 DirectML/CUDA 推理，AMD/Nvidia GPU 均可）
- [new] :rainbow: 语音唤醒：使用小模型推理的语音唤醒，支持使用自定义语音唤醒词唤醒 ASR， 也支持独立的语音指令唤醒词功能。
- [new] :fire: 对齐 google mediapipe 到最新版本。
- [new] :fire: 添加 Unreal Engine 5.5 支持。
- [new] :rainbow: 加入了 NvAR 姿态捕捉算法，可以在 mediapipe 算法和 Nvidia Maxine 算法之间切换。
- [new] :rainbow: 开源了 [MediaPipe4U Remoting](https://github.com/endink/M4URemoting-Android) (用于 MediaPipe4U 的 Android 面部程序). 
- [new] :dizzy: `Custom Mediapipe Connector`（C++）: 自定义连接器, 支持完全替代 `google mediapipe` ，实现自定义逻辑  (#195, #204)。
- [new] :dizzy: `Custom Mediapipe Feature`（C++）: 自定义功能, 支持部分替代 `google mediapipe` ，实现自定义逻辑  (#195, #204)。
- [new] :rainbow: 新增 [Android Demo 工程](https://gitlab.com/endink/mediapipe4u-android-demo) (Gitlab)
- [improve]:footprints: Demo 工程升级到 UE5.5， 新增 `Fake Demo`，一个读取本地文件代替 mediapipe 的 C++ 扩展示例。
- [improve]:footprints: Demo 工程加入语音唤醒部分示例，发音人选择示例
- [improve]:footprints: Demo 工程加入 LLM 示例
- [improve]:footprints: Demo 工程加入语音对话机器人示例
- [improve]:footprints: Demo 工程现在支持了打包
- [break change] :collision: 动作捕捉部分被拆分到一个独立的 `MediaPipe4UMotion` 插件，这可能导致原有的蓝图失效，升级后你需要调整现有蓝图。
- [break change] :collision: 由于许可证文件格式变化，原有的许可证将不再可用，今后你可以从[这里](https://github.com/endink/Mediapipe4u-plugin/releases/tag/license-auto-release) 获得免费许可证。

语音包下载被移动到 [huggingface](https://huggingface.co/endink/M4U-Speech-Models/tree/main).   

> 暂时只有 Unreal Engine 5.5 版本，其随后陆续打包并发布 ...


# 已知问题    
- Google 新版 holistic task api 没有支持 GPU，所以安卓平台使用 CPU 推理，Windows 一如既往，使用 CPU 推理。
- Unreal Engine **5.4** 开始，引擎自带的 `OpenCV` 插件不再包含预编译库 (dll 文件)，首次启动 UE Editor 时，由于 M4U 依赖 `OpenCV` 插件, UE Editor 将尝试联网下载 `OpenCV` 源码并在你的计算机上编译, 这个过程可能耗时较长，给人引擎加载卡在 75% 的错觉，请耐心等待，并检查根目录下的 Saved 目录中的日志确认这个过程是否完成，对于中国用户来说，你可能还需要梯子联网, 你还可以遵循 [#166](https://github.com/endink/Mediapipe4u-plugin/discussions/166) 中的步骤手动解决这个问题。


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
  - Ollama 支持
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
| UE 5.2 | [百度网盘](https://pan.baidu.com/s/1pQb5aCzyxngo77SutLxslw?pwd=gyn5) | [One Drive](https://1drv.ms/u/c/63207d9047399149/EXWwSQP4Z19AlAdj61kD388BHdURs_RwQqW43ZkXkJW7yA?e=nMm6n0) | 2025-08-16 |
| UE 5.3 | [百度网盘](https://pan.baidu.com/s/1vZ3VI76KQUnh10Sks2Q_GA?pwd=uegk) | [One Drive](https://1drv.ms/u/c/63207d9047399149/ESmhoeLjDN1KrvBhZ2bskWwB6gV80vK1HvHeKn2I1dcF5w?e=Z2Vy3e) | 2025-05-06 |
| UE 5.4 | [百度网盘](https://pan.baidu.com/s/1MEqzqBxRerZHZiBY2Q4lgw?pwd=7wet) | [One Drive](https://1drv.ms/u/c/63207d9047399149/Ec8eTAxDzilIvNCd2WclAvIBdCReBilaRYhxE2GJGa6ELg?e=xu2Lk3) | 2025-05-06 |
| UE 5.5 | [百度网盘](https://pan.baidu.com/s/1KGqJe6dlIkF_T9Rbv9qbrg?pwd=6csi) | [One Drive](https://1drv.ms/u/c/63207d9047399149/ETwL3vzsvldGvDNUr9TB708BtR8jaqUqDzqXFHZrqB0lRA?e=FIgNE3) | 2025-05-06 |

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
| MediaPipe4UBVH          | :heavy_check_mark: | :heavy_check_mark: |Coming Soon|
| MediaPipe4USpeech       | :heavy_check_mark: | :x: |Coming Soon|

## 免费授权文件

授权文件会不定期的在[讨论区](https://github.com/endink/Mediapipe4u-plugin/discussions/82) 中发布, 新版本的插件包中也会自动包含授权文件。   

# M4U Remoting App（Android）

[获取源码](https://github.com/endink/M4URemoting-Android)

> **About M4U Remoting**   
>    
> 这是一个安卓端的程序（开源），它能够向 MediaPipe4U Windows 端程序发送表情数据。       
> 通过它，你能够使用 Android 移动设备完成表情捕捉，并在 Unreal Engine 的角色上呈现表情。

# Demo 工程

克隆或下载下列 Github 仓库获的 Demo 工程源代码:   

- `Windows Demo`: [https://gitlab.com/endink/mediapipe4u-demo](https://gitlab.com/endink/mediapipe4u-demo)
- `Android Demo`: [https://gitlab.com/endink/mediapipe4u-android-demo](https://gitlab.com/endink/mediapipe4u-android-demo)

使用 git 客户端获取 Demo 工程 (必须安装 [git](https://git-scm.com/downloads) 和 [git lfs](https://git-lfs.com/)) :

> Windows Demo 是一个全功能的 Demo， 如果你正在学习 `MediaPipe4U` 用法，推荐使用 Windows Demo.   

Windows Demo:
```shell
git lfs clone https://gitlab.com/endink/mediapipe4u-demo.git
```

Android Demo:
```shell
git lfs clone https://gitlab.com/endink/mediapipe4u-android-demo.git
```

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

# 致谢  

我们感谢以下开源项目和框架的贡献，它们对 M4U 的开发产生了重要影响：  

1. M4U 利用 [MediaPipe](https://github.com/google/mediapipe) 进行动作捕捉和人脸捕捉。  
2. M4U 利用 [NVIDIA Maxine AR SDK](https://github.com/NVIDIA/MAXINE-AR-SDK) 进行高级人脸追踪和捕捉。  
3. M4U 利用 [PaddleSpeech](https://github.com/PaddlePaddle/PaddleSpeech) 进行文本转语音（TTS）合成。  
4. M4U 利用 [FunASR](https://github.com/alibaba-damo-academy/FunASR) 进行自动语音识别（ASR）。  
5. M4U 利用 [whisper.cpp](https://github.com/ggerganov/whisper.cpp) 作为 ASR 解决方案。  
6. M4U 利用 [Sherpa Onnx](https://github.com/k2-fsa/sherpa-onnx) 提升 ASR 能力。  
7. M4U 利用 [F5-TTS-ONNX](https://github.com/DakeQQ/F5-TTS-ONNX) 进行 F5-TTS 模型的导出。  
8. M4U 利用 [GStreamer](https://gstreamer.freedesktop.org/) 实现视频处理与实时流媒体解码。  
9. M4U 利用 [PowerIK](https://poweranimated.github.io/) 的代码，实现逆向运动学（IK）和地面适配功能。  
10. M4U 利用 [Kalidokit](https://github.com/yeemachine/kalidokit) 的概念，用于动作捕捉领域。  
11. M4U 利用 [wongfei](https://github.com/wongfei) 的代码，增强 GStreamer 与 MediaPipe 的互操作性。  

我们向这些项目的开发者和贡献者表示衷心的感谢，他们的创新与开源贡献极大地推动了 M4U 的发展。  
