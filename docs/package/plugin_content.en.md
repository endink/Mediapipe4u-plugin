# Plugins and Dependencies

Before packaging and deployment, understand the contents of `MediaPipe4U`. It contains multiple Unreal Engine plugins,
and you should package only the plugins you need to reduce the final application size.


<div class="grid cards" markdown>

-   :fontawesome-brands-windows:{ .windows }  :fontawesome-brands-android:{ .android } __MediaPipe4U__

    ---

    The basic MediaPipe4U plugin and core functionality. Except for `GStreamer`, all other MediaPipe4U plugins depend on it.   

    Dependencies: `None`

-   :fontawesome-brands-windows:{ .windows } __GStreamer__

    ---

    A wrapper for GStreamer in Unreal Engine that enables GStreamer use from Unreal Engine.    

    Dependencies: `None`

-   :fontawesome-brands-windows:{ .windows }  :fontawesome-brands-android:{ .android } __MediaPipe4UMotion__

    ---

    Provides motion capture and the foundational interfaces for facial-expression capture.   

    Dependencies: 
     
    - `MediaPipe4U`

-   :fontawesome-brands-windows:{ .windows }  :fontawesome-brands-android:{ .android } __MediaPipe4ULiveLink__

    ---

    Provides facial-expression capture and a LiveLink source.   

    Dependencies:   

    - `MediaPipe4U`
    - `MediaPipe4UMotion`
  
-   :fontawesome-brands-windows:{ .windows } __MediaPipe4UGStreamer__

    ---

    Provides the GStreameImageSource implementation and depends on the `GStreamer` plugin.   

    Dependencies:

    - `MediaPipe4U`
    - `GStreamer`

-   :fontawesome-brands-windows:{ .windows }  :fontawesome-brands-android:{ .android } __MediaPipe4UBVH__

    ---

    Exports motion-capture data as BVH.   

    Dependencies:

    - `MediaPipe4U`
    - `MediaPipe4UMotion`

-   :fontawesome-brands-windows:{ .windows } __MediaPipe4UNvAR__

    ---

    Provides Nvidia Maxine AR algorithms for facial-expression and motion capture. Requires an **Nvidia 20XX GPU** or newer.
    MediaPipe4UNvAR requires the Nvidia AR SDK to be installed locally in both the development and final deployment environments.   

    Dependencies:

    - `MediaPipe4U`
    - `MediaPipe4ULiveLink`
    
-   :fontawesome-brands-windows:{ .windows } __MediaPipe4USpeech__

    ---

    Provides TTS and ASR for bidirectional conversion between text and speech.   

    Dependencies:

    - `MediaPipe4U`

-   :fontawesome-brands-windows:{ .windows } __MediaPipe4ULLM__

    ---

    Provides large language model (LLM) inference for text conversations with large language models.

    Dependencies:

    - `MediaPipe4U`

-  :fontawesome-brands-windows:{ .windows }  __MediaPipe4ULLMSpeech__

    ---

    Integrates `MediaPipe4USpeech` and `MediaPipe4ULLMSpeech` to simplify building voice chatbots based on large language models (LLMs).   

    Dependencies:

    - `MediaPipe4U`
    - `MediaPipe4USpeech`
    - `MediaPipe4ULLM`

</div>


The above list contains all Unreal Engine plugins provided by `MediaPipe4U`. Select the plugins to package based on the features you need.
Observe plugin dependencies: when including a plugin, also **include** the plugins it depends on.   

!!! tip

    Also consider cross-platform support (the icons above show supported platforms). Android packages can include only plugins that support Android.
