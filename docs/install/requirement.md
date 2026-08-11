# 环境要求   

*请仔细阅读以下章节，确认你的环境是否满足 **MediaPipe4U** 要求。*

MediaPipe4U 支持下列的平台：    

- Windows x64 
- Android arm64-v8a   

MediaPipe4U 最低支持 Unreal Engine 5.1。

!!! warning "不受支持的平台"

    **MediaPipe4U** 不支持 32 位 Windows 平台。   
    **MediaPipe4U** 不支持非 `arm64-v8a` 的 Android（由于 Launcher 版 Unreal Engine 限制）。

|硬件|版本|
|--------|--------------|
| 磁盘空间 | 开发：10G, 部署：300M (含语音插件)|   


> 插件由于采用预编译，包含大量 C++ 链接符号和调试符号，解压后会占用 **10** 磁盘空间（大部分为 Intermediate 中的 UE 生成代码）
> 
> 你不需要担心磁盘占用问题，这只是开发期间的磁盘占用，在项目打包后，插件磁盘占用大约是 **300M**（主要为 GStreamer 动态库和语音模型文件）



## 跨平台支持

MediaPipe4U 目前支持 Windows x64 和 Android arm-64 平台，但是功能支持上有差异，Windows 平台支持全功能，Android 仅支持动作和表情捕捉。   

所有插件目录及其依赖关系请参阅[插件和依赖](../package/plugin_content.md)。打包目标平台时，只能启用该平台可用的插件及其依赖。


=== "Windows"

    !!! note inline end "如何检查环境？"

        通常 Visual Studio 2022 最新版本中包含了必要的 MSVC 工具链      
           
        以 VS 2022 为例，可以在以下位置查看你的 MSVC 版本：   
        `C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Tools\MSVC`   
           
        仅支持 64 位 Windows，不支持 32 位 Windows。   

    |UE 版本| VC 工具链 | Windows SDK 版本|
    |--------|-----|------|
    | 5.1 | 14.38.33130 (17.8) | 10.0.22621 or later|
    | 5.2 | 14.38.33130 (17.8) | 10.0.22621 or later|
    | 5.3 | 14.38.33130 (17.8) | 10.0.22621 or later|
    | 5.4 | 14.38.33130 (17.8) | 10.0.22621 or later|
    | 5.5 | 14.38.33130 (17.8) | 10.0.22621 or later|
    | 5.6 | 14.38.33130 (17.8) | 10.0.22621 or later|
    | 5.7 | 14.44.35207 (17.14) | 10.0.22621 or later|
    | 5.8 | 14.44.35207 (17.14) | 10.0.22621 or later|
        

=== "Android"

    !!! note inline end "注意"

        - 仅支持 Android ARM 64 (arm64-v8a) 平台，不支持其他安卓设备（例如 Android x86 ）。    
        - Android 硬件需要满足 UE 开发要求, 具体信息请阅读 Unreal Engine Android 开发的文档。
   
    Build-tools: 34.0      

    JDK: 17.0.9   

    [ADGE](https://developer.android.com/games/agde): v24.1.99 ('ADGE' 仅当你需要调试 Android C++ 代码时需要)   

    |Unreal Engine| NDK Version | Android SDK Version |
    |--------|--------------|----------------------|
    | 5.1 | r25b (25.1.8937393)  | 26 or later |
    | 5.2 | r25b (25.1.8937393)  | 26 or later |
    | 5.4 | r25b (25.1.8937393)  | 26 or later |
    | 5.5 | r25b (25.1.8937393)  | 26 or later |
    | 5.6 | r27b (27.1.12297006)  | 26 or later |
    | 5.7 | r27c (27.2.12479018)  | 26 or later |
    | 5.8 | r27c (27.2.12479018)  | 26 or later |

    
