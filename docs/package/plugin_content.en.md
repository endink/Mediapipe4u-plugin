# Plugins and Dependencies

Before packaging and deployment, understand what is included in `MediaPipe4U`. `MediaPipe4U` includes several Unreal Engine plugins; select only the plugins you need to reduce the size of the final application.

<div class="grid cards" markdown>

-   :fontawesome-brands-windows:{ .windows } :fontawesome-brands-android:{ .android } __MediaPipe4U__

    ---

    The core MediaPipe4U plugin, containing shared code and base image sources.

    Dependencies: `OpenCV`, `AndroidPermission`

-   :fontawesome-brands-windows:{ .windows } :fontawesome-brands-android:{ .android } __MediaPipe4UPremium__

    ---

    The foundation for advanced features, including licensing, GPU, remoting, editor, and file modules.

    Dependencies: `MediaPipe4U`, `OSC`

-   :fontawesome-brands-windows:{ .windows } __GStreamer__

    ---

    A GStreamer wrapper for Unreal Engine that enables GStreamer in Unreal Engine.

    Dependencies: None

-   :fontawesome-brands-windows:{ .windows } :fontawesome-brands-android:{ .android } __MediaPipe4UMotion__

    ---

    Provides motion-capture features and the base interfaces for facial-expression capture.

    Dependencies: `MediaPipe4U`, `MediaPipe4UPremium`, `IKRig`, `ControlRig`

-   :fontawesome-brands-windows:{ .windows } :fontawesome-brands-android:{ .android } __MediaPipe4ULiveLink__

    ---

    Provides facial-expression capture and a Live Link source.

    Dependencies: `MediaPipe4U`, `MediaPipe4UPremium`, `MediaPipe4UMotion`, `OSC`

-   :fontawesome-brands-windows:{ .windows } __MediaPipe4UGStreamer__

    ---

    Provides a GStreamer image source for video-based motion and facial-expression capture input.

    Dependencies: `GStreamer`, `MediaPipe4U`, `MediaPipe4UPremium`, `MediaPipe4UMotion`

-   :fontawesome-brands-windows:{ .windows } __MediaPipe4UBVH__

    ---

    Exports motion-capture data as BVH.

    Dependencies: `MediaPipe4U`, `MediaPipe4UMotion`

-   :fontawesome-brands-windows:{ .windows } __MediaPipe4UNvAR__

    ---

    Provides the Nvidia Maxine AR facial-expression capture solution. It requires an Nvidia RTX 20-series or newer GPU, and the Nvidia AR SDK must be installed in both development and deployment environments.

    Dependencies: `MediaPipe4U`, `MediaPipe4UPremium`, `MediaPipe4ULiveLink`, `OpenCV`

-   :fontawesome-brands-windows:{ .windows } __MediaPipe4USpeech__

    ---

    Provides TTS, ASR, and shared speech features for converting between text and speech.

    Dependencies: `MediaPipe4U`, `MediaPipe4UPremium`, `AudioCapture`

-   :fontawesome-brands-windows:{ .windows } __MediaPipe4ULLM__

    ---

    Provides large language model (LLM) inference.

    Dependencies: `MediaPipe4U`, `MediaPipe4UPremium`

-   :fontawesome-brands-windows:{ .windows } __MediaPipe4ULLMSpeech__

    ---

    Integrates LLM and speech features for building voice chatbots powered by large language models.

    Dependencies: `MediaPipe4U`, `MediaPipe4UPremium`, `MediaPipe4ULLM`, `MediaPipe4USpeech`

</div>

The cards above list every Unreal Engine plugin in the current release package. When including a plugin, also include its dependencies; dependencies such as `OpenCV`, `OSC`, `IKRig`, `ControlRig`, and `AudioCapture` must also be available.

!!! tip

    Pay attention to cross-platform support. The icons show the platforms supported by each plugin; when packaging for Android, include only Android-supported plugins and their dependencies.
