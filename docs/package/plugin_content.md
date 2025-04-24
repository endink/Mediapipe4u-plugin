# 插件内容和依赖关系

开始打包部署之前你有必要了解整个 `MediaPipe4U` 包含的内容，`MediaPipe4U` 包含多个 Unreal Engine 插件，
你应该按需选择插件进行打包以缩减最终程序的体积。


<div class="grid cards" markdown>

-   __`MediaPipe4U`__

    ---

    MediaPipe4U 最基础的插件，它包含了 OpenCV\MediaPipe\DirectML 等基础框架和
    MediaPipe4U 的公共代码（如图像源：摄像头源，静态图源）。 除了 `GStreamer`插件，MediaPipe4U 的其他所有插件都依赖它。   

    依赖：无

    :fontawesome-brands-windows:{ .windows }  :fontawesome-brands-android:{ .android }

-   __GStreamer__

    ---

    这是 GStreamer 程序在 Unreal Engine 中的包装，可以让你在 Unreal Engine 中使用 GStreamer 。    

    依赖：无

    :fontawesome-brands-windows:{ .windows }

-   __MediaPipe4UMotion__

    ---

    包含动作捕捉功能，也包含表情捕捉的基础接口。   

    依赖： 
     
    - MediaPipe4U

    :fontawesome-brands-windows:{ .windows }  :fontawesome-brands-android:{ .android }

-   __MediaPipe4ULiveLink__

    ---

    包含表情捕捉功能和 LiveLink 发生器。   

    依赖：   

    - MediaPipe4U
    - MediaPipe4UMotion

    :fontawesome-brands-windows:{ .windows }  :fontawesome-brands-android:{ .android }

-   __MediaPipe4UGStreamer__

    ---

    为提供 GStreameImageSource 实现，依赖 `GStreamer` 插件。   

    依赖：

    - MediaPipe4U
    - GStreamer

    :fontawesome-brands-windows:{ .windows }

-   __MediaPipe4UBVH__

    ---

    将动作捕捉的数据导出为 BVH。   

    依赖：

    - MediaPipe4U
    - MediaPipe4UMotion

    :fontawesome-brands-windows:{ .windows }  :fontawesome-brands-android:{ .android }

-   __MediaPipe4UNvAR__

    ---

    提供表情捕捉和动作捕捉的 Nvidia Maxine AR 算法， 需要 **Nvidia GPU 20XX** 及以上支持。
    使用 MediaPipe4UNvAR 需要本地安装 Nvidia AR SDK （无论开发环境还是最终部署环境**都需要**安装）。   

    依赖：

    - MediaPipe4U
    - MediaPipe4ULiveLink

    :fontawesome-brands-windows:{ .windows }

-   __MediaPipe4USpeech__

    ---

    包含 TTS 和 ASR 功能，提供文本和语音之间双向转换能力。   

    依赖：

    - MediaPipe4U

    :fontawesome-brands-windows:{ .windows }

-   __MediaPipe4ULLM__

    ---

    包含大语言模型 （LLM）推理功能，能够使用文本和大预言模型对话。

    依赖：

    - MediaPipe4U

    :fontawesome-brands-windows:{ .windows }

-   __MediaPipe4ULLMSpeech__

    ---

    整合了 `MediaPipe4USpeech` 和 `MediaPipe4ULLMSpeech` 能够方便的实现基于大语言模型 （LLM）的语音聊天机器人。   

    依赖：

    - MediaPipe4U
    - MediaPipe4USpeech
    - MediaPipe4ULLM

    :fontawesome-brands-windows:{ .windows }



</div>


上面是 `MediaPipe4U` 提供的所有 Unreal Engine 插件，你可以根据功能需要选择需要打包的插件。
注意插件间的依赖关系，当你包含一个插件时，你还应该**包含**它依赖的插件。   

!!! tip

    你还应该注意这些插件的跨平台支持（下方的图标显示了它们支持的平台），当你打包 Android 平台时，只能包含支持 Android 的插件。

