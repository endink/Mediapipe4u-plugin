# Environment Requirements   

*Please read the following sections carefully to confirm whether your environment meets the requirements of **MediaPipe4U**.*

MediaPipe4U supports the following platforms:    

- Windows x64 
- Android arm64-v8a   

MediaPipe4U requires Unreal Engine 5.1 or later.

!!! warning "Unsupported Platforms"

    **MediaPipe4U** does not support 32-bit Windows platforms.  
    **MediaPipe4U** does not support Android other than `arm64-v8a` (due to limitations of the Launcher version of Unreal Engine).
|Component|Version|
|--------|--------------|
| Disk Space | Development: 10G, Deployment: 300M (including speech plugin)|   


> Because the plugin uses precompiled binaries and includes a large number of C++ linker symbols and debug symbols, it occupies **10** GB of disk space after extraction (mostly UE-generated code in Intermediate).
> 
> You do not need to worry about disk usage. This is only disk usage during development; after packaging the project, the plugin uses approximately **300M** of disk space (mainly GStreamer dynamic libraries and speech model files).



## Cross-platform Support

MediaPipe4U currently supports Windows x64 and Android arm-64 platforms, but feature support differs: Windows supports all features, while Android supports only motion and facial expression capture.   

For all plugin directories and their dependencies, see [Plugins and Dependencies](../package/plugin_content.en.md). When packaging for a target platform, enable only the plugins and dependencies available for that platform.


=== "Windows"

    !!! note inline end "How to Check Your Environment?"

        The latest version of Visual Studio 2022 usually includes the required MSVC toolchain.     
           
        Taking VS 2022 as an example, you can find your MSVC version at the following location:  
        `C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Tools\MSVC`   
           
        Only 64-bit Windows is supported; 32-bit Windows is not supported.  

    |UE Version| VC Toolchain | Windows SDK Version|
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

    !!! note inline end "Note"

        - Only the Android ARM 64 (arm64-v8a) platform is supported; other Android devices (such as Android x86) are not supported.   
        - Android hardware must meet UE development requirements. For details, please read the Unreal Engine Android development documentation.   
   
    Build-tools: 34.0      

    JDK: 17.0.9   

    [ADGE](https://developer.android.com/games/agde): v24.1.99 ('ADGE' is only needed when you need to debug Android C++ code)   

    |Unreal Engine| NDK Version | Android SDK Version |
    |--------|--------------|----------------------|
    | 5.1 | r25b (25.1.8937393)  | 26 or later |
    | 5.2 | r25b (25.1.8937393)  | 26 or later |
    | 5.4 | r25b (25.1.8937393)  | 26 or later |
    | 5.5 | r25b (25.1.8937393)  | 26 or later |
    | 5.6 | r27b (27.1.12297006)  | 26 or later |
    | 5.7 | r27c (27.2.12479018)  | 26 or later |
    | 5.8 | r27c (27.2.12479018)  | 26 or later |

    



