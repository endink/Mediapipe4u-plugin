[简体中文](./README_CN.md)
<br>
<br>
<p align="center">
<img alt="MediaPipe4U" src="./logo.png">
<p>
<p align="center">
An Unreal Engine plugin that helps you use AI and ML techniques in your unreal engine project.
<br>
<br>
<img alt="Windows" src="./readme_images/windows_logo.svg">
<img alt="Android" src="./readme_images/android_logo.svg">
<img alt="Linux" src="./readme_images/linux_logo.svg">
<br>
<br>
<a href=""><img src="https://img.shields.io/badge/Platform-Windows, Android-red.svg"></a>
<a href=""><img src="https://img.shields.io/badge/Unreal Engine-5.0, 5.1, 5.2-purple.svg"></a>
<p align="center">
  <a href=""><img src="https://img.shields.io/badge/Windows-Win 10/11 X64-brightgreen.svg"></a>
  <a href=""><img src="https://img.shields.io/badge/Android->=8.0 (Arm64)-brightgreen.svg"></a>
  <a href=""><img src="https://img.shields.io/badge/VC++ Runtime->=14.36.32532-aff.svg"></a>
  <a href=""><img src="https://img.shields.io/badge/Windows SDK->=10.0.22621-orange.svg"></a>
  <a href=""><img src="https://img.shields.io/badge/Visual Sutdio->=2022.17.6.3-blue"></a>
</p>
<p align="center">
<a href="https://opensource-labijie-com.translate.goog/Mediapipe4u-plugin/update_logs/?_x_tr_sl=zh-CN&_x_tr_tl=en&_x_tr_hl=zh-CN&_x_tr_pto=wapp">News</a>
| <a href="#document">Document</a>
| <a href="#download">Download</a>
| <a href="https://github.com/endink/MediaPipe4U-Demo">Demo Project</a>
| <a href="https://github.com/endink/Mediapipe4u-plugin/releases/tag/M4U_Remoting_App">M4U Remoting(Android App)</a>
| <a href="https://github.com/endink/Mediapipe4u-plugin/releases/tag/speech_models">Speech Model Packages</a>
</p>
<p align="center">
<a href="https://opensource.labijie.com/Mediapipe4u-plugin/licensing/pay_license.html">Free Edtion vs Commercial Edition</a>
</p>
</p>

# Introduction

**MediaPipe4U** provides a suite of libraries and tools for you to quickly apply artificial intelligence (AI) and machine learning (ML) techniques in Unreal Engine project. You can plug these solutions into your UE project immediately, customize them to your needs. Include motion capture , facial expression capture for your 3D avatar, text to speech (TTS), speech recorgnization (ASR), etc. All features are real-time, offline, low latency and easy to use.

# What's news

Latest update: `20231010`

- [new] :rainbow: **MediaPipe4U Mobile** Android packaging support, the development process is fully compatible with Windows.
- [new] :fire: Both `StartCamera` and `StartImageSource` now support truly blueprint-friendly asynchronous functions.
- [improve] Optimize frame pipline, huge performance improve, now Windows CPU can reach **25** fps (CPU: AMD 3600, Frame Size: 1280 * 720).
- [breaking change]:rotating_light:Many functions are now BlueprintPure and may require changes to your blueprint.

