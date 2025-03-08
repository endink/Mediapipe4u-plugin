---
hide:
  - navigation
  - toc
---

# Frequently Asked Questions (FAQ)

This section summarizes some of the most frequently asked questions from users. If you encounter any issues, please check here for answers first.  

---

## Why do image-based and camera-based motion capture work correctly, but video-based motion capture does not?

**MediaPipe4U**'s video-based motion capture relies on **GStreamer** to process video frames. You should install **GStreamer** first.  
> For GStreamer installation, please refer to the [Installing GStreamer](../Install/gstreamer.md) section.

---

## Character body jittering severely

Vision-based motion capture depends on the camera feed. The fewer noise artifacts in the image (unrelated to camera resolution), the more stable the motion capture will be. Several factors can influence the recognition performance. Please follow these recommendations to achieve the best results:

- Ensure sufficient lighting in your camera environment. The best lighting conditions are during the day or under bright ceiling lights at night. A poor example would be a dimly lit room with only a single desk lamp, which produces significant noise.
- Wear tight-fitting clothing as loose clothing can cause frequent changes in detected joint positions.
- Choose clothing colors that contrast with your background (it does not have to be a solid-color background, but the primary tones should differ). For example, if your background is light-colored, wear dark-colored clothing.
- When performing upper-body motion capture, face the camera directly whenever possible.

## Why does my body or arms not move, or sometimes snap back to the initial pose?

This issue may be due to low joint confidence scores in the camera feed. The MediaPipe algorithm assigns a confidence (visibility) score to detected joints.  
You can adjust **MinPoseScoreThresh** in **MediaPipeAnimInstance** to **0**, which will force all joint data to be trusted regardless of their visibility.

## LNK2019 error during packaging

This error occurs when the linker cannot find the required `.lib` files. There are two possible reasons:

1. A **Clean** operation was performed during compilation. Since this is a precompiled plugin, **Clean** removes the precompiled `.lib` files. To resolve this, re-download the plugin and copy it to the `Plugins` directory.
2. You are using the GStreamer plugin but have not installed the GStreamer SDK. The project may compile successfully because the `.obj` files are already built, but packaging requires linking to GStreamer headers, which causes the error.  
   > If you do not need video-based motion capture, you can remove the GStreamer-related plugins from your project.

## How can I select the correct camera if my computer has multiple cameras?

The **deviceId** parameter of the **StartCamera** function in **MediaPipeHolisticComponent** represents the camera index on your computer, starting from `0`.  
Typically, the first camera is `0`, the second is `1`, and so on.  
> You can use the **ListWebcams** function in **UMediaPipeUtils** to list available camera names, allowing you to use a camera name instead of an index.

---

## Significant delay between character motion and video feed

1. The ideal frame rate for MediaPipe calculations is 30 FPS. If you experience significant delays, your CPU may not be fast enough. Lowering the video resolution can improve the MediaPipe FPS.  
   High resolutions do not enhance accuracy but instead reduce performance. A resolution of `600x400` is sufficient for smooth operation.  
   > For camera-based motion capture, the **StartCamera** function in **MediaPipeHolisticComponent** allows adjusting resolution via the **ResolutionX** and **ResolutionY** parameters.  
   > Additionally, the **FPS** parameter should not exceed 30, as a higher resolution will not improve performance in most cases.

2. Besides reducing video or camera resolution, if your video contains fast movements (e.g., breakdancing), you can also reduce motion smoothing to improve animation responsiveness.  
   (For details, refer to [Runtime Control -> Adjusting Smoothing](../mocap//advance/solver_bp.md).)

---

## How to drive a Metahuman skeleton when the head and body are separate?

**Metahuman** characters have separate head and body meshes for specific functionalities (e.g., mesh conversion).  
However, when properly configured according to the official documentation, you only need to drive the **body** mesh when using **MediaPipe4U**.  
For more information on enabling runtime animation for Metahumans, refer to the Unreal Engine documentation:  
[Retargeting Animations to a Metahuman at Runtime](https://docs.metahuman.unrealengine.com/zh-CN/retargeting-animations-to-a-metahuman-at-runtime)

---

## My computer does not have a camera. Can I use my phone camera instead?

Yes, you can use third-party software to turn your phone into a webcam, such as iVCam (https://www.e2esoft.cn/).  
However, these applications typically require a high-quality Wi-Fi connection as they transmit video via Wi-Fi.

---

## Why can't I capture video from the OBS Virtual Camera?

OBS's built-in virtual camera is not fully compatible with DirectShow capture. However, a plugin has been developed to address this issue.  
If you need to capture video from OBS, use the following OBS Virtual Camera plugin:  
[OBS Virtual Cam](https://github.com/Avasam/obs-virtual-cam/releases)  

> For more details on OBS virtual camera compatibility issues, refer to this issue:  
> [https://github.com/obsproject/obs-studio/issues/3635](https://github.com/obsproject/obs-studio/issues/3635)

---

## How to choose a good camera?

Finding a high-quality camera can be difficult. For **MediaPipe4U**, image quality is not the most critical factor since the system works well at low resolutions.  
However, many cameras are not optimized for fast motion and may introduce motion blur, which is **detrimental** to **MediaPipe4U** performance.  
If you are unfamiliar with camera specifications, choosing a good camera can be challenging.  

Rather than focusing on resolution, you should prioritize **shutter speed** over image quality.
