# 概览

MediaPipe4U 内部使用一套统一的通用的管道（pipline）来处理视觉任务，包括但不限于动作捕捉、表情捕捉。


## 流程

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


## 组件和抽象：

- `Image Source`：对应 MediaPipe4U 中的 `ImageSourceComponent` 接口。
- `Image Consumer`：对应 MediaPipe4U 中的 `IImageConsumer`或`IImageConsumerProvider` 接口。