## Release Notes
For the release notes, ref below:
- [Release Notes (English, it's google translate)](https://opensource-labijie-com.translate.goog/Mediapipe4u-plugin/update_logs/?_x_tr_sl=zh-CN&_x_tr_tl=en&_x_tr_hl=zh-CN&_x_tr_pto=wapp)   
- [Release Notes (简体中文)](https://opensource.labijie.com/Mediapipe4u-plugin/update_logs/)   

# Features

:green_heart:All features are pure C++,  no Python or external programs required.

- Motion Capture
  - Motion of the body
  - Motion of the fingers
  - Movement
  - Drive 3D avatar
  - Real-time
  - RGB webcam supported
- Face Capture
  - Facial expression.
  - Arkit Blendshape compatible (52 expression) 
  - Live link compatible
  - Real-time
  - RGB webcam supported
- Multi-source Capture
  - RGB WebCam
  - Video File
  - Image
  - Living Stream (RTMP/SMTP)
  - Android Device (M4U Remoting)
- LLM
  - Offline
  - CPU/GPU Inference 
  - Multiple models
    - LLaMA/LLaMA2
    - ChatGLM (work in progress)
- TTS
  - Offline
  - Real-time
  - Lip-Sync
  - Multiple models
    - Paddle Speech: Chinese, English 
    - Bark: 13 languages (work in progress)
- ASR
  - Offline
  - Real-time
  - Multiple models
    - FunASR: Chinese 
    - Whisper: 99 languages
- Animation Data Export
  - BVH export 
- Pure plugins
  - No external programs required
  - All in Unreal Engine

# Document

- [中文文档](https://opensource.labijie.com/Mediapipe4u-plugin/)   

- [English (sorry it's google translate)](https://opensource-labijie-com.translate.goog/Mediapipe4u-plugin/?_x_tr_sch=http&_x_tr_sl=zh-CN&_x_tr_tl=en&_x_tr_hl=zh-CN&_x_tr_pto=wapp)

- [日本語 (申し訳ありませんが、それは単なるGoogle翻訳です)](https://opensource-labijie-com.translate.goog/Mediapipe4u-plugin/?_x_tr_sl=zh-CN&_x_tr_tl=ja&_x_tr_hl=zh-CN&_x_tr_pto=wapp)

- [한국어 (죄송합니다, 이것은 단지 구글 번역입니다)](https://opensource-labijie-com.translate.goog/Mediapipe4u-plugin/?_x_tr_sl=zh-CN&_x_tr_tl=ko&_x_tr_hl=zh-CN&_x_tr_pto=wapp)

# Download   

| Unreal Engine | China Site | Global Site | Update |
|---| --- | --- |----|
| UE 5.0 | [奶牛快传](https://cowtransfer.com/s/357f1ea3468b4e) | [One Drive](https://1drv.ms/u/s!AkmROUeQfSBjz3h94Dhx7Lh3-BTv?e=Sdlr1P) | 2023-08-29 |
| UE 5.1 | [奶牛快传](https://cowtransfer.com/s/b33bfdbdcd9a4b) | [One Drive](https://1drv.ms/u/s!AkmROUeQfSBjz3d4Gg2CkhsiRYM-?e=cidqQl) | 2023-08-29 |
| UE 5.2 | [奶牛快传](https://cowtransfer.com/s/8beda46e813641) | [One Drive](https://1drv.ms/u/s!AkmROUeQfSBjz3aPSP0Pe9Xrl8mA?e=FDXogv) | 2023-08-29 |

<!-- **:nauseated_face:Sorry, there is a compilation bug in the latest version, temporarily fall back to version 0718**    -->

  
> Because the plugin is precompiled and contains a large number of C++ link symbols and debug symbols, it will cost **10G** disk space after decompression (most files are UE-generated binaries in Intermediate).   
> Don't need to worry about disk usage, this is just disk usage during development, after the project is packaged, the plug-in disk usage is **300M** only (most files are GStreamer dynamic library and speech models).

# Cross Platform    

Now, M4U support Android and Windows (Linux is coming soom)

| Plugins (Modules) | Windows | Android | Linux |
|---| --- | --- | ---- |
| MediaPipe4U             | :heavy_check_mark: | :heavy_check_mark: |Coming Soon|
| MediaPipe4ULiveLink     | :heavy_check_mark: | :heavy_check_mark: |Coming Soon|
| GStreamer               | :heavy_check_mark: | :x: |Coming Soon|
| MediaPipe4UGStreamer    | :heavy_check_mark: | :x: |Coming Soon|
| MediaPipe4UBVH          | :heavy_check_mark: | :x: |Coming Soon|
| MediaPipe4USpeech       | :heavy_check_mark: | :x: |Coming Soon|
| MediaPipe4ULLM          | :heavy_check_mark: | :x: |Coming Soon|


# Free License File Release

The license file will be published in the [discussion](https://github.com/endink/Mediapipe4u-plugin/discussions/82), and the plugin package file will automatically include an license file.   

# M4U Remoting App

| Android Version | Download Link | Update |
|---| --- | --- |
| Android 7.0 or later | [Download](https://github.com/endink/Mediapipe4u-plugin/releases/download/M4URemoting_20230421/M4URemoting_20230421.apk) | 2023-04-21 |


> **About M4U Remoting**   
>    
> <mark>Note</mark>    
> This is a commercial license exclusive feature: capturing facial expressions from android device.   
> Free license only supports using in UE Editor, cannot be packaged this feature.   
> [M4U Remoting Document](https://opensource.labijie.com/Mediapipe4u-plugin/features/m4u_remoting.html)
  
# Demo Project
Please clone this repository to get demo project:   
- https://github.com/endink/MediaPipe4U-Demo  

> The demo project does not contain plugins, you need to download the plugin and copy content to the project's plugins folder to run.


# Video Channels

**Video Tutorials (English)**

[![MediaPipeU Metahuman Tutorials](https://res.cloudinary.com/marcomontalbano/image/upload/v1680609544/video_to_markdown/images/youtube--XLmKnG6UMzo-c05b58ac6eb4c4700831b2b3070cd403.jpg)](https://www.youtube.com/watch?v=XLmKnG6UMzo "MediaPipeU Metahuman Tutorials")

**Video Tutorials (Chinese)**

[bilibili](https://www.bilibili.com/video/BV1124y157hz/)


# FAQ

If you have any questiongs, please check [FAQ](./faq) first. The problems listed there may be also yours. If you can’t find an answer in the FAQ, please post an issue. Private message or emal may cause the question to be mised .

# Performance

Since the Windows version of MediaPipe does not support GPU inference, Windows relies on the CPU to inferring human pose estimation (see MediaPipe offical site for more details).


**Evaluation** 

Frame Rate： 18-24 fps 

CPU usage：20% (Based on DEMO project)  

**Testing Evnrioment**

CPU： AMD 3600 CPU   
RAM: 32GB   
GPU: Nvidia 1660s


# Follow Me

[bilibili](https://space.bilibili.com/481665211)   

[Youtube](https://www.youtube.com/channel/UCiOTp6S7N3GX46_nLQ17CrA)   


# Acknowledge     

1. M4U used [MediaPipe](https://github.com/google/mediapipe) for motion capture and face capture.
2. M4U used [NVIDIA Maxine AR SDK](https://github.com/NVIDIA/MAXINE-AR-SDK) for facal capture.
3. M4U used [Paddle Speech](https://github.com/PaddlePaddle/PaddleSpeech) for TTS.
4. M4U used [FunASR](https://github.com/alibaba-damo-academy/FunASR) for ASR.
5. M4U used [whisper.cpp](https://github.com/ggerganov/whisper.cpp) for ASR.
6. M4U used [GStreamer](https://gstreamer.freedesktop.org/) for video and live streaming decoding.
7. M4U used [llama.cpp](https://github.com/ggerganov/llama.cpp) for inference of LLaMA2 model.
8. M4U borrowed a lot of code from [PowerIK](https://poweranimated.github.io/) for ground ik.
9. M4U borrowed a lot of ideas from [Kalidokit](https://github.com/yeemachine/kalidokit) for mocap.
10. M4U borrowed a lot of code from [wongfei](https://github.com/wongfei) for gstreamer/mediapipe integration.