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
<a href=""><img src="https://img.shields.io/badge/Unreal Engine-5.1 to 5.5-purple.svg"></a>
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
| <a href="https://github.com/endink/M4URemoting-Android">M4U Remoting Android App (Open Source)</a>
| <a href="https://huggingface.co/endink/M4U-Speech-Models/tree/main">Speech Model Packages</a>
</p>
<p align="center">
<a href="https://opensource.labijie.com/Mediapipe4u-plugin/licensing/pay_license.html">Free Edtion vs Commercial Edition</a>
</p>

<br>
<p align="left">
Demo Projects: <a href="https://gitlab.com/endink/MediaPipe4U-Demo">Full Demo (Windows)</a> | <a href="https://gitlab.com/endink/mediapipe4u-android-demo">Android Demo</a>
</p>

</p>

# Introduction

**MediaPipe4U** provides a suite of libraries and tools that allow you to quickly apply artificial intelligence (AI) and machine learning (ML) techniques to your Unreal Engine projects. You can integrate these solutions into your UE project immediately and customize them to meet your needs. The suite includes motion capture, facial expression capture for your 3D avatar, text-to-speech (TTS), speech recognition (ASR), and more. All features are real-time, offline, low-latency, and easy to use.

# What's news

### 20250414   

- [fix] :rainbow: Running for a long time may cause motion capture to crash.
- [upgrade] :rainbow: `NvAR` Plugin Upgrade to Nvidia Maxine AR 0.8.7.

### 20250408

- [new] :rainbow: The free version now supports packaging all features, including voice and facial expression capture.
- [new] :rainbow: Ollama support: Integrated with [Ollama](https://ollama.com/) for large language model inference, enabling support for various LLMs such as DeepSeek, LLaMA, Phi, Qwen, QWQ, and more.
- [new] :rainbow: Dialogue component `LLMSpeechChatRuntime`: Integrates LLM, TTS, and ASR, making it easy to build chatbot functionality within Blueprints.
- [new] :rainbow: Added new TTS support: [Kokoro](https://github.com/hexgrad/kokoro), [Melo](https://github.com/myshell-ai/MeloTTS).
- [new] :rainbow: Added new ASR support: [FunASR](https://github.com/modelscope/FunASR) (Chinese-English with hotword support), [FireRedASR](https://github.com/FireRedTeam/FireRedASR) (Chinese-English/Dialects), [MoonShine](https://github.com/usefulsensors/moonshine) (English), [SenseVoice](https://github.com/usefulsensors/moonshine) (Multilingual: Chinese/English/Japanese/Korean/Cantonese).
- [new] :rainbow: Added a Transformer-based TTS model: [F5-TTS](https://github.com/SWivid/F5-TTS), capable of zero-shot voice cloning (supports inference with DirectML/CUDA on both AMD and Nvidia GPUs).
- [new] :rainbow: Voice wake-up: Lightweight model-based voice wake-up, supporting custom wake words to activate ASR and also separate voice command trigger functionality.
- [new] :fire: Upgraded to the latest version of Google MediaPipe.
- [new] :fire: Added support for Unreal Engine 5.5.
- [new] :rainbow: Integrated NvAR pose tracking, allowing switching between MediaPipe and Nvidia Maxine algorithms.
- [new] :rainbow: Open-sourced [MediaPipe4U Remoting](https://github.com/endink/M4URemoting-Android) (Android facial module for MediaPipe4U).
- [new] :dizzy: `Custom mediapipe connector`(C++): Enabling complete replace  `google mediapipe` with you want (#195, #204).
- [new] :dizzy: Added `Custom mediapipe feature`(C++): Enabling partial replace  `google mediapipe` with you want (#195, #204).
- [new] :rainbow: Add a new [Android Demo project](https://gitlab.com/endink/mediapipe4u-android-demo) (Gitlab)
- [improve] :footprints: Demo project upgraded to UE5.5, added `Fake Demo`, a C++ extension example that reads local files instead of using MediaPipe.
- [improve] :footprints: Demo project now includes voice wake-up examples and speaker selection demo.
- [improve] :footprints: Demo project now includes LLM integration example.
- [improve] :footprints: Demo project now includes voice chatbot example.
- [improve] :footprints: Demo project now supports packaging.
- [break change] :collision:⚠️⚠️⚠️ Motion capture features have been moved to a new plugin: `MediaPipe4UMotion`. This may cause your existing blueprint to break. Please update your blueprint after upgrading.
- [break change] :collision:⚠️⚠️⚠️ Due to changes in the license format, old licenses are no longer valid. You can now obtain a free license from [here](https://github.com/endink/Mediapipe4u-plugin/releases/tag/license-auto-release).

Speech Model download move to [huggingface](https://huggingface.co/endink/M4U-Speech-Models/tree/main).   

> Currently, only the Unreal Engine 5.5 version is available; Other versions will be packaged and released later, sorry for that.


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
| UE 5.3 | [百度网盘](https://pan.baidu.com/s/1Tn6MIZg4Y1Fe-phcAQJnsw?pwd=wxsj) | [One Drive](https://1drv.ms/u/c/63207d9047399149/EfiygZsL1itJkjs1PiJrCSgByTHg7gGisVqqSlWK2Uz5og?e=Kjq23o) | 2025-04-14 |
| UE 5.4 | [百度网盘](https://pan.baidu.com/s/1q4xQM1jaHJJT7-XinxvVwQ?pwd=4bsb) | [One Drive](https://1drv.ms/u/c/63207d9047399149/EREEPEx8A61FtXAJrTGyeA0B8QKXFRDJf7sP_lV76keyAg?e=JOpwXW) | 2025-04-14 |
| UE 5.5 | [百度网盘](https://pan.baidu.com/s/1hX0dww8AvYUjel9IScSN7g?pwd=fww2) | [One Drive](https://1drv.ms/u/c/63207d9047399149/EUWxGe7MpLZOpQ53Fe1y1FgBwDmHBL9862To18Qw7Mzd8g?e=zfldQi) | 2025-04-14 |

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
| MediaPipe4UBVH          | :heavy_check_mark: | :heavy_check_mark: |Coming Soon|
| MediaPipe4USpeech       | :heavy_check_mark: | :x: |Coming Soon|


# Free License File Release

The license file will be published in the [discussion](https://github.com/endink/Mediapipe4u-plugin/discussions/82), and the plugin package file will automatically include an license file.   

# M4U Remoting App （Android）

[Got Source Code](https://github.com/endink/M4URemoting-Android)

> **About M4U Remoting**   
>    
> This is an open-source Android application that can send facial expression data to the MediaPipe4U program on Windows.     
> With it, you can perform facial expression capture using an Android mobile device and visualize it on an avatar in Unreal Engine.
  
# Demo Project

Please clone this repository to get demo project:    
- `Windows Demo`: [https://gitlab.com/endink/mediapipe4u-demo](https://gitlab.com/endink/mediapipe4u-demo)
- `Android Demo`: [https://gitlab.com/endink/mediapipe4u-android-demo](https://gitlab.com/endink/mediapipe4u-android-demo)


Use the git client to get the demo project (require [git](https://git-scm.com/downloads) and [git lfs](https://git-lfs.com/)) :

> The Windows Demo is a full-featured demo, and it is recommended to use the Windows Demo if you are learning how to use the `MediaPipe4U`.

Windows Demo:
```shell
git lfs clone https://gitlab.com/endink/mediapipe4u-demo.git
```

Android Demo:
```shell
git lfs clone https://gitlab.com/endink/mediapipe4u-android-demo.git
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
