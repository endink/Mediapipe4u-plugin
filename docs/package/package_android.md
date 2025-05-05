
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
5. `NDK`: r25b
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





