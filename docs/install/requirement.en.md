# Environment Requirements

*Please read the following sections carefully to confirm whether your environment meets the **MediaPipe4U** requirements.*

MediaPipe4U supports the following platforms:  
1. Windows x64  
2. Android arm64-v8a   

!!! warning "Unsupported Platforms"

    **MediaPipe4U** does not support 32-bit Windows platforms.  
    **MediaPipe4U** does not support Android platforms other than `arm64-v8a` (due to limitations of the Launcher version of Unreal Engine).

| Hardware | Version |
|--------|--------------|
| Disk Space | Development: 10G, Deployment: 300M (including speech plugin) |   

> The plugin, due to pre-compilation, contains a large number of C++ link symbols and debug symbols, and will occupy **10** disk space after decompression (mostly UE-generated code in Intermediate).  
> You do not need to worry about disk space usage, as this is only during development. After the project is packaged, the plugin's disk usage is approximately **300M** (mainly GStreamer dynamic libraries and speech model files).

---

## Cross-Platform Support

MediaPipe4U currently supports Windows x64 and Android arm-64 platforms, but there are differences in feature support. The Windows platform supports all features, while Android only supports motion and expression capture.

| Plugin (Module) | Windows | Android | Linux |
|---| --- | --- | ---- |
| MediaPipe4U             | :heavy_check_mark: | :heavy_check_mark: | Coming Soon |
| MediaPipe4ULiveLink     | :heavy_check_mark: | :heavy_check_mark: | Coming Soon |
| GStreamer               | :heavy_check_mark: | :x: | Coming Soon |
| MediaPipe4UGStreamer    | :heavy_check_mark: | :x: | Coming Soon |
| MediaPipe4UBVH          | :heavy_check_mark: | :x: | Coming Soon |
| MediaPipe4USpeech       | :heavy_check_mark: | :x: | Coming Soon |
| MediaPipe4ULLM          | :heavy_check_mark: | :x: | Coming Soon |

---

=== "Windows"

    !!! note inline end "How to Check the Environment?"

        Usually, Visual Studio 2022 17.9.6 or later includes the necessary MSVC toolchain.  
        For example, in VS 2022, you can check your MSVC version at the following location:  
        `C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Tools\MSVC`  
        Only 64-bit Windows is supported; 32-bit Windows is not supported.

    | Software | Version |
    |--------|--------------|
    | Operating System | Windows10/11 x64 |
    | Unreal Engine | 5.1.x, 5.2.x, 5.4.x |
    | Visual Studio 2022 | 17.9.6 or later |
    | Windows SDK | 10.0.22621 or later |
    | MSVC | 14.38.33130 or later |

    > :bangbang: MSVC 14.39.X and UnrealEngine 5.4.1 may have conflicts. It is recommended to use MSVC version 14.38.X.

=== "Android"

    !!! note inline end "Note"
        - Only Android ARM 64 (arm64-v8a) platforms are supported; other Android devices (e.g., Android x86) are not supported.  
        - Android hardware must meet UE development requirements. For more information, please refer to the Unreal Engine Android development documentation.

    | Unreal Engine | NDK Version | Android SDK Version |
    |--------|--------------|----------------------|
    | 5.0 | r21e (21.4.7075529)  | 26 or later |
    | 5.1 | r25b (25.1.8937393)  | 26 or later |
    | 5.2 | r25b (25.1.8937393)  | 26 or later |
    | 5.4 | r25b (25.1.8937393)  | 26 or later |
    | 5.5 | r25b (25.1.8937393)  | 26 or later |

