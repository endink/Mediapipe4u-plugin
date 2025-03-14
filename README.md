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
<a href=""><img src="https://img.shields.io/badge/Unreal Engine-5.1, 5.2, 5.4-purple.svg"></a>
<p align="center">
  <a href=""><img src="https://img.shields.io/badge/Windows-Win 10/11 X64-brightgreen.svg"></a>
  <a href=""><img src="https://img.shields.io/badge/Android->=8.0 (Arm64)-brightgreen.svg"></a>
  <a href=""><img src="https://img.shields.io/badge/MSVC->=14.38.33130-aff.svg"></a>
  <a href=""><img src="https://img.shields.io/badge/Windows SDK->=10.0.22621-orange.svg"></a>
  <a href=""><img src="https://img.shields.io/badge/Visual Sutdio->=2022.17.9.6-blue"></a>
</p>
<p align="center">
<a href="https://opensource-labijie-com.translate.goog/Mediapipe4u-plugin/update_logs/?_x_tr_sl=zh-CN&_x_tr_tl=en&_x_tr_hl=zh-CN&_x_tr_pto=wapp">News</a>
| <a href="#document">Document</a>
| <a href="#download">Download</a>
| <a href="https://gitlab.com/endink/MediaPipe4U-Demo" target="_blank">Demo Project</a>
| <a href="https://github.com/endink/Mediapipe4u-plugin/releases/tag/M4U_Remoting_App">M4U Remoting(Android App)</a>
| <a href="https://github.com/endink/Mediapipe4u-plugin/releases/tag/speech_models">Speech Model Packages</a>
</p>
<p align="center">
<a href="https://opensource.labijie.com/Mediapipe4u-plugin/licensing/pay_license.html">Free Edtion vs Commercial Edition</a>
</p>
</p>

# Introduction

**MediaPipe4U** provides a suite of libraries and tools that allow you to quickly apply artificial intelligence (AI) and machine learning (ML) techniques to your Unreal Engine projects. You can integrate these solutions into your UE project immediately and customize them to meet your needs. The suite includes motion capture, facial expression capture for your 3D avatar, text-to-speech (TTS), speech recognition (ASR), and more. All features are real-time, offline, low-latency, and easy to use.

# What's news

### Coming Soon (Expected Release Within March) ...  

