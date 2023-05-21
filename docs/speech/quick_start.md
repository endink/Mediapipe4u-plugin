---
layout: default
nav_order: 2
title: 快速入门
parent: 语音套件
---

## 快速入门

此文档描述如何快速使用 MediaPipe4USpeech 插件完成 TTS 和驱动虚拟角色（数字化身）的口型同步。  
快速使用 MediaPipe4U 的语音套件，只需要几个简单步骤：

1. 下载语音模型
2. 准备动画资产
3. 创建 MediaPipeSpeechActor 组件
4. 添加动画蓝图节点
5. 运行程序

{: .important}
> 语音套件是一个商业授权功能，只有 Ultimate 版本中包含此功能。   
> 免费授权版本仅能够在 Ureal Editor 中使用它

下面，详细介绍这些步骤的操作方法。

### 下载语音模型

从 [https://github.com/endink/Mediapipe4u-plugin/releases](https://github.com/endink/Mediapipe4u-plugin/releases) 页面中找到 SpeechModels， 下载对应语言的模型包。

### 准备动画资产

制作一个 PoseAsset， 包含 15 个音素曲线（这里我将他命名为 **Pose_LipSync**）。

[![speech](./images/qs_pose_asset.jpg "speech")](./images/qs_pose_asset.jpg)

> SIL 为自然状态下的面容。   
> 音素表情请参考[Lipsync文档](./lipsync.md)或[OVRLipSync文档](https://developer.oculus.com/documentation/unreal/audio-ovrlipsync-viseme-reference)


### 创建 MediaPipeSpeechActor 组件

向场景中添加一个 MediaPipeSpeechActor 组件。

[![speech](./images/qs_outline_speech_actor.jpg "speech")](./images/qs_outline_speech_actor.jpg)

### 添加动画蓝图节点

在动画蓝图中添加 **MediaPipe LipSync** 节点和 Evalute Pose 节点。

[![speech](./images/qs_outline_speech_actor.jpg "speech")](./images/qs_outline_speech_actor.jpg)

### 运行程序

运行程序，如果你在编辑器中运行，可以通过 Speech 编辑工具快速测试语音效果。

[![speech](./images/qs_speech_tools.jpg "speech")](./images/qs_speech_tools.jpg)

## 蓝图函数

在蓝图中使用 **MediaPipe4USpeech** 的 **SpeakText** 函数，可以进行文本朗读。

[![speech](./images/qs_bp_speck_text.jpg "speech")](./images/qs_bp_speck_text.jpg)


在蓝图中使用 **MediaPipe4USpeech** 的 **StopSpeak** 函数，可以停止朗读。

[![speech](./images/qs_bp_speck_text.jpg "speech")](./images/qs_bp_speck_text.jpg)