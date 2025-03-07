---
title: 环境要求
---

# 环境要求   

*请仔细阅读以下章节，确认你的环境是否满足 **MediaPipe4U** 要求。*

MediaPipe4U 支持下列的平台：   
- Windows x64 
- Android arm64-v8a   

{: .note}
> **MediaPipe4U** 不支持 32 位 Windows 平台。   
> **MediaPipe4U** 不支持非 `arm64-v8a` 的 Android（由于 Launcher 版 Unreal Engine 限制）。

|硬件|版本|
|--------|--------------|
| 磁盘空间 | 开发：10G, 部署：300M (含语音插件)|   


> 插件由于采用预编译，包含大量 C++ 链接符号和调试符号，解压后会占用 **10** 磁盘空间（大部分为 Intermediate 中的 UE 生成代码）
> 
> 你不需要担心磁盘占用问题，这只是开发期间的磁盘占用，在项目打包后，插件磁盘占用大约是 **300M**（主要为 GStreamer 动态库和语音模型文件）



## 跨平台支持

MediaPipe4U 目前支持 Windows x64 和 Android arm-64 平台，但是功能支持上有差异，Windows 平台支持全功能，Android 仅支持动作和表情捕捉。

| 插件 (模块) | Windows | Android | Linux |
|---| --- | --- | ---- |
| MediaPipe4U             | :heavy_check_mark: | :heavy_check_mark: |Coming Soon|
| MediaPipe4ULiveLink     | :heavy_check_mark: | :heavy_check_mark: |Coming Soon|
| GStreamer               | :heavy_check_mark: | :x: |Coming Soon|
| MediaPipe4UGStreamer    | :heavy_check_mark: | :x: |Coming Soon|
| MediaPipe4UBVH          | :heavy_check_mark: | :x: |Coming Soon|
| MediaPipe4USpeech       | :heavy_check_mark: | :x: |Coming Soon|
| MediaPipe4ULLM          | :heavy_check_mark: | :x: |Coming Soon|


## For Windows 

|软件|版本|
|--------|--------------|
|操作系统|Windows10/11 x64|
|Unreal Engine |5.1.x, 5.2.x, 5.4.x|
|Visual Studio 2022 | 17.9.6 or later|
|Windows SDK| 10.0.22621 or later|
|MSVC |14.38.33130 or later|

{: .note}
> 通常 Visual Studio 2022 17.9.6 或更新的版本中包含了必要的 MSVC 工具链      
>    
> 以 VS 2022 为例，可以在以下位置查看你的 MSVC 版本：   
> `C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Tools\MSVC`   
>    
> 仅支持 64 位 Windows，不支持 32 位 Windows。

**注意**：MSVC 14.39.X 和 UnrealEngine 5.4.1 可能存在冲突，建议使用 14.38.X 版本的 MSVC.

---

## For Android 

|Unreal Engine| NDK Version | Android SDK Version |
|--------|--------------|----------------------|
| 5.0 | r21e (21.4.7075529)  | 26 or later |
| 5.1 | r25b (25.1.8937393)  | 26 or later |
| 5.2 | r25b (25.1.8937393)  | 26 or later |
| 5.4 | r25b (25.1.8937393)  | 26 or later |

{: .note}
> 仅支持 Android ARM 64 (arm64-v8a) 平台，不支持其他安卓设备（例如 Android x86 ）。   
>
> Android 硬件需要满足 UE 开发要求, 具体信息请阅读 Unreal Engine Android 开发的文档。


