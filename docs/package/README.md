---
sort: 20
---
# 打包部署

一般情况下， **MediaPipe4U** 能够很容易的和你的项目一起打包发布，但是也有一些限制条件。   

## 限制

1. **MediaPipe4U** 不支持通过源码构建引擎并且项目（project）的 **LinkType** 设置为 **Modular** 的项目打包。
2. **MediaPipe4U** 的打包配置是 **Development** ，只支持 **Development** 和 **Shipping** 打包，不支持 **DebugGame** 打包。
3. **MediaPipe4U** 只支持 **Windows x64** 平台，不支持其他平台打包。

> 事实上，当项目（project）的 **LinkType** 设置为 **Modular** 时， **MediaPipe4U** 可以在 Development Editor 配置下编译成功，即在 Editor 中可以正常使用，无法通过 Development/Shipping 编译。   

---   

## Unreal Engine 

为了方便描述，文档中把引擎分为两种：

1. 源码版： 下载 UnrealEngine 源码自己编译的引擎。   
2. Launcher 版：使用 Epic Game Launcher 安装的引擎。
   
---  

Launcher 版引擎构打包不需要特别处理，正常打包即可，文档不做说明，关于如何打包 Unreal 项目，请查阅 Unreal Engine 官方文档：   

[https://docs.unrealengine.com/5.0/packaging-unreal-engine-projects/](https://docs.unrealengine.com/5.0/packaging-unreal-engine-projects/)

--- 

源码版引擎打包请看这里:   

[源码版引擎打包](./source_engine_package.md)

{% include list.liquid %}