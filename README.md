[中文](./README_CN.md)
<br>
<br>
<p align="center" style="font-size:64px">
<img alt="MediaPipe4U" src="./logo.png">
<p>
<p align="center">
An Unreal Engine plugin that helps you integrate artificial intelligence and machine learning technologies.
<br>
<br>
<img alt="Windows" src="./readme_images/windows_logo.svg">
<img alt="Android" src="./readme_images/android_logo.svg">
<img alt="Linux" src="./readme_images/linux_logo.svg">
<br>
<br>
<a href=""><img src="https://img.shields.io/badge/Platform-Windows, Android-red.svg"></a>
<a href=""><img src="https://img.shields.io/badge/Unreal Engine-5.1 to 5.8-purple.svg"></a>
<p align="center">
  <a href=""><img src="https://img.shields.io/badge/Windows-Win 10/11 X64-brightgreen.svg"></a>
  <a href=""><img src="https://img.shields.io/badge/Android->=8.0 (Arm64)-brightgreen.svg"></a>
  <a href=""><img src="https://img.shields.io/badge/MSVC->=14.38.33130-aff.svg"></a>
  <a href=""><img src="https://img.shields.io/badge/Windows SDK->=10.0.22621-orange.svg"></a>
  <a href=""><img src="https://img.shields.io/badge/Visual Sutdio->=2022.17.6.3-blue"></a>
</p>
<p align="center">
<a href="https://opensource.labijie.com/Mediapipe4u-plugin/update_logs/">Latest News</a>
| <a href="https://opensource.labijie.com/Mediapipe4u-plugin">Documentation</a>
| <a href="#Download">Download</a>
| <a href="https://github.com/endink/Mediapipe4u-plugin/releases/tag/M4U_Remoting_App">M4U Remoting(Android App)</a>
| <a href="https://huggingface.co/endink/M4U-Speech-Models/tree/main">Speech Model Packages</a>
</p>
<p align="center">
<a href="https://opensource.labijie.com/Mediapipe4u-plugin/licensing/paid_license/">Free vs. Paid Edition</a>
</p>
<br>
<p align="left">
Demo Projects: <a href="https://gitlab.com/endink/MediaPipe4U-Demo">Full Demo (Windows)</a> | <a href="https://gitlab.com/endink/mediapipe4u-android-demo">Android Demo</a>
</p>
</p>

# Introduction

**MediaPipe4U** provides a suite of components and tools that let you quickly apply artificial intelligence (AI) and machine learning (ML) technologies in Unreal Engine projects. You can immediately integrate these solutions into your UE projects and customize them to your needs. They include motion capture, facial expression capture, text-to-speech (TTS), automatic speech recognition (ASR), and more. All features are real-time, offline, low-latency, and easy to use.

# Latest News

### 20260811

