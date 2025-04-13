# 视觉任务概述

MediaPipe4U 内部使用一套统一的通用的管道（pipline）来处理视觉任务，包括但不限于动作捕捉、表情捕捉。


## 视觉任务流程

视觉任务指在图像应用 AI 算法的一类任务， 我们定义了统一的视觉任务处理管道来完成这些任务。

!!! tip 

    动作、表情捕捉是典型的视觉任务。 

    视觉任务处理流程定义在 `MediaPipe4U` 插件中。   

    动作捕捉组件定义在 `MediaPipe4UMoion` 插件中。

    表情捕捉组件定义在 `MediaPipe4ULiveLink` 插件中。

``` mermaid
sequenceDiagram
  autonumber
  Image Source->>Image Consumer: Get one image frame
  loop For each consumer
      Image Consumer->>Image Consumer: Process one frame
  end
  Note right of Image Consumer: Synchronized processing, one by one consumer
  Image Consumer->>Unreal Engine: Integration into Unreal Engine
  Image Consumer-->>Image Source: Poll next frame!
```

简要流程说明：

1. `Image Source` 负责从各类媒体中获得一帧图像。
1. `Image Consumer` 负责对一帧图像进行处理，管道中存在多个`Image Consumer`, 同一帧图像循环分发到每一个`Image Consumer`。
1. `Image Consumer` 和 Unreal Engine 集成，将处理结果反馈到 `Unreal Engine`。
1. 当所有的 `Image Consumer` 处理完成后，`Image Source` 通过 `Poll` 操作拉取下一帧图像，进行下一次处理流程。


## 组件和抽象

- `Image Source`：对应 MediaPipe4U 中的 `ImageSourceComponent` 接口。
- `Image Consumer`：对应 MediaPipe4U 中的 `IImageConsumer`或`IImageConsumerProvider` 接口。


## 内置组件

MediaPipe4U 从统一的视觉任务处理管道中受益，插件中内置了多个 `Image Source` 和两个主要的 `Image Consumer`：

- `ImageSourceComponent`: MediaPipe4U 内置了各种图像提供程序，可以从各类常见的媒体中获取图像，有关 `Image Source` 的更多信息，请阅读 [Image Source 文档](./image_source.md)
- `MediaPipeHolisticComponent`: 这是一个 `Image Consumer`, 使用 google mediapipe 算法处理图像并计算角色的关节旋转，并将关节旋转应用到 Unreal Engine 中的 3D 骨骼网格体。
- `MediaPipeFaceLinkActor`:  这是一个 `Image Consumer`, 使用算法（mediapipe, nvar）计算图像中的面部表情系数， 并将面部表情系数通过 `Live Link` 数据传输协议传递到 Unreal Engine 中。   

## 扩展支持 (C++)

**Image Consumer** 

MediaPipe4U 支持你注册自己的 `Image Consumer` 使用我们提供的视觉任务 Pipline 来处理更多的视觉任务。   

有关 `Image Consumer` 请查阅 [Image Consumer 文档](./image_consumer.md)。