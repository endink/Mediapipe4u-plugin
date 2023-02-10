---
sort: 1
---

# Nvidia Maxine AR

**Nvidia Maxine AR** (以下简称 **NvAR**) 提供了将人脸 Landmarks 拟合到 Blendshape 的算法。   

**基本原理：**  

**NvARLiveLinkActor** 消费来自 **MediaPipeImageSource** 的图像帧到 NvAR 算解器，将输出结果转换成标准 Apple Arkit 的 BlendShape 权重，
最后，将这些权重以符合 Unreal Engine 要求的格式发送到 LiveLink 总线。  因此，你可以使用标准的 LiveLinkPose 动画蓝图节点接收表情曲线（Curve）驱动你的 3D 角色。


---

**MediaPipe4U** 封装了一个名为 **MediaPipe4UNvAR** 的插件，将 Nvidia 的算法集成到 MediaPipe4U 的工作流管道，可以让它和 MediaPipe 协同工作。
**MediaPipe4UNvAR** 可以在不使用 **MediaPipe4U** 动作捕捉的情况下单独工作，但是 **MediaPipe4UNvAR** 插件依赖 **MediaPipe4U** 插件（项目中必须包含 **MediaPipe4U** 插件）。    

**MediaPipe4UNvAR** 功能：

- 独立使用，无需 **MediaPipeAnimInstance** （但是依赖 **MediaPipe4U** 的 **ImageSource** 工作流，项目需要启用 **MediaPipe4U**）
- 兼容 LinkLive ，支持动画蓝图中的 LiveLink 节点消费 **NvAR** 表情算解结果。
- 兼容Apple Arkit 标准的 51 个 blend shape 名称（不支持 tongueOut）。
- 支持头部旋转 BlendShape, 如果你使用骨骼旋转头部，你需要自行将头部旋转的曲数值映射到骨骼旋转。


演示效果：

