# 插件和依赖

开始打包部署之前你有必要了解整个 `MediaPipe4U` 包含的内容。`MediaPipe4U` 包含多个 Unreal Engine 插件，你应该按需选择插件进行打包以缩减最终程序的体积。

<div class="grid cards" markdown>

-   :fontawesome-brands-windows:{ .windows } :fontawesome-brands-android:{ .android } __MediaPipe4U__

    ---

    MediaPipe4U 最基础的插件和基础功能，包含公共代码和基础图像源。

    依赖：`OpenCV`、`AndroidPermission`

-   :fontawesome-brands-windows:{ .windows } :fontawesome-brands-android:{ .android } __MediaPipe4UPremium__

    ---

    高级功能的基础插件，包含授权、GPU、远程传输、编辑器和文件功能模块。

    依赖：`MediaPipe4U`、`OSC`

-   :fontawesome-brands-windows:{ .windows } __GStreamer__

    ---

    这是 GStreamer 程序在 Unreal Engine 中的包装，可以让你在 Unreal Engine 中使用 GStreamer。

    依赖：`无`

-   :fontawesome-brands-windows:{ .windows } :fontawesome-brands-android:{ .android } __MediaPipe4UMotion__

    ---

    包含动作捕捉功能，也包含表情捕捉的基础接口。

    依赖：`MediaPipe4U`、`MediaPipe4UPremium`、`IKRig`、`ControlRig`

-   :fontawesome-brands-windows:{ .windows } :fontawesome-brands-android:{ .android } __MediaPipe4ULiveLink__

    ---

    包含表情捕捉功能和 Live Link 数据源。

    依赖：`MediaPipe4U`、`MediaPipe4UPremium`、`MediaPipe4UMotion`、`OSC`

-   :fontawesome-brands-windows:{ .windows } __MediaPipe4UGStreamer__

    ---

    提供 GStreamer 图像源，用于从视频中获取动作捕捉和表情捕捉的输入。

    依赖：`GStreamer`、`MediaPipe4U`、`MediaPipe4UPremium`、`MediaPipe4UMotion`

-   :fontawesome-brands-windows:{ .windows } __MediaPipe4UBVH__

    ---

    将动作捕捉数据导出为 BVH。

    依赖：`MediaPipe4U`、`MediaPipe4UMotion`

-   :fontawesome-brands-windows:{ .windows } __MediaPipe4UNvAR__

    ---

    提供 Nvidia Maxine AR 表情捕捉方案，需要 Nvidia RTX 20 系列或更高版本 GPU，并且开发和部署环境都需要安装 Nvidia AR SDK。

    依赖：`MediaPipe4U`、`MediaPipe4UPremium`、`MediaPipe4ULiveLink`、`OpenCV`

-   :fontawesome-brands-windows:{ .windows } __MediaPipe4USpeech__

    ---

    包含 TTS、ASR 和语音相关基础功能，提供文本与语音之间的双向转换能力。

    依赖：`MediaPipe4U`、`MediaPipe4UPremium`、`AudioCapture`

-   :fontawesome-brands-windows:{ .windows } __MediaPipe4ULLM__

    ---

    包含大语言模型（LLM）推理功能。

    依赖：`MediaPipe4U`、`MediaPipe4UPremium`

-   :fontawesome-brands-windows:{ .windows } __MediaPipe4ULLMSpeech__

    ---

    整合 LLM 与语音功能，可用于实现基于大语言模型的语音聊天机器人。

    依赖：`MediaPipe4U`、`MediaPipe4UPremium`、`MediaPipe4ULLM`、`MediaPipe4USpeech`

</div>

上面列出了当前发布包中的所有 Unreal Engine 插件。包含一个插件时，还应包含其依赖的插件；`OpenCV`、`OSC`、`IKRig`、`ControlRig` 和 `AudioCapture` 等依赖也必须可用。

!!! tip

    你还应该注意这些插件的跨平台支持。图标显示了插件支持的平台；打包 Android 平台时，只能包含支持 Android 的插件及其依赖。
