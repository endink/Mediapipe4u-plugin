---
layout: default
title: MediaPipeHolisticComponent
parent: 进阶用法
nav_order: 1
---

# MediaPipeHolisticComponent

Google mediapipe 将 Pose, Hand, Face 地标融合到一个同一个的计算器 holistic 中，**MediaPipe4U** 将这个计算器封装成 UnrealEngine 组件，
公开了 google 几乎所有的图形（graph）参数，它是整个 **MediaPipe4U** 的核心组件，也是动作、表情、手指捕捉的数据来源, 同时，它也是 **MediaPipe4U**
的启动器，整个动补过程都由它发起。

[![MediaPipe4U](./images/holistic.gif "MediaPipe4U")](./images/holistic.gif)

>有关 google mediapipe holistic 详细信息，请访问这里：   
>[https://google.github.io/mediapipe/solutions/holistic.html](https://google.github.io/mediapipe/solutions/holistic.html)

{: .warning-title }
> 限制   
>   
>由于 **MediaPipeHolisticComponent** 的特殊性，你应该保证整个场景中只有唯一个 **MediaPipeHolisticComponent** 实例。

## Google MediaPipe 参数

**MediaPipeHolisticComponent** 通过 **Options** 变量暴露 google mediapipe 的原始参数。

|参数名|类型| 说明|
|------|----|----|
|InputAngle|enum|它可以控制让 mediapipe 来旋转图像，不建议使用，因为这回造成和原始图像不一致，优先在 **ImageSource** 上处理图像|
|InputVerticallyFlipped|bool|让 mediapipe 垂直翻转，不建议使用，因为这回造成和原始图像不一致，优先在 **ImageSource** 上处理图像|
|InputVerticallyFlipped|bool|让 mediapipe 水平翻转，不建议使用，因为这回造成和原始图像不一致，优先在 **ImageSource** 上处理图像|
|ModelComplexity| enum |mediapipe 提供的模型复杂度，Lite, Full, Heavy，一般设置为 Full 即可|
|SmoothLandmarks| bool | 是否平滑地标，这回影响计算结果，默认为 **true**|
|EnableSegmentation| bool | 是否分割背景，默认为 **false**，不建议开启，会耗费性能|
|SmoothSegmentation| bool | 分割背景时边缘平滑，默认为 **false**，不建议开启，会耗费性能|
|UsePrevLandmarks| bool | 是否使用上一帧数据优化动补，这个参数由 MediaPipe4U 自动根据环境修改，程序无需关心|

## 控制参数

|参数名|类型| 说明|
|------|----|----|
|VideoDisplay| enum |图像回显的方式，**Raw** 显示原始图像，**Annotated** 带 MediaPipe 修饰线条的图像，注意，**Raw** 显示性能高于 **Annotated**|
|MediaPipeSourceInfo|struct|这是一个只读的变量，你不应改修，获取当前图像源的信息，例如视频高度、宽度、是否是静态图片|
|GraphTimeoutSeconds|int|MediaPipie 计算时图像帧的超时时间，关于这部分信息，请参看 mediapipe bound time 相关文档|

## 生命周期回调

**MediaPipeHolisticComponent** 提供了蓝图可用的生命周期事件（多播委托）

|事件|说明|
|------|----|
|OnVideoTextureCreated|当回显的视频图像创建时回调该委托|
|OnMediaPipeInitialized| 当 MediaPipe 完成初始化时回调该委托|
|OnMediaPipeStarted| 当 MediaPipe 动补启动时回调该委托|
|OnMediaPipeStopped| 当 MediaPipe 动补停止时回调该委托|
|OnMediaPipeThreadFault| Mediapipe 工作线程发生错误时回调该委托|

> 注意，**MediaPipeHolisticComponent** 的回调发生在任意线程，如果你需要游戏线程，需要自己切换。

## 函数

|函数|说明|
|------|----|
|StartCamera| 启动摄像头动补|
|StartImageSource| 启动其他类型的图像源动补|
|Stop| 停止动补 |
|IsNativeImageSource| 指示当前图像源是一个 Native (普通 C++ 实现)图像源还是一个 UObject 图像源，为 **true** 表示 Native 图像源，反之，是一个 UObject 图像源，如果 MediaPipe 没有运行，会返回 false|
|IsRunning| 用来判断 MediaPipe 是否已经启动 |
|GetCurrentCameraParams| 获取当前正在运行的摄像头参数。注意：StartCamera传入的参数可能和此方法返回不一致，设备不支持传入的分辨率或帧率时会自动使用合适的参数打开摄像头 |

## MediaPipe 原始数据 (C++)

如果你希望获得 google mediapip 的原始数据，例如地标（Landmarks）, 你必须使用 C++ 编程，不支持蓝图。    
你可以通过订阅事件 (Unreal Event) 来侦听来自 mediapipe 的原始数据

|函数|说明|
|----|-----|
|PoseLandmarksEventTrigger| 获得 Pose 地标 | 
|LeftHandLandmarksEventTrigger| 获得左手地标 | 
|RightHandLandmarksEventTrigger| 获得右手地标 | 
|FaceLandmarksEventTrigger| 获得 FaceMesh 地标 | 
|PoseWorldLandmarksEventTrigger|获得 3D 化的 Pose 地标| 
|FaceGeometryEventTrigger| 获得 FaceGeometry 数据（地标，顶点） |

