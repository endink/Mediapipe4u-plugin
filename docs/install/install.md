# 安装 MediaPipe4U

## 插件内容

**MediaPipe4U** 中包含多个 Unreal Engine 插件，下面是插件介绍。你可以根据需要在你的项目中引入这些插件。

`MediaPipe4U`

:   这是 MediaPipe4U 最基础的插件，它包含了 OpenCV\MediaPipe\DirectML 等基础框架和
    MediaPipe4U 的公共代码（如图像源：摄像头源，静态图源）。 除了 `GStreamer`插件，MediaPipe4U 的其他所有插件都依赖它。

`GStreamer`

:   这是 GStreamer 程序在 Unreal Engine 中的包装，可以让你在 Unreal Engine 中使用 GStreamer 。

`MediaPipe4UMotion`

:   这是动作捕捉插件，如果你需要从图像中进行动作捕捉功能，可以使用它, (它可以从摄像头、静态图片中捕捉动作)。

`MediaPipe4ULiveLink`

:   这是表情插件，如果你需要从图像中进行表情捕捉功能，可以使用它 。   

`MediaPipe4UGStreamer`

:   这是通过 GStreamer 实现的图像源，如果你希望 `MediaPipe4UMotion`、`MediaPipe4ULiveLink` 从视频中采集图像进行动作捕捉、表情捕捉，可以使用它 。

`MediaPipe4UBVH`

:   这个插件提供将 Unreal Engine 动画转换成 BVH 格式的动画文件的能力，搭配 `MediaPipe4UMotion` 可以直接将视频中的人物动作输出到 bvh 文件。

`MediaPipe4UNvAR`

:  这个插件能够使用 Nvdia Maxine 的算法，代替 google mediapipe 算法，以使得 `MediaPipe4UMotion` 和 `MediaPipe4ULiveLink` 能够使用 Navidia 算法进行动作捕捉和表情捕捉。

`MediaPipe4USpeech`

: 这个插件提供语音相关的 AI 能力，包含实时的文本转语音（TTS）、语音识别（ASR）、语音唤醒功能，为你的 UE 项目带来 “听” 和 “说” 的能力。

`MediaPipe4ULLM`

: 这个插件能够让你在 UE 工程中连接到 Ollama ，为你的 UE 项目带来大语言模型（LLM）推理能力。

`MediaPipe4ULLMSpeech`

: 这个插件整合了 `MediaPipe4USpeech` 和 `MediaPipe4ULLM`, 可以让你很容易的在 Unreal Engine 中实现基于大语言模型（LLM）的语音聊天机器人。

## 安装步骤

---
1. 拷贝以下目录到 [UE项目根目录]/Plugins

   - MediaPipe4U
   - GStreamer
   - MediaPipe4UGStreamer
   - MediaPipe4ULiveLink
   - 其他 ...   

  完成后你的目录结构通常如下：   
  
  ```
  UEProjectSample
  ├─Binaries
  ├─Build
  ├─Config
  ├─Content
  ├─Intermediate
  ├─Plugins
  │  ├─GStreamer
  │  ├─MediaPipe4U
  │  ├─MediaPipe4UGStreamer
  │  ├─MediaPipe4ULiveLink
  │  ├─其他
  ├─Saved
  ├─Script
  └─Source
  ```

1. 打开 UE Editor, 确保以下插件已经启用

  [![启用插件](images/plugin_enable.jpg "Shiprock")](images/plugin_enable.jpg)