- [new] :rainbow: The free version can now package all features, including voice and facial expression capture.  
- [new] :rainbow: **Ollama Support**: Integrated with [Ollama](https://ollama.com/) for large language model (LLM) inference, enabling support for various LLMs such as DeepSeek, LLaMA, Phi, Qwen, QWQ, and more.  
- [new] :rainbow: **Conversation Component `LLMSpeechChatRuntime`**: Integrates LLM, TTS, and ASR, making it easy to implement chatbot functionality in Blueprints.  
- [new] :rainbow: **New TTS Support**: Added support for [Kokoro](https://github.com/hexgrad/kokoro) and [Melo](https://github.com/myshell-ai/MeloTTS).  
- [new] :rainbow: **New ASR Support**: Added support for [FunASR](https://github.com/modelscope/FunASR)(zh/en with hotword), [FireRedASR](https://github.com/FireRedTeam/FireRedASR) (zh/en), [MoonShine (en)](https://github.com/usefulsensors/moonshine), [SenseVoice](https://github.com/usefulsensors/moonshine) (multilingual: zh/en/ja/ko/yue).  
- [new] :rainbow: **Transformer-based TTS Model**: Added support for [F5-TTS](https://github.com/SWivid/F5-TTS), voice clone (zero-shot voice generation) ability (runs on DirectML, compatible with AMD/Nvidia GPUs).  
- [new] :rainbow: **Voice Wake-up**: Introduced lightweight voice wake-up inference, supporting custom wake words for ASR activation, as well as independent voice command wake words.  
- [new] :fire: Updated Google MediaPipe to the latest version.  
- [new] :fire: Added support for **Unreal Engine 5.5**.  
- [new] Added **C++ Interface**, allowing C++ developers to implement their own pose estimation algorithms to replace Google MediaPipe.  
- [new] :rainbow: Integrated **NvAR Pose Tracking**, enabling switching between MediaPipe and Nvidia Maxine algorithms.  

> The update includes numerous features and complex testing, please be patient.   

# Known Issues:    
- The new Google Holistic Task API does not support GPU inference. As a result, the Android platform relies on CPU inference, while Windows continues to use CPU inference as usual.  
- Starting from Unreal Engine **5.4**, the built-in `OpenCV` plugin no longer includes precompiled libraries (DLL files). Upon the first launch of the UE Editor, since M4U depends on the `OpenCV` plugin, the editor will attempt to download the `OpenCV` source code online and compile it on your machine. This process may take a significant amount of time, potentially giving the impression that the engine is stuck at 75% during loading. Please be patient and check the logs in the *Saved* directory under the root folder to verify whether the process has completed. For users in China, you may need a VPN connection. Alternatively, you can follow the steps outlined in [#166](https://github.com/endink/Mediapipe4u-plugin/discussions/166) to manually resolve this issue.  



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
  - ControlRig supported
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
| UE 5.0 | [奶牛快传](https://cowtransfer.com/s/206ee1ac88964c) | [One Drive](https://1drv.ms/u/s!AkmROUeQfSBjz3pSY7YV9R7Rg87d?e=e3whKG) | 2023-10-10 |
| UE 5.1 | [百度网盘](https://pan.baidu.com/s/11C9pmKjRiwwh5e_mw82aTg?pwd=n9he) | [One Drive](https://1drv.ms/u/c/63207d9047399149/ERHtOO41t9JMo_rMTYHUl5IBD6yrdmn9rqzi6b1ozQWxnw?e=A1XhVA) | 2023-05-24 |
| UE 5.2 | [百度网盘](https://pan.baidu.com/s/1mEilhcaMCclXg6V6GhttHg?pwd=7q4p) | [One Drive](https://1drv.ms/u/c/63207d9047399149/EWeByq7iTjdDl02JZbIEHBkBd0zmMjcGMKHl3STOmGrMaA?e=pvrHJi) | 2023-05-24 |
| UE 5.4 | [百度网盘](https://pan.baidu.com/s/1uX96rTNTRTJczUx6KyRFoA?pwd=2nsr) | [One Drive](https://1drv.ms/u/c/63207d9047399149/Eb_LzTgVvONNo3YkMMniREUBx21gJ2RDV2ozPizqLaRnUA?e=ueS8Wr) | 2023-05-24 |
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
- [https://gitlab.com/endink/mediapipe4u-demo](https://gitlab.com/endink/mediapipe4u-demo)

Use the git client to get the demo project (require [git](https://git-scm.com/downloads) and [git lfs](https://git-lfs.com/)) :
```shell
git lfs clone https://gitlab.com/endink/mediapipe4u-demo.git
```

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


# Acknowledgements  

We acknowledge the contributions of the following open-source projects and frameworks, which have significantly influenced the development of M4U:  

1. M4U utilizes [MediaPipe](https://github.com/google/mediapipe) for motion and facial capture.  
2. M4U utilizes the [NVIDIA Maxine AR SDK](https://github.com/NVIDIA/MAXINE-AR-SDK) for advanced facial tracking and capture.  
3. M4U utilizes [PaddleSpeech](https://github.com/PaddlePaddle/PaddleSpeech) for text-to-speech (TTS) synthesis.  
4. M4U utilizes [FunASR](https://github.com/alibaba-damo-academy/FunASR) for automatic speech recognition (ASR).  
5. M4U utilizes [whisper.cpp](https://github.com/ggerganov/whisper.cpp) as an ASR solution.  
6. M4U utilizes [Sherpa Onnx](https://github.com/k2-fsa/sherpa-onnx) to enhance ASR capabilities.  
7. M4U utilizes [F5-TTS-ONNX](https://github.com/DakeQQ/F5-TTS-ONNX) for exporting the F5-TTS model.  
8. M4U utilizes [GStreamer](https://gstreamer.freedesktop.org/) to facilitate video processing and real-time streaming.  
9. M4U utilizes code from [PowerIK](https://poweranimated.github.io/) for inverse kinematics (IK) and ground adaptation.  
10. M4U utilizes concepts from [Kalidokit](https://github.com/yeemachine/kalidokit) in the domain of motion capture.  
11. M4U utilizes code from [wongfei](https://github.com/wongfei) to enhance GStreamer and MediaPipe interoperability.  

We extend our gratitude to the developers and contributors of these projects for their valuable innovations and open-source contributions, which have greatly facilitated the development of MediaPipe4U.  
