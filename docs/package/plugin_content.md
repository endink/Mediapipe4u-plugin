# 插件和依赖

本页列出当前发布包中的插件。插件目录与依赖关系以对应 `.uplugin` 文件为准；打包时请按需选择功能插件，并同时包含其直接依赖。

| 插件目录 | 用途 | `.uplugin` 中声明的直接依赖 |
|---|---|---|
| `MediaPipe4U` | MediaPipe4U 核心功能与基础图像源。 | `OpenCV`、`AndroidPermission` |
| `MediaPipe4UPremium` | 高级功能基础插件，包含授权、GPU、远程传输、编辑器和文件功能模块。 | `MediaPipe4U`、`OSC` |
| `MediaPipe4UMotion` | 动作捕捉功能。 | `MediaPipe4U`、`MediaPipe4UPremium`、`IKRig`、`ControlRig` |
| `MediaPipe4ULiveLink` | 表情捕捉和 Live Link 数据源。 | `MediaPipe4U`、`MediaPipe4UPremium`、`MediaPipe4UMotion`、`OSC` |
| `GStreamer` | Unreal Engine 的 GStreamer 集成。 | 无 |
| `MediaPipe4UGStreamer` | 基于 GStreamer 的图像源。 | `GStreamer`、`MediaPipe4U`、`MediaPipe4UPremium`、`MediaPipe4UMotion` |
| `MediaPipe4UBVH` | BVH 动画导出。 | `MediaPipe4U`、`MediaPipe4UMotion` |
| `MediaPipe4UNvAR` | Nvidia AR 表情捕捉方案。 | `MediaPipe4U`、`MediaPipe4UPremium`、`MediaPipe4ULiveLink`、`OpenCV` |
| `MediaPipe4USpeech` | 语音识别、语音合成和语音相关基础功能。 | `MediaPipe4U`、`MediaPipe4UPremium`、`AudioCapture` |
| `MediaPipe4ULLM` | 大语言模型推理功能。 | `MediaPipe4U`、`MediaPipe4UPremium` |
| `MediaPipe4ULLMSpeech` | LLM 与语音功能集成。 | `MediaPipe4U`、`MediaPipe4UPremium`、`MediaPipe4ULLM`、`MediaPipe4USpeech` |

!!! note

    表中的依赖包含 Unreal Engine 内置或外部插件，例如 `OpenCV`、`OSC`、`IKRig`、`ControlRig` 和 `AudioCapture`。启用某个功能插件时，也必须确保这些依赖可用。

!!! tip

    Windows 和 Android 的总体支持范围请参阅[环境要求](../install/requirement.md)。平台打包时只应启用目标平台可用的插件及其依赖。
