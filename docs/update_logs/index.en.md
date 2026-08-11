---
hide:
  - navigation
---

[Simplified Chinese](./index.md)

### 20260811

- [new] :rainbow: Added Unreal Engine **5.7** and **5.8** support
- [new] :rainbow: Added `VideoPlayerImageSource`, which supports opening video files from the Android gallery for motion and expression capture
- [fix] Bug fixes: [#243](https://github.com/endink/Mediapipe4u-plugin/issues/243), [#262](https://github.com/endink/Mediapipe4u-plugin/issues/252)
- [fix] Fixed a crash when stopping motion capture

### 20250818

- [new] Unreal Engine **5.6** support.
- [fix] When using **NvAR** to capture head rotation, negative angle values are handled incorrectly. [#122](https://github.com/endink/Mediapipe4u-plugin/issues/222)
- [fix] Package failed on Unreal Engine versions **5.3** or lower. [#237](https://github.com/endink/Mediapipe4u-plugin/issues/237)

### 20250506

- [fix] :rainbow: Motion capture did not work on the `Android` platform ([#221](https://github.com/endink/Mediapipe4u-plugin/issues/221), [#190](https://github.com/endink/Mediapipe4u-plugin/issues/221)). 

### 20250501  

- [new] :rainbow: Lip Sync now supports ARKit blendshapes (you can use ARKit curves to drive lip sync animation).
- [fix] :rainbow: Fixed a crash caused by `GStreamer` under specific concurrent conditions.
- [fix] :rainbow: Fixed incorrect parsing of the Paddle TTS model.
- [fix] :rainbow: The synchronous `StartCamera` function in `MediaPipeHolistic` was blocking the game thread, causing freezes.
- [fix] :rainbow: Fixed a turn-based logic error in `LLMChatRuntime`.
- [improve] :rainbow: Added joint constraints to motion capture, resulting in improved accuracy.
- [break change] :collision: `Pose Solver` no longer requires manual adjustment of spine rotation mode. `MediaPipe4U` now determines the rotation mode automatically, and spine rotation-related properties have been removed.


### 20250414

- [fix] :rainbow: Running for a long time could cause motion capture to crash.
- [upgrade] :rainbow: Upgraded `NvAR` to Nvidia Maxine AR 0.8.7.

### 2025-04-08   

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
- [new] :dizzy: `Custom mediapipe connector`(C++): Enabling complete replace  `google mediapipe` with you want.
- [new] :dizzy: Added `Custom mediapipe feature`(C++): Enabling partial replace  `google mediapipe` with you want.
- [new] :rainbow: Add a new [Android Demo project](https://gitlab.com/endink/mediapipe4u-android-demo) (Gitlab)
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

### 2023-06-28   
- [new] :rainbow: MediaPlayerImageSource: Supports capturing frames from Unreal Engine's MediaPlayer as an image source ([Documentation](https://opensource.labijie.com/Mediapipe4u-plugin/mocap/features/image_source.html)).     
- [new] Upper-body locking: Supports locking the upper body on all three axes ([Documentation](https://opensource.labijie.com/Mediapipe4u-plugin/mocap/features/pose_solver.html)).      
- [fix] Fixed a calibration error when the initial joints had rotation angles.   
- [fix] Fixed incorrect joint twist correction caused by the damping algorithm.   
- [fix] Fixed calibration not working correctly in half-body mode.   


### 2023-06-20   
- [new] Pose Solver: Supports enabling or disabling individual pose-optimization items.   
- [improve] Reduced the compiled size (disk usage reduced from 10 GB to 6 GB).    
- [fix] Spine rotation mode could cause incorrect pose calibration.        


### 2023-06-17   
- [new] Added pose calibration to correct the spine and lower legs not being straight in raw mediapipe data ([Documentation](https://opensource.labijie.com/Mediapipe4u-plugin/mocap/advance/calibration.html)).     
- [new] Added manual calibration. Both pose calibration and location calibration now support manual and automatic calibration settings ([Documentation](https://opensource.labijie.com/Mediapipe4u-plugin/mocap/advance/calibration.html)).    
- [new] Added spine rotation mode to help stabilize the feet during movement ([Documentation](https://opensource.labijie.com/Mediapipe4u-plugin/mocap/features/pose_solver.html)).    
- [new] Added rebound handling rules when the palm is lost during finger capture.   
- [new] Added joint locking, calibration, and other features to the UE Editor motion-capture toolkit.   
- [new] The UE Editor motion-capture toolkit now supports fast-forwarding and pausing video files.   
- [improve] Upgraded mediapipe to the latest version ([v0.10.1](https://github.com/google/mediapipe/releases/tag/v0.10.1)).     
- [improve] Hand Solver: Added wrist-rotation damping to prevent abrupt changes.     
- [improve] LocationSolver: Improved the Location IK algorithm for more reasonable displacement calculations.     
- [improve] Ground IK: Smoothed foot and ankle rotation.     
- [improve] Ground IK: Added foot-slip limiting to reduce foot jitter.    
- [fix] GroundIK: Incorrect ankle-position detection.     
- [fix] GroundIK: Several node properties, including FeetVerticalOffset, had no effect.      
- [fix] The PoseAsset generated by the ControlRigPose Baker tool was incorrect.   

### 2023-05-21

- [new] Added the **MediaPipe4USpeech** plugin with offline TTS and lip-sync support ([Documentation](https://opensource.labijie.com/Mediapipe4u-plugin/speech/)).   
- [new] Added the ControlRigPose baking tool to simplify creating lip-sync assets for MetaHuman.   
- [fix] Removed the toolkit material and now creates it dynamically in C++, fixing UE 5.0 material packaging issues.   

### 2023-04-23

- [new] :fire: Added M4U Remoting, supporting facial-expression capture from Android devices ([Documentation](https://opensource.labijie.com/Mediapipe4u-plugin/features/m4u_remoting.html)).      
- [new] The Android facial-capture tool is now available for download (commercial-license feature; it cannot be packaged with a free license).   
- [new] New UE Editor toolkit features:    
  - LiveLink tracking   
  - Location and pose calibration   
  - Face calibration   

- [new] Unified location and pose calibration. Parameters such as CalibrationCountDownSeconds are now accessed from AnimationInstance, and manual location and pose calibration are supported (:red_circle:Breaking Changes).   
- [fix] An error in a motion-capture callback package could leave a texture occupied and prevent its release.   
- [fix] Exiting the editor could occasionally cause a crash.   
- [fix] The UE toolkit state could become unsynchronized.   



### 2023-04-08

- [new] Added the UE Editor toolkit for convenient parameter debugging in the editor ([Documentation](https://opensource.labijie.com/Mediapipe4u-plugin/features/ue_editor_toolkits.html)).

### 2023-04-03

- [fix] The program crashed when LOD changes also changed the skeleton.
- [fix] Fixed a right-eye error when the MediaPipe facial solver calculated BrowDown.
- [fix] The LiveLink manager state in the UE Editor did not match MediaPipeFaceLinkActor.
- [fix] LiveLink Source could not be deleted. 

### 2023-04-01

A new MediaPipe BlendShape solver that does not depend on an Nvidia GPU and supports Apple's 51 ARKit expressions ([Documentation](https://opensource.labijie.com/Mediapipe4u-plugin/features/face_link_actor.html)).

- [new] Unified MediaPipe4U LiveLink into the new MediaPipeFaceLinkActor ([Documentation](https://opensource.labijie.com/Mediapipe4u-plugin/features/location_solver.html)). It supports switching between MediaPipe and NvAR algorithms and automatic algorithm fallback. 
- [new] A new Face Calibration algorithm.
- [new] Dynamic MediaPipe Graph construction, supporting switching the annotation-line display style and switching among Pose, Holistic, and Face.
- [new] Blueprint support for the location-calibration countdown, making calibration UI integration easier (download the latest Demo Project for an example).
- [new] GStreamer now uses the [GStreamer uridecodebin](https://gstreamer.freedesktop.org/documentation/playback/uridecodebin.html) workflow and supports parsing video streams over HTTP, RTSP, RMTP, M3U8, and other network protocols (#37).
- [improve] Added knee pole correction to Pose Solver optimization.
- [improve] GStreamer now displays warning messages, making error causes easier to identify.
- [improve] Updated MediaPipe to 0.9.2 and the TFLite models to the latest versions.
- [improve] MediaPipe/NvAR connector libraries no longer use an embedded CRT.
- [improve] OpenCV in MediaPipe/NvAR now supports HighGUI for convenient graphical debugging.
- [fix] Some video files behaved abnormally when scaled (#43).
- [fix] StaticImageSource could produce a warning that an image was not released.
- [fix] A GStreamer error did not close the Pipeline automatically, causing the next startup to fail.

### 2023-03-16
- [new] Added GroundIK to the location-solving node, allowing feet to conform to the ground ([Documentation](https://opensource.labijie.com/Mediapipe4u-plugin/features/location_solver.html)). 
- [fix] Resources were released repeatedly after switching Animation Blueprints (#30). The issue could not be reproduced and requires testing by the reporter.
- [fix] Incorrect skeleton-node indices in the BVH plugin (#28).

### 2023-03-11
- [fix] The application deadlocked (hung or blocked) after packaging with Unreal Engine 5.1.

### 2023-03-09
- [new] Added NvAR facial-expression capture support for Unreal Engine 5.1.

### 2023-02-27

- [new] Added NvAR statistics ([Documentation](https://opensource.labijie.com/Mediapipe4u-plugin/advance/stats.html)).
- [imporve] Upgraded GStreamer to 1.22.0 (if GStreamer-related compilation errors occur, reinstall the GStreamer Runtime and SDK).
- [fix] :boom::punch::punch::punch: Fixed a major MediaPipe NvAR bug where the NvAR frame rate gradually decreased as the number of starts and stops increased (<mark>If you use MediaPipe4UNvAR, you must update to this version!</mark>).
- [fix] Fixed compilation errors in the 0225 release.

### 2023-02-25

- [new] Added performance statistics. Key performance data can be viewed with Stat ([Documentation](https://opensource.labijie.com/Mediapipe4u-plugin/advance/stats.html)).
- [new] Added support for retrieving image-source FPS to simplify performance troubleshooting. 
- [new] IK drive mode for easier Control Rig integration (<mark>Experimental</mark>).
- [imporve] Removed the protobuf dependency to avoid packaging conflicts in projects that use protobuf.
- [imporve] Prefer RGB camera encoding because some cameras have excessively low frame rates when defaulting to YUV encoding.
- [fix] Forcefully exiting the game in the editor could cause a crash.

### 2023-02-12

- [new] Added manual MediaPipe connection to MediaPipeAnimInstance. When a scene contains multiple characters using MediaPipe Animation Blueprints, you can manually choose which one to drive.
- [new] Added MediaPipe connection support after dynamically switching Animation Blueprints with SetAnimInstanceClass.
- [fix] **MediaPipeAnimInstance** could crash in network-game mode [BUG #20](https://github.com/endink/Mediapipe4u-plugin/issues/20).
- [fix] Camera motion capture did not work correctly in Annotated preview mode.

### 2023-02-10 (milestone)   
> Refactored the underlying code with a consistent image-processing workflow, eliminating one image-memory copy and improving the frame rate.   

:pushpin:**Milestone Release**   

- [new] :fire: Preview-quality **Nvidia AR** facial-expression capture integration ([Documentation](./experiment/README.md); an example is included in the [Demo](https://gitlab.com/endink/mediapipe4u-demo) project).
- [new] Finger correction to solve fingers not straightening (**TODO**: documentation unavailable).
- [new] Blueprint support for **MediaPipeHolistic** lifecycle events (OnInitialized, OnStarted, OnStopeed).
- [new] Image, camera, and video previews can now enable or disable MediaPipe Annotated mode to simplify motion-capture frame analysis.
- [new] Camera capture can now limit image resolution to improve frame rates on low-end machines (**TODO**: documentation unavailable).
- [new] A newly refactored image workflow that can integrate with any third-party image-processing library (integration example: NvAR integration, [Documentation](./extensions/image_consumer.md)).
- [new] Corrected the HeadSolver Roll deviation.
- [new] **MediaPipeLiveLink** can now be disabled. When multiple LiveLink Subjects work simultaneously, disabling unused subjects avoids unnecessary overhead.
- [imporve] A more easily implemented custom image-source base class, **MediaPipeImageSourceComponent** (C++).
- [imporve] **MediaPipeRemapAsset** can now import and export JSON files in the editor, making assets easier to share in multi-developer projects.
- [imporve] Camera motion capture now also previews images asynchronously, improving performance and frame rate.
- [fix] Fixed a serious performance issue that caused **MediaPipeLinkLink** facial capture to stutter (major bug).
- [fix] Resetting the cache could be thread-unsafe ([BUG #18](https://github.com/endink/Mediapipe4u-plugin/issues/18)). 
- [fix] Missing skeleton bindings could cause the program to crash.
- [fix] Rapid repeated starts and stops caused static images to render incorrectly.

### 2023-01-15
- [new] If no mapping is configured for the upper-chest joint, the parent joint of the neck bone is automatically used as the upper chest.
- [new] Added a new filtering algorithm to the head solver to reduce jitter (significant improvement).
- [new] Half-body mode no longer merely locks joints; a new filtering algorithm is applied to the spine bones in half-body mode (significant improvement).
- [new] **StandardMediaPipeAnimInstance** is now officially available. It allows MediaPipe motion capture to be configured dynamically for a character through C++ code (attaching an Animation Blueprint at runtime without binding bones and creating an Animation Blueprint in the editor, suitable for dynamically loaded models).
- [fix] Custom skeleton did not work ([issue #13](https://github.com/endink/Mediapipe4u-plugin/issues/13); could not be verified because local tests passed).
- [fix] In editor mode, a multicast delegate occasionally failed and caused motion capture to stop.
- [fix] The current image-source (ImageSource) property was empty in image motion-capture mode.
- [fix] Head-twist correction could fail in half-body motion-capture mode.

- [improve] Improved the underlying mediapipe code. Starting and stopping the pipeline is now thread-safe, and callback events execute only on the game thread, simplifying UI updates.
- [improve] Improved knee pole accuracy and reduced knee twisting (the knee pole switch will be removed soon).


### 2023-01-06
- [fix] Fixed an incorrect skeleton-hierarchy refresh ([issue #10](https://github.com/endink/Mediapipe4u-plugin/issues/10); thanks to **[Muscaric](https://github.com/Muscaric)** for the report).

### 2023-01-04
- [fix] Fixed incorrect twist correction for models with initial rotation angles.
- [new] Added a twist-correction switch to control whether twist correction is enabled.
- [new] Added facial-expression capture calibration.
- [new] Reworked facial-expression capture:
- [new] Added expression noise-reduction and smoothing parameters.
- [new] Added a knee pole switch (corrects sideways knee bending).
- [new] Expression smoothing now supports separate smoothing values for the face and eyes.
- [new] Added iris tracking to facial-expression capture.

### 2022-12-20
- [new] BVH export.
- [new] Head solver (calculates head rotation from the face mesh).
- [new] Joint-twist correction.
- [new] Secondary joint-smoothing support (C++).
- [new] Upper-chest joint mapping.
- [fix] Incorrect displacement calculation when the body was turned sideways.
- [fix] Spine locking did not take effect.

### 2022-11-25

- [fix] Fixed an out-of-range skeleton-mapping index in the Pose solver. Thanks to **[tiantianaixuexi](https://github.com/tiantianaixuexi)** for the report (#3).
- [improve] Skeleton caching now occurs on the first data frame, preventing repeated caching.

### 2022-11-22

- [new] Integrated Unreal Engine OpenCV and upgraded it to 4.5.5.
- [fix] Fixed a skeleton-caching bug in the Pose solver.
- [new] Added compatibility with the Unreal Engine 5.1 API (currently still compiled with 5.0).

### 2022-11-18

- [fix] Fixed a serious bug where custom skeleton mapping did not work. Thanks to **[Gobcurry](https://github.com/Gobcurry)** for taking the time to identify the problem (issue #2).
- [new] Added a skeleton-mapping asset (Remap Asset). Animation Blueprint skeleton mapping now uses mapping assets.
- [new] Added wrist-twist correction, which uses follow rotation from the elbow to correct wrist twisting in a simple way.
- [remove] Removed the BoneSettings variable from the Animation Blueprint. Bones are no longer configured through BoneSettings; use the new mapping asset instead.

### 2022-11-12

- [fix] Fixed a crash caused by repeatedly releasing image-motion-capture memory.
- [fix] Fixed the UE Editor crashing at startup when GStreamer was not configured by delaying startup.
- [fix] Fixed spine locking not working in upper-body mode.
