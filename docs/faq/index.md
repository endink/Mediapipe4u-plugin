---
layout: default
nav_order: 50
title: 常见问题
has_children: false
---

# 常见问题

这里我总结了一些用户经常咨询的问题，如果你遇到问题，可以先在这里找到答案。   

---    


## 为什么图片动补和摄像头动补可以正常工作，视频动补不正常。

**MediaPipe4U** 的视频动补依赖 **GStreamer** 处理视频帧，你应该先安装 **GStreamer**。
> GStreamer 安装可以参考 [安装GStreamer](../Install/gstreamer.md) 小节的文档。


---    

## 角色身体抖动厉害

视觉动补依赖摄像头画面，越少的画面噪点（和摄像头分辨无关），动补越稳定，有很多的因素会影响到识别效果，请尽量做到以下几点，以便达到最佳识别效果：

- 保证你的摄像头环境光线充足，最好是白天，或者夜晚有明亮的顶灯照明。一个反面的例子，深夜只有侧面一盏台灯，无其他光源，这种场景噪点就比较多。
- 尽量穿着紧身的服装，蓬松的服装容易造成识别到的关节位置频繁变化。
- 尽量让你的衣服颜色和你的背景（不要求纯色背景，背景主体色调）分明，例如你是浅色的背景就穿着深色的衣服
- 半身动补时，尽可能人正对摄像头

## 为什么我的身体或者手臂不能动，或者有时候会回弹到初始姿态？

这可能是由于摄像头中的关节点可信度（评分）很低，MediaPipe 算法中的关节点数据有可信度（可见度）的概念，你可以调整 **MediaPipeAnimInstance** 的 **MinPoseScoreThresh** 为 **0** 。这样，不论关节是否可以见，都信任关节点数据。

## 打包时候出现 LNK2019 错误

这是由于找不到 .lib 链接文件，这个原因有两种：
1. 在编译过程中执行过 Clean，这是预编译插件， Clean 会删除预先编译好的 lib 文件，这种问题你重新下载插件复制到 Plugins 目录即可解决。
2. 你使用了 GStreamer 插件，但是没有安装 SDK， 运行时候由于已经编译好 obj，所以不会出问题，但是打包时候需要 Link Gstreamer 相关的头，所以会出现错误，安装 GStreamer SDK 即可解决。
> 如果你不需要视频动补，你可以不使用 GStreamer 相关的插件，从项目中移除即可


## 我的电脑有多个摄像头时如何选择正确的摄像头？

**MediaPipeHolisticComponent**组件的**StartCamera**函数参数 **deviceId** 代表了你电脑上的摄像头编号，从 0 开始，通常一个摄像头是 0， 第二个是 1，以此类推。
> 你可以通过 **UMediaPipeUtils**的**ListWebcams**函数列出摄像头名称，进而使用名称来代替数字索引。

---   

## 角色的动作和视频之间延迟严重    
1. Mediapipe 计算的帧率理想情况下可以达到 30FPS，如果你延迟较多，可能是由于 CPU 计算速度不够，你可以通过降低视频分辨率来提升 MediaPipe 的 FPS，高分辨率并不会带来更好的效果，反而会降低性能，视频分辨率600 * 400 即可让 MediapPipe 运行良好。
> 对于摄像头动补， **MediaPipeHolisticComponent**的 **StartCamera** 函数支持通过传入 **ResolutionX** 和 **ResolutionY** 参数来调节分辨率，同时 **StartCamera** 函数中的 **FPS** 参数请不要高于 30,摄像头过高的分辨率在一般情况下都没有意义，因为 MediaPipe 的 FPS 并不会很高。   

2. 除了降低视频或摄像头分辨率，如果你视频中的动作较快（例如街舞），你还可以通过降低动补平滑度（具体参考[运行时控制->修改平滑](../mocap//advance/solver_bp.md)小节）来改善动画效果。

---

## Metahuman 的骨架头部和身体分离如何驱动？     

**Metahuman** 出于自身功能需要（例如转网格体功能）头部和身体是不同的网格体，但是，你按照官方文档制作可以驱动的 Character，使用 **MediaPipe4U** 驱动时只需要驱动 body 部分即可。   
关于如何让 Metahuman 支持运行时动画，参考 UnrealEngine 的文档：    
https://docs.metahuman.unrealengine.com/zh-CN/retargeting-animations-to-a-metahuman-at-runtime   

---

## 我的电脑没有摄像头，我可以使用手机摄像头吗？     

你可以通过一些第三方软件将手机模拟成电脑摄像头，例如 iVCam (https://www.e2esoft.cn/), 但是这类软件通常要求你在高质量的 WIFI 环境下使用，因为它们通常通过 WIFI 来传输摄像头图像。

---

## 为什么无法从 OBS 虚拟摄像头采集视频？   
OBS 自带的虚拟摄像头不能很好的兼容 DirectShow 采集，但是已经有人写了插件解决了这个问题，如果你要采集 OBS 画面，可以使用这个 OBS 虚拟摄像头插件:      
[OBS Virtual Cam](https://github.com/Avasam/obs-virtual-cam/releases)

> 关于 OBS 虚拟摄像头的无法识别问题，具体可以看这个 issue ：   
> [https://github.com/obsproject/obs-studio/issues/3635](https://github.com/obsproject/obs-studio/issues/3635)

---

## 如何选择一个好的摄像头？

要买到一个好的摄像头，很难。对于 **MediaPipe4U** 来说画质并不是太重要，**MediaPipe4U** 可以在很低的分辨率下工作良好， 许多摄像头并不能适应快速运动，它们很容易在录像时产生运动模糊，这对于 **MediaPipe4U** 来说是致命的，不了解摄像头的人很难买到一个好的摄像头，我这里不想为摄像头厂商做广告，你选择摄像头时应该重点关注快门速度而不是画质。
