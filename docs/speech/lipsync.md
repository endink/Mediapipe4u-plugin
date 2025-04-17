# 口型同步(Lip Sync)

MediaPipe4USpeech 通过集成 `OVRLipSync` 组件，提供声音和口型同步的能力。   

!!! warning
    OVRLipSync 库中包单独 Facebook(Meta) License 文件，请严格遵守这些条款。   
            
    MediaPipe4U 依据 [Meta Platforms Technologies SDK License](https://developer.oculus.com/licenses/oculussdk/) 协议 1.1.1 内容分发 OVRLipSync 中的库，并且已在插件中包含单独的 License 文件。   
    
    > 1.1.1 If the SDK includes any libraries,
    > sample source code, or other materials that we make available specifically for incorporation in your Application (as indicated by applicable documentation), 
    > you may incorporate those materials and reproduce and distribute them as part of your Application, including by distributing those materials to third parties contributing to your     Application.   
    >   
    > 对协议的理解如有不妥，请与我联系，我将迅速下架 LipSync 功能。



## 开启口型同步

在 `MediaPipeSpeechActor` 中打开口型同步

![Enable LipSync](./images/quick_start/speech_actor_enable_lipsync.jpg "Enable LipSync") 


## 制作口型动画资产(PoseAsset)   

`MediaPipe4U` 支持多种口型动画方案。   
你可以使用任何一种方案制作一个 PoseAsset 来包含这些曲线。

- `音素表情`：兼容音素口型的 **15** 种表情动画。
- `ARKit 表情`：兼容 ARKit 的 **52** 种表情动画。

> 默认使用 ARKit 方案，大多数的`数字人`或 `VTuber` 产品都兼容了 ARKit 表情，可能已经内置了符合 ARKit 标准的 PoseAsset。   
> 但是如果你想要更好的口型效果，使用 `ZBrush` 等工具制作音素（Viseme）曲线可能是更好的选择。

=== "音素（Viseme）表情方案"

    制作 15 个和 OVRLipSync 匹配的唇形动画，每一个唇形是一个 BlendShape 或者是 PoseAsset 中的一条曲线。   

    具体唇形参考请查看 [OVRLipSync 文档](https://developer.oculus.com/documentation/unity/audio-ovrlipsync-viseme-reference){: target='_blank'}     
    也可以参考此文档最后的附录（来自 Facebook 网站截图）。   
       
    Pose Asset 中的曲线名称或者 BlendShape 名称约定为： SIL、PP、FF、TH、DD、KK、CH、SS、NN、RR、AA、E、I、O、U (不区分大小写)  

== "ARKit 表情表情方案"

    制作 52 个和 Apple ARKit 匹配的表情动画，每一个表情是一个 BlendShape 或者是 PoseAsset 中的一条曲线。     

    具体表情参考请查看 [Apple 官方文档](https://developer.apple.com/documentation/arkit/arfaceanchor/blendshapelocation)   {: target='_blank'}    
    也可以这个网站： [https://arkit-face-blendshapes.com/](https://arkit-face-blendshapes.com/){: target='_blank'}。   
       
    Pose Asset 中的曲线名称或者 BlendShape 名称，遵循 Apple ARKit 的 **52** 个曲线名称标准（不区分大小写）。 


### LipSync 动画蓝图节点

在动画蓝图中添加 `MediaPipe LipSync` 节点，如果你使用 PoseAsset ，还需要添加 Evalute Pose 节点。

![lipsync anim](./images/lipsync/anim_blueprint.jpg "lipsync anim")

> 说明，上图中的 Pose_LipSync 是一个 Evalute Pose 节点。


### LipSync 节点属性

**Alpha**   
控制唇形的平滑程度，数值越小，唇形动画越平滑。

**WeightScale**   
控制口型动画的缩放，数值越大，角色开口会越明显，某些语音的音色识别效果不明显时，我们需要用这个属性让它更明显。

**MaxDelaySeconds**   
语音延迟时间，以秒为单位，当使用分段语音块时，如果收到的语音数据帧延迟高于这个时间，该帧将不再执行口型动画。

**CurveSolution**    
表情动画的曲线方案。

- `OculusViseme`: 表示使用音素曲线，要求你在 PoseAsset 种包含 **15** 条音素 (Visemes) 曲线。
- `ARKit`: 表示使用 ARKit 表情动画曲线，要求你在 PoseAsset 种包含 **52** 条 ARKit 表情曲线。

默认值: `ARKit`


**ApplyMode**   
口型动画的渲染方式。

- `WeightedMovingAverage`：口型动画不考虑当前姿势中的曲线值，仅平滑的向前移动。
- `Blend`：口型动画混合到当前姿势中的曲线值，这通常用于混合已有的曲线值。   

默认值： `WeightedMovingAverage`   

**VisemeCurveRetargetAsset**

音素曲线重定向资产，当你已经有 15 种音素的曲线，但是这些曲线名称和音素曲线要求的名称**不一致**时，你可以添加一个重定向资产来映射你自己的曲线名称到标准曲线名称。   
仅当 `CurveSolution` 值为 **OculusViseme** 有效。

**ARKitCurveRetargetAsset**

动画曲线重定向资产，当你已经有 52 种 **ARKit** 曲线，但是这些曲线名称和标准 ARKit 曲线要求的名称**不一致**时，你可以添加一个重定向资产来映射你自己的曲线名称到标准曲线名称。   
仅当 `CurveSolution` 值为 **ARKit** 有效。

默认值： `WeightedMovingAverage`   

**UseGlobalParameters**   
是否使用全局口型动画参数。开启它能够支持运行时动态调整口型动画。   
默认值：**true**

!!! warning

    全局参数设置会影响所有的 LipSync 动画蓝图节点。   
    当场景中有多个 LipSync 节点或多个动画蓝图都包含 LipSync 节时应该将 UseGlobalParameters 设为 false，

## 运行时设置口型动画

当动画蓝图节点启用了全局参数时（`UseGlobalParameters` 为 **true**），可以在蓝图中动态调整口型动画的参数。   
你可以在任意蓝图中调用 `SetGlobLipSyncParameters` 函数：

![Set Global Params](./images/lipsync/set_global_params.jpg "Set Global Params")

## 开始口型同步

完成以上操作后，当 TTS 开始朗读 (调用 `MediaPipeSpeechActor` 的 `SpeakTextAsync` 函数)，3D 角色就会根据朗读内容生成和文本一致的口型动画。

## 附录

### OVRLipSync 唇形

> 你也可以转到[Facebook 网站](https://developer.oculus.com/documentation/unity/audio-ovrlipsync-viseme-reference){: taget='_blank'}阅读详细信息。

![lipsync visemes](./images/lipsync/lip_sync_visemes.jpg "lipsync visemes")

### ARKit 曲线（BS）名称

-  1: *eyeBlinkLeft*,
-  2: *eyeLookDownLeft*,
-  3: *eyeLookInLeft*,
-  4: *eyeLookOutLeft*,
-  5: *eyeLookUpLeft*,
-  6: *eyeSquintLeft*,
-  7: *eyeWideLeft*,
-  8: *eyeBlinkRight*,
-  9: *eyeLookDownRight*,
-  10: *eyeLookInRight*,
-  11: *eyeLookOutRight*,
-  12: *eyeLookUpRight*,
-  13: *eyeSquintRight*,
-  14: *eyeWideRight*,
-  15: *jawForward*,
-  16: *jawLeft*,
-  17: *jawRight*,
-  18: *jawOpen*,
-  19: *mouthClose*,
-  20: *mouthFunnel*,
-  21: *mouthPucker*,
-  22: *mouthRight*,
-  23: *mouthLeft*,
-  24: *mouthSmileLeft*,
-  25: *mouthSmileRight*,
-  26: *mouthFrownRight*,
-  27: *mouthFrownLeft*,
-  28: *mouthDimpleLeft*,
-  29: *mouthDimpleRight*,
-  30: *mouthStretchLeft*,
-  31: *mouthStretchRight*,
-  32: *mouthRollLower*,
-  33: *mouthRollUpper*,
-  34: *mouthShrugLower*,
-  35: *mouthShrugUpper*,
-  36: *mouthPressLeft*,
-  37: *mouthPressRight*,
-  38: *mouthLowerDownLeft*,
-  39: *mouthLowerDownRight*,
-  40: *mouthUpperUpLeft*,
-  41: *mouthUpperUpRight*,
-  42: *browDownLeft*,
-  43: *browDownRight*,
-  44: *browInnerUp*,
-  45: *browOuterUpLeft*,
-  46: *browOuterUpRight*,
-  47: *cheekPuff*,
-  48: *cheekSquintLeft*,
-  49: *cheekSquintRight*,
-  50: *noseSneerLeft*,
-  51: *noseSneerRight*,
-  52: *tongueOut*