[![MediaPipe4UNvAR](https://res.cloudinary.com/marcomontalbano/image/upload/v1675773553/video_to_markdown/images/youtube--bPKSgkCx2kw-c05b58ac6eb4c4700831b2b3070cd403.jpg)](https://youtu.be/bPKSgkCx2kw "MediaPipe4UNvAR")

国内用户如果 Youtube 打不开，请观看 B 站视频：

[B站演示效果](https://www.bilibili.com/video/BV1sD4y1N7HX/?share_source=copy_web&vd_source=f77a8ce9c4c322dcc88515970bea1630)


关于 **NvAR** 的相信信息，你看这里：     
[https://developer.nvidia.com/maxine](https://developer.nvidia.com/maxine)

# 系统要求

## 软件要求

|软件|版本要求|
|----|--------|
Windows OS | 64-bit Windows 10 or later
NVIDIA Graphics Driver for Windows | 511.65 or later
Nvidia Maxine AR SDK | 0.8.2

> MediaPipe4U 的 NvAR 插件无论是开发环境和打包后不熟都要求 PC 已经安装 **Nvidia Maxine AR SDK**。
> 由于 NvAR 插件体积太大（1G以上），让用户自行安装会更方便，否则你的软件包也将非常大。

## 硬件要求

**NvAR** 必须使用 Nvidia GPU, 只支持以下三种架构

- **NVIDIA Turing™**: Geforce RTX 20XX
- **NVIDIA Ampere™**: Geforce RTX 30XX
- **NVIDIA Ada™**: Geforce RTX 40XX
- **Other have Tensor Cores**: H100,etg (but no sdk for downloading, ask nvidia ? )

> 官方要求说明：  NVIDIA GeForce RTX 20XX and 30XX Series, Quadro RTX 3000, TITAN RTX, or higher (any NVIDIA GPUs with Tensor Cores)

Nvidia 官方的系统和软件要求请阅读这里：

[https://docs.nvidia.com/deeplearning/maxine/ar-sdk-system-guide/index.html](https://docs.nvidia.com/deeplearning/maxine/ar-sdk-system-guide/index.html)

**注意:**不同的显卡有不同的可再发现组件包，如何使用请继续阅读下面的章节。

## 启用 UnrealEngine 插件

请启用以下 UnrealEngine 插件：   

- MediaPipe4U
- LiveLink


## 开始使用

### 1. 安装 Nvidia 的可再发行组件包（Redistributable SDK package)

从以下网址下载适合你的显卡的组件包：   

[https://www.nvidia.com/broadcast-sdk-resources](https://www.nvidia.com/broadcast-sdk-resources)

[![NvAR](./nvar/download_nvar.jpg "NvAR")](nvar/download_nvar.jpg)



### 2. 安装 MediaPipe4UNvAr 插件   

从下载的 MediaPipe4U 插件目录找到 MediaPipe4UNvAR 目录，将它复制到你的 Unreal Egine 项目 Plugins 目录并启用它.   

[![NvAR](./nvar/nvar_plugin_install.jpg "NvAR")](./nvar/nvar_plugin_install.jpg)   

> **MediaPipe4UNvAR** 通过 LiveLink 来驱动角色，因此你也必须在项目中启用 **LiveLink** 插件

### 3. 添加 NvARLiveLinkActor

在场景中添加一个 **NvARLiveLinkActor** 。

[![NvAR](./nvar/nvar_put_actor_to_level.jpg "NvAR")](./nvar/nvar_put_actor_to_level.jpg)

---   



> 通过步骤 **3**, 我们已经准备好 **NvARLiveLinkActor** 来消费图像帧数据了。
>
> **NvARLiveLinkActor** 可以和 **MediaPipe4U** 动作捕捉协同工作，也可以独立工作。 
>    
> - 如果你想要在 **MediaPipe4U** 动作捕捉的同时，通过 NvAR 表情捕捉，请j继续阅读小节 **4**。  
> - 如果你希望单独使用 **NvARLiveLinkActor** 从图像源中捕捉表情而不使用 **MediaPipe4U** 的动作捕捉功能，请阅读小节 **5**
>

### 4. 与 MediaPipe4U 动作捕捉集成


与 **MediaPipe4U** 动作捕捉集成只需要设置 **NvARLiveLinkActor** 上的变量为 **true** 即可。

[![NvAR](./nvar/nvar_enable_start_with_mediapipe.jpg "NvAR")](./nvar/nvar_enable_start_with_mediapipe.jpg)

**了解原理：**   

MediaPipe 动作捕捉也要消费图像帧数据，通过设置 **NvARLiveLinkActor** 上的变量为 **true** ，使得 **NvARLiveLinkActor** 伴随 **MediaPipeHolisticComponent** 自动启停，你无需管理 **NvARLiveLinkActor** 的启动或停止， 并且自动消费来自 MediaPipe 的图像帧数据（视频、摄像头或者图片） 。


### 5. 独立使用 NvAR 表情捕捉

暂缺文档   

<!-- # > 如果你阅读过本节开头的"基本原理", 你就知道 NvAR 需要消费图像帧来计算表情权重。
# > 帧由图像源提供，图像源在 MediaPipe4U 中被抽象为 **MediaPipeImageSource** (实际它是一个 **IMediaPipeImageSource** 接口)。
# 
# - 5.1 准备图像源（**MediaPipeImageSource**）
# 
# 在场景中的任意 Actor 上附加一个图像源，**MediaPipe4U** 支持三种开箱即用的图像源：   
# 
# - **StaticImageSouceComponent** : 静态图片
# - **GStreamerImageSourceComponent** ：视频文件
# - **WebcamImageSourceComponent**: USB 摄像头
# 
# > 你也可以实现自己的图片源。但是，实现图像源必须使用 C++ 编程，因为图片源伴随着复杂的异步任务，多线程，图片解码等内容，稍有不当，会造成死锁，程序性能低下等严重问题，所以，用蓝图实现图像源并不合适。
# > 在 C++ 中，可以通过继承 **MediaPipeImageSourceComponent** 实现自己的图像源，**MediaPipeImageSource** 已经为你处理好多线程，帧缓冲池, 异步消费队列等棘手的问题，你只需要自己完成图片格式解码即可。 -->


<!-- 不同的图像源有不同的使用方式，图像源的详细信息你可以查看 [准备 MediaPipe 运行时组件](../usage/prepare_components.md) 一章的内容。 -->

### 6. 驱动 3D 角色（Avatar）

和使用 Apple 的 Arkit 一样，通过在动画蓝图中添加 **LiveLinkPose** 节点，并将 Subject 设置为 MediaPipe NvAR 即可。

- 如果你的角色是 BlendShape  (Morph Target), 而且已经是 Arkit 标准表情名称，那么你的角色表情已经可以被驱动。    
- 如果你的表情是通过骨骼驱动，请使用 PoseAsset 映射曲线名称到你的骨骼动画。
- 如果你的不是标准的 Arkit 表情名称，那么你可以通过 **ModifyCurve** 或者 **LiveLinkRemapAsset** 来映射他们。

> 关于苹果的52个标准 Blendshape ，请阅读这里：[https://developer.apple.com/documentation/arkit/arfaceanchor/blendshapelocation](https://developer.apple.com/documentation/arkit/arfaceanchor/blendshapelocation)

[![NvAR](./nvar/nvar_put_livelink_node.jpg "NvAR")](./nvar/nvar_put_livelink_node.jpg)


需要注意的是，的 **MediaPipe4UNvAR** 默认使用 "MediaPipe NvAR"（中间包含空格）作为 LiveLink Subject 名称，你的 LiveLink Pose 节点上的 Subject 必须和这个名称保持一致。   
Subject 名称可以通过 **NvARLiveLinkActor** 上的属性 **LiveLinkSubjectName** 进行修改。

### 7. 属性

NvAR 产生的数据中带有抖动，**MediaPipe4U** 通过滤波算法来消除这些数据噪音，让表情更加平滑自然。   
你可以通过 **NvARLiveLinkActor** 中的 SmoothParams 来调整算法的参数。

[![NvAR](./nvar/nvar_actor_props.jpg "NvAR")](./nvar/nvar_actor_props.jpg)

**参数说明**

|参数|说明|
|----|--------|
Disabled | 使用禁用 NvAR 功能，当你不再需要 NvAR 表情捕捉时，尽可能禁用它可以提供应用程序性能。
LiveLinkSubjectName | 控制 LiveLink 数据发送到的 LiveLink Subject 名称。
SmoothParams | 用来平滑表情的滤波算法参数
SmoothEnabled | 是否启用表情平滑
AttachToMediaPipeOnBeginPlay | 是否程序启动后自动将 **NvARLiveLinkActor** 附加到 **MediaPipe4U** 动作捕捉数据管道, 开启此属性后 **NvARLiveLinkActor** 将自动消费来自 MediaPipe 的图像帧产生表情动画

**附录：Arkit BlendShape 名称**
|名称|说明|NvAR 支持|
|----|----|--------|
|eyeBlinkLeft| 左眼眨眼|Yes|
|eyeLookDownLeft |左眼目视下方|Yes|
|eyeLookInLeft |左眼注视鼻尖|Yes|
|eyeLookOutLeft| 左眼向左看|Yes|
|eyeLookUpLeft| 左眼目视上方|Yes|
|eyeSquintLeft| 左眼眯眼|Yes|
|eyeWideLeft |左眼睁大|Yes|
|eyeBlinkRight |右眼眨眼|Yes|
|eyeLookDownRight |右眼目视下方|Yes|
|eyeLookInRight |右眼注视鼻尖|Yes|
|eyeLookOutRight |右眼向左看|Yes|
|eyeLookUpRight |右眼目视上方|Yes|
|eyeSquintRight| 右眼眯眼|Yes|
|eyeWideRight |右眼睁大|Yes|
|jawForward |努嘴时下巴向前|Yes|
|jawLeft |撇嘴时下巴向左|Yes|
|jawRight |撇嘴时下巴向右|Yes|
|jawOpen |张嘴时下巴向下|Yes|
|mouthClose |闭嘴|Yes|
|mouthFunnel |稍张嘴并双唇张开|Yes|
|mouthPucker |抿嘴|Yes|
|mouthLeft |向左撇嘴|Yes|
|mouthRight |向右撇嘴|Yes|
|mouthSmileLeft |左撇嘴笑|Yes|
|mouthSmileRight| 右撇嘴笑|Yes|
|mouthFrownLeft |左嘴唇下压|Yes|
|mouthFrownRight |右嘴唇下压|Yes|
|mouthDimpleLeft |左嘴唇向后|Yes|
|mouthDimpleRight |右嘴唇向后|Yes|
|mouthStretchLeft |左嘴角向左|Yes|
|mouthStretchRight |右嘴角向右|Yes|
|mouthRollLower |下嘴唇卷向里|Yes|
|mouthRollUpper |下嘴唇卷向上|Yes|
|mouthShrugLower |下嘴唇向下|Yes|
|mouthShrugUpper |上嘴唇向上|Yes|
|mouthPressLeft |下嘴唇压向左|Yes|
|mouthPressRight |下嘴唇压向右|Yes|
|mouthLowerDownLeft |下嘴唇压向左下|Yes|
|mouthLowerDownRight |下嘴唇压向右下|Yes|
|mouthUpperUpLeft |上嘴唇压向左上|Yes|
|mouthUpperUpRight |上嘴唇压向右上|Yes|
|browDownLeft |左眉向外|Yes|
|browDownRight| 右眉向外|Yes|
|browInnerUp |蹙眉|Yes|
|browOuterUpLeft |左眉向左上|Yes|
|browOuterUpRight |右眉向右上|Yes|
|cheekPuff| 脸颊向外|Yes|
|cheekSquintLeft |左脸颊向上并回旋|Yes|
|cheekSquintRight |右脸颊向上并回旋|Yes|
|noseSneerLeft |左蹙鼻子|Yes|
|noseSneerRight| 右蹙鼻子|Yes|
|tongueOut |吐舌头|<mark>No</mark>|

