---
layout: default
nav_order: 1
title: English Release Notes
parent: 更新日志
---

[简体中文](./index.md)

### 2025-04-08   

{: .d-inline-block }
Current
{: .label .label-green } 

- [new] :rainbow: The free version now supports packaging all features, including voice and facial expression capture.
- [new] :rainbow: Ollama support: Integrated with [Ollama](https://ollama.com/) for large language model inference, enabling support for various LLMs such as DeepSeek, LLaMA, Phi, Qwen, QWQ, and more.
- [new] :rainbow: Dialogue component `LLMSpeechChatRuntime`: Integrates LLM, TTS, and ASR, making it easy to build chatbot functionality within Blueprints.
- [new] :rainbow: Added new TTS support: [Kokoro](https://github.com/hexgrad/kokoro), [Melo](https://github.com/myshell-ai/MeloTTS).
- [new] :rainbow: Added new ASR support: [FunASR](https://github.com/modelscope/FunASR) (Chinese-English with hotword support), [FireRedASR](https://github.com/FireRedTeam/FireRedASR) (Chinese-English/Dialects), [MoonShine](https://github.com/usefulsensors/moonshine) (English), [SenseVoice](https://github.com/usefulsensors/moonshine) (Multilingual: Chinese/English/Japanese/Korean/Cantonese).
- [new] :rainbow: Added a Transformer-based TTS model: [F5-TTS](https://github.com/SWivid/F5-TTS), capable of zero-shot voice cloning (supports inference with DirectML/CUDA on both AMD and Nvidia GPUs).
- [new] :rainbow: Voice wake-up: Lightweight model-based voice wake-up, supporting custom wake words to activate ASR and also separate voice command trigger functionality.
- [new] :fire: Upgraded to the latest version of Google MediaPipe.
- [new] :fire: Added support for Unreal Engine 5.5.
- [new]: Added C++ interface allowing C++ developers to implement their own pose inference algorithms to replace Google MediaPipe.
- [new] :rainbow: Integrated NvAR pose tracking, allowing switching between MediaPipe and Nvidia Maxine algorithms.
- [new] :rainbow: Open-sourced [MediaPipe4U Remoting](https://github.com/endink/M4URemoting-Android) (Android facial module for MediaPipe4U).
- [new] :dizzy: Image source boot support (C++), enabling complete replacement and switching between `google mediapipe` algorithms.
- [new] :dizzy: Add a new [Android Demo project](https://gitlab.com/endink/mediapipe4u-android-demo) (Gitlab)
- [improve] :footprints: Demo project upgraded to UE5.5, added `Fake Demo`, a C++ extension example that reads local files instead of using MediaPipe.
- [improve] :footprints: Demo project now includes voice wake-up examples and speaker selection demo.
- [improve] :footprints: Demo project now includes LLM integration example.
- [improve] :footprints: Demo project now includes voice chatbot example.
- [improve] :footprints: Demo project now supports packaging.
- [break change] :collision:⚠️⚠️⚠️ Motion capture features have been moved to a new plugin: `MediaPipe4UMotion`. This may cause your existing blueprint to break. Please update your blueprint after upgrading.
- [break change] :collision:⚠️⚠️⚠️ Due to changes in the license format, old licenses are no longer valid. You can now obtain a free license from [here](https://github.com/endink/Mediapipe4u-plugin/releases/tag/license-auto-release).


### 2024-05-24   
- [new] :rainbow: Licenses is no longer required to use MediaPipe4U (all plugin) in the UE editor (you can still use M4U even though the license file has expireds).
- [new] :rainbow: Unreal Engine version **5.4** support, I skipped UE 5.3, I'm sorry for that.
- [new] :rainbow: **Control Rig** supported (preview). Add a new animation blueprint node `ControlRigFromPose` that used to convert FK poses to Control Rig Blueprints pose.
- [new] :fire: Upgrade to latest goole mediapipe holistic task api, got better performace for holistic tracking.
- [new] :rainbow: Add `StopAsync` to `MediaPipeHolisticComponent` to support asynchronous stop Mediapipe.
- [new] :rainbow: `MediaPipeHolisticComponent` Display "Raw mode" support for Android platform. 
- [fix] :bug: [#130](https://github.com/endink/Mediapipe4u-plugin/issues/130): When packaging a game, the mediapipe model file is missing.
- [fix] :bug: [#124](https://github.com/endink/Mediapipe4u-plugin/issues/124): `BVH Recorder` crash if skeleton bone index was not used for compact space pose.
- [fix] :bug: The `AnchorWidgetInCanvas` function exceeds the size limit when scaling the frame image.
- [improve] :rose: Optimize android performace, now Android platfrom can reach **15**-**20** fps (CPU: Qualcomm Snapdragon 870 ).
- [improve] :rose: The Mediapipe4U solver is now adaptive to LOD changes and motion capture can also be done when the LOD changes.
- [remove] :nauseated_face: LLM plugin has been removed. Because of the high latency of the LLM and the frequent updates of the llama.cpp project for a long time, there is no stable version. So I remove it, and maybe it will come back in the future.
- [remove] :nauseated_face: Since this version, the 5.0.x version of UnrealEngine is no longer supported. Because 5.0.X requires VS 2019 and VS 2019 is no longer installed on my development PC. Sorry for that, but the older versions of the 5.0.x plugin are still available.
- [break change] :pill: `ASRCaptureComponent` change name to `SpeechCaptureComponent`;

### 2023-10-10   
- [new] :rainbow: **MediaPipe4U Mobile** Android packaging support, the development process is fully compatible with Windows.
- [new] :fire: Both `StartCamera` and `StartImageSource` now support truly blueprint-friendly asynchronous functions.
- [improve] Optimize frame pipline, huge performance improve, now Windows CPU can reach **25** fps (CPU: AMD 3600, Frame Size: 1280 * 720).
- [breaking change]:Many functions are now BlueprintPure and may require changes to your blueprint.

### 2023-08-29    
- [fix] Fails if the file path contains characters from a Non-English language.
- [fix] Error may occur after packaging in LLM , ASR.
- [fix] Animation blueprint node error when open blueprint editor: [#104](https://github.com/endink/Mediapipe4u-plugin/issues/104), [#101](https://github.com/endink/Mediapipe4u-plugin/issues/101)

### 2023-08-17      
- [new]:rainbow: Speech ASR supports [whisper](https://github.com/openai/whisper) model (GPU acceleration).   
- [new]:rainbow: The big language model (LLM) supports CUDA inference ([Document](https://opensource.labijie.com/Mediapipe4u-plugin/llm/cuda.html)).  
- [fix] Fixed the issue that the speech model import interface was block ([#96](https://github.com/endink/Mediapipe4u-plugin/issues/96)).
- [fix] The llm inference process may have caused a memory leak.

### 2023-08-11   
- [new]:rainbow:LLMSpeechChatRuntime, which requires very few simple blueprints to build complex chat and FAQ programs.   
- [new] Support warm-up when large language models are loaded, solving the problem of slow response to the first round of dialogue.  
- [new] LipSync supports Remap assets, and curve names don't have to follow Facebook's Viseme name, and can be mapped at runtime.    
- [new] SpeechActor adds new blueprint functions (IsTTSReady/IsTTSReady) to check if the model is loaded.    
- [imporve] SpeechActor::IsTTSSpeaking You can now accurately determine whether tts is still speaking.   
- [fix] Speech may create an invalid empty folder on disk due to encoding issues. 
- [fix] Issues fixed: [#95](https://github.com/endink/Mediapipe4u-plugin/issues/96), [#96](https://github.com/endink/Mediapipe4u-plugin/issues/96)

### 2023-08-07      
- [new]:rainbow: Add the large language model (LLM) feature (MediaPipe4ULLM plugin). Supports offline deployment and inference of LLaMA2 models([Document](https://opensource.labijie.com/Mediapipe4u-plugin/llm/)).   
- [new] :rainbow: Add LLM Speech feature (MediaPipe4ULLMSpeech plugin), integrated MediaPipe4U Speech into LLM, can automatically read the result that generated by LLM.
- [new] :rainbow: Released a new ONNX voice model pack (better sound quality), adding four new voice model packs: Chinese, Chinese male voice, English, English female voice（[Speech Model Release Page](https://github.com/endink/Mediapipe4u-plugin/releases/tag/speech_models)）.
- [new] TTS inference supports Onnx engine and can get a higher quality vocoder.   
- [new] Add StartCameraAsync function, prevent UI block while camera starting.   
- [new] TTS blueprint functions added to MediaPipeSpeechActor (some functions in LocalTTSComponent no longer support access in blueprint).   
- [improve] TTS supports text reading queue, which can read multiple texts one by one (the `SpeakText` function on `MediaPipeSpeechActor` add the **StopPrevious** parameter).     
- [improve] Removes the pdb file to further reduce the package size.   
- [improve] When the NvAR SDK is not installed, packaging will no longer fail, but will give a warning message.   
- [fix] Fixed that if UE Editor's LiveLink UI is opened when start mocap, the program will crash.   
- [fix] Fix program crash when access UI in ASR speech recognited events ([#90](https://github.com/endink/Mediapipe4u-plugin/issues/90)).   
- [fix] Fixed the Pose Asset Baker tool crash on UE 5.2 ([#88](https://github.com/endink/Mediapipe4u-plugin/issues/88)).
- [fix] A small probability that TTS can not be stopped.
- [fix] An encoding issue exists in TTS/ASR parsing folders that cause the wrong folder being created on disk.


### 2023-07-18   
- [new] Supports updating licenses in the plugin settings view （[Documentation](https://opensource.labijie.com/Mediapipe4u-plugin/licensing/update_license.html)）.   
- [new] Supports updating the voice model in plugin settings view （[Documentation](https://opensource.labijie.com/Mediapipe4u-plugin/speech/config.html)）.   
- [new]:rainbow: Added offline speech recognition (ASR) feature (requires downloading the model package) to recognize speech from microphone to text （[Documentation](https://opensource.labijie.com/Mediapipe4u-plugin/speech/quick_start.html)）.   
- [new] Support for updating licenses from blueprints（[Documentation](https://opensource.labijie.com/Mediapipe4u-plugin/licensing/update_license.html)）.   
- [improve]:thumbsup: MediaPipe upgraded to 0.10.2, updated Google models, used the new Mediapipe solution API, and greatly improved face expression capture.   
- [improve] When using Pose Tracker annotation drawing, ROI red wireframes are no longer drawn (details: #81).   
- [improve] GStreamer no longer include PC (C++ package config) files when packaging project, reducing the packaging size.   
- [fix] Temporarily remove FixMediaPipe as it causes leg jumps (details: #81).   