- [new] :rainbow: Added Unreal Engine **5.7** and **5.8** support
- [new] :rainbow: Added `VideoPlayerImageSource`, which supports opening video files from the Android gallery for motion and expression capture
- [fix] Bug fixes: [#243](https://github.com/endink/Mediapipe4u-plugin/issues/243), [#262](https://github.com/endink/Mediapipe4u-plugin/issues/252)
- [fix] Fixed a crash when stopping motion capture

### 20250818   
- [new] Added Unreal Engine **5.6** support.
- [fix] Incorrect negative-angle handling when using **NvAR** to capture head rotation. [#122](https://github.com/endink/Mediapipe4u-plugin/issues/222)
- [fix] Packaging with UE **5.3** or earlier may fail. [#237](https://github.com/endink/Mediapipe4u-plugin/issues/237)

### 20250506

- [fix] :rainbow: Motion capture did not work on the `Android` platform ([#221](https://github.com/endink/Mediapipe4u-plugin/issues/221), [#190](https://github.com/endink/Mediapipe4u-plugin/issues/221)). 

### 20250408

- [new] :rainbow: The free edition can now package all features, including speech and expression capture.
- [new] :rainbow: Ollama support: integrate [Ollama](https://ollama.com/) for large language model inference, supporting many LLMs such as DeepSeek, LLaMA, Phi, Qwen, and QWQ.
- [new] :rainbow: Dialogue component `LLMSpeechChatRuntime`: integrates LLM, TTS, and ASR, making it easy to implement chatbots in Blueprints.
- [new] :rainbow: Added new TTS support: [Kokoro](https://github.com/hexgrad/kokoro), [Melo](https://github.com/myshell-ai/MeloTTS). 
- [new] :rainbow: Added new ASR support: [FunASR](https://github.com/modelscope/FunASR) (Chinese/English hotword edition), [FireRedASR](https://github.com/FireRedTeam/FireRedASR) (Chinese/English/dialects), [MoonShine](https://github.com/usefulsensors/moonshine) (English), [SenseVoice](https://github.com/usefulsensors/moonshine) (multilingual: Chinese/English/Japanese/Korean/Cantonese).
- [new] :rainbow: Added a Transformer-based TTS model: [F5-TTS](https://github.com/SWivid/F5-TTS), with zero-shot voice cloning capabilities (DirectML/CUDA inference; AMD and Nvidia GPUs supported)
- [new] :rainbow: Voice wake-up: small-model inference-based voice wake-up, supporting custom wake words to activate ASR and standalone voice-command wake words.
- [new] :fire: Updated Google MediaPipe to the latest version.
- [new] :fire: Added Unreal Engine 5.5 support.
- [new] :rainbow: Added the NvAR pose capture algorithm, allowing switching between MediaPipe and Nvidia Maxine algorithms.
- [new] :rainbow: Open-sourced [MediaPipe4U Remoting](https://github.com/endink/M4URemoting-Android) (an Android facial-capture app for MediaPipe4U). 
- [new] :dizzy: `Custom Mediapipe Connector` (C++): a custom connector that can completely replace `google mediapipe` to implement custom logic (#195, #204).
- [new] :dizzy: `Custom Mediapipe Feature` (C++): a custom feature that can partially replace `google mediapipe` to implement custom logic (#195, #204).
- [new] :rainbow: Added the [Android Demo project](https://gitlab.com/endink/mediapipe4u-android-demo) (Gitlab)
- [improve]:footprints: Upgraded the Demo project to UE5.5 and added `Fake Demo`, a C++ extension example that reads local files instead of MediaPipe.
- [improve]:footprints: Added voice wake-up and speaker-selection examples to the Demo project
- [improve]:footprints: Added LLM examples to the Demo project
- [improve]:footprints: Added voice chatbot examples to the Demo project
- [improve]:footprints: The Demo project now supports packaging
- [break change] :collision: Motion capture has been split into a standalone `MediaPipe4UMotion` plugin. This may break existing Blueprints; update your Blueprints after upgrading.
- [break change] :collision: Due to changes in the license-file format, existing licenses will no longer work. You can obtain free licenses [here](https://github.com/endink/Mediapipe4u-plugin/releases/tag/license-auto-release) going forward.

Speech package downloads have moved to [huggingface](https://huggingface.co/endink/M4U-Speech-Models/tree/main).   

> Only the Unreal Engine 5.5 version is currently available; other versions will be packaged and released subsequently ...


# Known Issues    
- The new Google Holistic Task API does not support GPU, so Android uses CPU inference; as before, Windows also uses CPU inference.
- Starting with Unreal Engine **5.4**, the built-in `OpenCV` plugin no longer includes precompiled libraries (DLL files). On the first launch of the UE Editor, because M4U depends on the `OpenCV` plugin, the UE Editor will attempt to download the `OpenCV` source code and compile it on your computer. This may take a long time and make it appear that the engine is stuck at 75% loading. Please wait patiently and check the logs in the Saved directory under the project root to confirm that the process has completed. Users in China may also need a proxy to access the Internet. You can also follow the steps in [#166](https://github.com/endink/Mediapipe4u-plugin/discussions/166) to solve this manually.


## Release Notes
For more updates, see the update log:
- [Update Log](https://opensource.labijie.com/Mediapipe4u-plugin/update_logs/)  

:green_heart:All features are pure C++, with no Python or external programs required.

# Features

- Motion Capture
  - Body motion capture
  - Finger motion capture
  - Translation capture
  - 3D model driving
  - Real-time driving
  - Supports standard cameras
  - ControlRig support
- Expression Capture
  - Facial expressions
  - Arkit Blendshape compatible (52 expressions) 
  - Live Link compatible
  - Real-time driving
  - Supports standard cameras
- Multiple Capture Sources
  - Standard cameras
  - Video files
  - Images
  - Streaming media (RTMP/SMTP)
  - Android devices (phones and tablets) (M4U Remoting)
- Large Language Models (LLM)
  - [Ollama](https://ollama.com/) support
- Text-to-Speech (TTS)
  - Offline synthesis
  - Real-time synthesis
  - 3D model lip-sync
  - Multi-model support ([Browse models](https://huggingface.co/endink/M4U-Speech-Models/tree/main))
- Automatic Speech Recognition (ASR)
  - Offline recognition
  - Real-time recognition
  - Multi-model support ([Browse models](https://huggingface.co/endink/M4U-Speech-Models/tree/main))
  - Voice wake-up (similar to `Xiao Ai Tong Xue` and `Xiao Du Xiao Du`)
- Animation Export
  - BVH data export 
- Plugin Only
  - No external programs required
  - Everything is done in Unreal Engine

# Documentation

- [Simplified Chinese](https://opensource.labijie.com/Mediapipe4u-plugin/)   

- [English](https://opensource.labijie.com/Mediapipe4u-plugin/en/)

- [日本語 (申し訳ありませんが、それは単なるGoogle翻訳です)](https://opensource-labijie-com.translate.goog/Mediapipe4u-plugin/?_x_tr_sl=zh-CN&_x_tr_tl=ja&_x_tr_hl=zh-CN&_x_tr_pto=wapp)

- [한국어 (죄송합니다, 이것은 단지 구글 번역입니다)](https://opensource-labijie-com.translate.goog/Mediapipe4u-plugin/?_x_tr_sl=zh-CN&_x_tr_tl=ko&_x_tr_hl=zh-CN&_x_tr_pto=wapp)

# Download

UnrealEngine **5.1** - **5.8** 

- [Google Drive](https://drive.google.com/drive/folders/1d0_I-TeJUMLeDD4RKWeqA9ewKDzwIXYB?usp=sharing)
- [Baidu Netdisk](https://pan.baidu.com/s/1u_JRN5qNufBsCe2qRN-Auw?pwd=m487)

To learn what was included in each release, visit the [**Update Log**](https://opensource.labijie.com/Mediapipe4u-plugin/update_logs/) page  
   
> Because the plugin uses precompiled binaries and includes a large number of C++ linker symbols and debug symbols, it occupies **5G** of disk space after extraction (mostly UE-generated code in Intermediate)   
> You do not need to worry about disk usage. This is only disk usage during development; after packaging the project, the plugin uses approximately **200M** of disk space (mainly GStreamer dynamic libraries)


# Cross-platform  

M4U now supports Android and Windows (Linux support is coming soon), but platform support differs slightly.

| Plugin (Module) | Windows | Android | Linux |
|---| --- | --- | ---- |
| MediaPipe4U             | :heavy_check_mark: | :heavy_check_mark: |Coming Soon|
| MediaPipe4ULiveLink     | :heavy_check_mark: | :heavy_check_mark: |Coming Soon|
| GStreamer               | :heavy_check_mark: | :x: |Coming Soon|
| MediaPipe4UGStreamer    | :heavy_check_mark: | :x: |Coming Soon|
| MediaPipe4UBVH          | :heavy_check_mark: | :heavy_check_mark: |Coming Soon|
| MediaPipe4USpeech       | :heavy_check_mark: | :x: |Coming Soon|

## Free License Files

License files are periodically published in the [Discussions](https://github.com/endink/Mediapipe4u-plugin/discussions/82), and are also automatically included in new plugin packages.   

# M4U Remoting App (Android)

[Get the source code](https://github.com/endink/M4URemoting-Android)

> **About M4U Remoting**   
>    
> This is an open-source Android application that can send expression data to the MediaPipe4U Windows application.       
> With it, you can use an Android mobile device for expression capture and display expressions on Unreal Engine characters.

# Demo Projects

Clone or download the source code for the Demo projects from the following GitHub repositories:   

- `Windows Demo`: [https://gitlab.com/endink/mediapipe4u-demo](https://gitlab.com/endink/mediapipe4u-demo)
- `Android Demo`: [https://gitlab.com/endink/mediapipe4u-android-demo](https://gitlab.com/endink/mediapipe4u-android-demo)

Use a Git client to obtain the Demo projects (you must install [git](https://git-scm.com/downloads) and [git lfs](https://git-lfs.com/)) :

> Windows Demo is a full-featured demo. If you are learning how to use `MediaPipe4U`, the Windows Demo is recommended.   

Windows Demo:
```shell
git lfs clone https://gitlab.com/endink/mediapipe4u-demo.git
```

Android Demo:
```shell
git lfs clone https://gitlab.com/endink/mediapipe4u-android-demo.git
```

> The Demo projects do not include the plugin. Download the plugin yourself and place it in the project's Plugins directory.


<!-- [![MediaPipe4U](./cover.gif "MediaPipe4U")](./cover.gif) -->

# Plugin Videos

**English Video Tutorial (YouTube)**

[![MediaPipeU Metahuman Tutorials](https://res.cloudinary.com/marcomontalbano/image/upload/v1680609544/video_to_markdown/images/youtube--XLmKnG6UMzo-c05b58ac6eb4c4700831b2b3070cd403.jpg)](https://www.youtube.com/watch?v=XLmKnG6UMzo "MediaPipeU Metahuman Tutorials")

**Chinese Video Tutorial (bilibili)**

[bilibili](https://www.bilibili.com/video/BV1124y157hz/)
 

## FAQ

If you encounter a problem, first check the [FAQ](./faq), which collects issues encountered by many users and may include yours. If you cannot find it in the FAQ, submit an issue on GitHub first; direct messages may cause me to forget the problem.

## Performance

Because the Windows version of MediaPipe does not support GPU inference, Windows relies on the CPU for human-pose prediction (see MediaPipe for details):

**Test Environment**

CPU: AMD 3600 CPU   
Memory: 32GB   
GPU: 1660s (this GPU does not support ray tracing)   


**Performance:** 

Frame rate (fps): 18-24  

CPU utilization: 20% (the test DEMO contains only the MetahumanLight scene and VRM model)  



# Follow Me

[Bilibili](https://space.bilibili.com/481665211)   

[YouTube](https://www.youtube.com/channel/UCiOTp6S7N3GX46_nLQ17CrA)   


Users in China who cannot view the video can visit the [Bilibili video](https://www.bilibili.com/video/BV1JD4y1r7ow)   

# Acknowledgements  

We thank the following open-source projects and frameworks for their contributions, which have had an important impact on the development of M4U:  

1. M4U uses [MediaPipe](https://github.com/google/mediapipe) for motion capture and face capture.  
2. M4U uses [NVIDIA Maxine AR SDK](https://github.com/NVIDIA/MAXINE-AR-SDK) for advanced face tracking and capture.  
3. M4U uses [PaddleSpeech](https://github.com/PaddlePaddle/PaddleSpeech) for text-to-speech (TTS) synthesis.  
4. M4U uses [FunASR](https://github.com/alibaba-damo-academy/FunASR) for automatic speech recognition (ASR).  
5. M4U uses [whisper.cpp](https://github.com/ggerganov/whisper.cpp) as an ASR solution.  
6. M4U uses [Sherpa Onnx](https://github.com/k2-fsa/sherpa-onnx) to enhance ASR capabilities.  
7. M4U uses [F5-TTS-ONNX](https://github.com/DakeQQ/F5-TTS-ONNX) to export F5-TTS models.  
8. M4U uses [GStreamer](https://gstreamer.freedesktop.org/) for video processing and real-time streaming-media decoding.  
9. M4U uses code from [PowerIK](https://poweranimated.github.io/) to implement inverse kinematics (IK) and ground adaptation.  
10. M4U uses concepts from [Kalidokit](https://github.com/yeemachine/kalidokit) in the motion-capture domain.  
11. M4U uses code from [wongfei](https://github.com/wongfei) to enhance interoperability between GStreamer and MediaPipe.  

We extend our sincere thanks to the developers and contributors of these projects. Their innovation and open-source contributions have greatly advanced M4U.  
