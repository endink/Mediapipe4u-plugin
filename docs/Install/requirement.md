---
layout: default
nav_order: 1
title: 环境要求
parent: 安装和配置
---

# 环境要求   

*请仔细阅读以下章节，确认你的环境是否满足 **MediaPipe4U** 要求。*

{: .warning}
> **MediaPipe4U** 不支持 32 位 Windows 平台。

|硬件|版本|
|--------|--------------|
| 磁盘空间 | 开发：10G, 部署：300M (含语音插件)|   


> 插件由于采用预编译，包含大量 C++ 链接符号和调试符号，解压后会占用 **10** 磁盘空间（大部分为 Intermediate 中的 UE 生成代码）
> 
> 你不需要担心磁盘占用问题，这只是开发期间的磁盘占用，在项目打包后，插件磁盘占用大约是 **300M**（主要为 GStreamer 动态库和语音模型文件）


## For Windows 

|软件|版本|
|--------|--------------|
|操作系统|Windows10/11 x64|
|Unreal Engine |5.0.x, 5.1.x, 5.2.x|
|Visual Studio 2022 | 17.6.3 or later|
|Windows SDK|10.0.22621 or later|
|Visual C++ Redistributable|14.36.32532 or later|

> 通常 Visual Studio 2022 17.6.3 或更新的版本中包含了必要的 Visual C++ Redistributable    
{: .warning}
> 仅支持 64 位 Windows，不支持 32 位 Windows。


---

## For Android 

|Unreal Engine| NDK Version | Android SDK Version |
|--------|--------------|----------------------|
| 5.0 | r21e (21.4.7075529)  | 26 or later |
| 5.1 | r25b (25.1.8937393)  | 26 or later |
| 5.2 | r21b (25.1.8937393)  | 26 or later |

{: .warning}
> 仅支持 Android ARM 64 (arm64-v8a) 平台，不支持其他硬件平台。   
>
> Android 硬件需要满足 UE 开发要求, 具体信息请阅读 Unreal Engine Android 开发的文档。


