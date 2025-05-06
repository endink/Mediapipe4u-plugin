
# Android 打包

一般情况下， `MediaPipe4U` 能够很容易的和你的项目一起打包发布，但是也有一些限制条件。   

## 限制

1. `MediaPipe4U` 在 Android 平台只支持 `Development` 和 `Shipping` 打包，**不支持** `DebugGame` 打包。
2. `MediaPipe4U` 只支持 `arm64` (`ARMv8-A`) 平台，**不支持**其他平台 (如 x64 ) 打包。
3. `MediaPipe4U` 中的部分插件并**不支持** Android 平台，如果开发 Android 项目，必须将其移除，关于平台支持情况，请阅读[插件和依赖](./plugin_content.md)。


## Android 打包配置

MediaPipe4U 在以下环境通过打包测试， 建议你使用以下环境打包 Android 工程：

1. `Android Studio`： 2024.3.1。   
2. `Android SDK`：34
3. `Android Build Tools`: 34.0
4. `JDK`: 17.0.9
5. `NDK`: r25b (25.1.8937393)
6. `Gradle`: 8.7

> 你可以使用 Android Studio 安装 Android SDK、NDK, Build Tools。
   
---  

## 在 UE Editor 中打包 Android

通过点击 `Platform` >> `Android` >> `Package Project` 可以完成打包。

!!! warning
	
	UE Editor 默认可能使用 `DebugGame` 打包， `MediaPipe4U` 由于是预编译插件，不支持此打包模式，请切换到 `Development` 和 `Shipping` 默认。

	如果使用 Debug Game 打包，你将收到如下错误：   

	Missing precompiled manifest for 'MediaPipeAndroid', 'XXX\MediaPipeAndroid.precompiled. This module can not be referenced in a monolithic precompiled build, remove this reference or migrate to a fully compiled source build.   

	UATHelper: Packaging (Android (ASTC)): This module was most likely not flagged during a release for being included in a precompiled build - set 'PrecompileForTargets = PrecompileTargetsType.Any;' in MediaPipeAndroid.Build.cs to override.



![Android Package](./images/android_package.jpg)


##  Failed to open descriptor file 错误

Android 打包部署到真机后，可能出现 `Failed to open descriptor file`：

![Failed to open descriptor file](./images/failed_to_open_descriptor.webp)

这个问题是 Unreal Engine 的一个祖传错误，没有标准的解决方案，如果出现这个错误, 我们可以尝试如下步骤解决它：   

### 常规处理方法

首先，删除构建缓存, 它们是工程根目录下的这些目录：

- Binarires
- Build 
- Intermediate 


其次，检查如下设置：

- NDK 使用和 Unreal Engine 文档中一致的版本
- 将构建切换到 `Development` （如果你正在使用 `Shipping`）
- 在 `Project Settings` 的 `Android SDK` 中明确设置你本机的 SDK 和 NDK 路径
- 设置 SDK API Level 为 `matchndk`

最后，重新打包。

### 使用 ADGE 代替 UE Editor

如果上述方案依然无效，那么，可以使用 ADGE 代替 Unreal Engine Editor 打包工程， 步骤如下：   


1. 安装 ADGE 插件到 Visual Studio
2. 删除构建缓存目录：Binarires、Build、Intermediate
3. 使用 Visual Studio 编译工程（配置为 Windows, Development），这一步主要为了让工程可以在 UE Editor 中打开。
4. 打开 UE Edtitor , 选择 `Development` 模式 打包 (Package) Android  工程，注意：**不要**以任何模式运行 Android 工程， 仅执行 Package 。
5. 打包完成后关闭 UE Editor。
6. 打开 Visual Studio 选择你的真机，选择 `Development` 模式直接运行调试， 这是 VS 将开始编译 Android C++ 代码，之后自动部署 APK 到你的 Android 设备。

!!! tip ADGE 详细使用方法
    
    ADGE 使用方法可以参考[Unreal Engine 官方文档](https://dev.epicgames.com/documentation/en-us/unreal-engine/debugging-unreal-engine-projects-for-android-in-visual-studio-with-the-agde-plugin){: target='_blank'}。
