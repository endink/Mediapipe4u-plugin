# Plugins and Dependencies

This page lists the plugins in the current release package. Plugin directories and dependencies are defined by their `.uplugin` files. When packaging, select only the feature plugins you need and include their direct dependencies.

| Plugin directory | Purpose | Direct dependencies declared in `.uplugin` |
|---|---|---|
| `MediaPipe4U` | MediaPipe4U core features and base image sources. | `OpenCV`, `AndroidPermission` |
| `MediaPipe4UPremium` | Foundation for advanced features, including licensing, GPU, remoting, editor, and file modules. | `MediaPipe4U`, `OSC` |
| `MediaPipe4UMotion` | Motion-capture features. | `MediaPipe4U`, `MediaPipe4UPremium`, `IKRig`, `ControlRig` |
| `MediaPipe4ULiveLink` | Facial-expression capture and a Live Link source. | `MediaPipe4U`, `MediaPipe4UPremium`, `MediaPipe4UMotion`, `OSC` |
| `GStreamer` | GStreamer integration for Unreal Engine. | None |
| `MediaPipe4UGStreamer` | GStreamer-based image source. | `GStreamer`, `MediaPipe4U`, `MediaPipe4UPremium`, `MediaPipe4UMotion` |
| `MediaPipe4UBVH` | BVH animation export. | `MediaPipe4U`, `MediaPipe4UMotion` |
| `MediaPipe4UNvAR` | Nvidia AR facial-expression capture solution. | `MediaPipe4U`, `MediaPipe4UPremium`, `MediaPipe4ULiveLink`, `OpenCV` |
| `MediaPipe4USpeech` | Speech recognition, text-to-speech, and shared speech features. | `MediaPipe4U`, `MediaPipe4UPremium`, `AudioCapture` |
| `MediaPipe4ULLM` | Large language model inference. | `MediaPipe4U`, `MediaPipe4UPremium` |
| `MediaPipe4ULLMSpeech` | LLM and speech integration. | `MediaPipe4U`, `MediaPipe4UPremium`, `MediaPipe4ULLM`, `MediaPipe4USpeech` |

!!! note

    Dependencies include built-in or external Unreal Engine plugins such as `OpenCV`, `OSC`, `IKRig`, `ControlRig`, and `AudioCapture`. When enabling a feature plugin, ensure that these dependencies are also available.

!!! tip

    For overall Windows and Android support, see [Environment Requirements](../install/requirement.en.md). When packaging for a platform, enable only the plugins and dependencies available on that target platform.
