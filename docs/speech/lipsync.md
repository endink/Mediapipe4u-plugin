# 使用口型同步(Lip Sync)

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


## 制作口型动画资产   

制作 15 个和 OVRLipSync 匹配的唇形动画，每一个唇形可以是一个 BlendShape 或者是 PoseAsset 中的一条曲线。   
> 具体唇形参考请查看 [OVRLipSync 文档](https://developer.oculus.com/documentation/unity/audio-ovrlipsync-viseme-reference)   
> 也可以参考此文档最后的附录（来自 Facebook 网站截图）。   
>    
> Pose Asset 中的曲线名称, 或者 BlendShape 名称约定为： SIL、PP、FF、TH、DD、KK、CH、SS、NN、RR、AA、E、I、O、U   


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
语音延迟时间，以秒为单位，当使用分段语音块时，如果收到的语音高于这个时间，将不在执行口型动画。

**ApplyMode**   
口型动画的渲染方式。
- WeightedMovingAverage：口型动画不考虑当前姿势中的曲线值，仅平滑的向前移动。
- Blend：口型动画混合到当前姿势中的曲线值，这通常用于混合已有的音素曲线值。   

默认值： **WeightedMovingAverage**   

**UseGlobalParameters**   
是否使用全局口型动画参数。开启它能够支持运行时动态调整口型动画。   
默认值：**true**

!!! warning

    全局参数设置会影响所有的 LipSync 动画蓝图节点。   
    当场景中有多个 LipSync 节点或多个动画蓝图都包含 LipSync 节时应该将 UseGlobalParameters 设为 false，

## 运行时设置口型动画

当动画蓝图节点启用了全局参数时（`UseGlobalParameters` 为 **true**），可以在蓝图中动态调整口型动画的参数。   
你可以在任意蓝图中调用 `SetGlobLipSyncParameters` 函数：

![Set Global Params](./images/lipsync/set_global_params.jpg.jpg "Set Global Params")

## 开始口型同步

完成以上操作后，当 TTS 开始朗读 (调用 `MediaPipeSpeechActor` 的 `SpeakTextAsync` 函数)，3D 角色就会根据朗读内容生成和文本一致的口型动画。

## 附录

下面是 OVRLipSync 唇形参考，你可以转到[Facebook 网站](https://developer.oculus.com/documentation/unity/audio-ovrlipsync-viseme-reference){: taget='_blank'}阅读详细信息。

![lipsync visemes](./images/lipsync/lip_sync_visemes.jpg "lipsync visemes")