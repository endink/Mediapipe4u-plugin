---
layout: default
title: 表情捕捉
parent: 核心功能
nav_order: 30
---

# 表情捕捉

MediaPipe4U 在一个独立的插件中包含的表情捕捉功能，该插件使用一个独立的 Actor（AActor Class）来完成从图像源（ImageSource）中求解 BlendShape 的功能。   

[![FaceLink](./images/live_link_cover.jpg "FaceLink")](./images/live_link_cover.jpg)


{: .highlight }
> 如果你在 Apple 设备上用过 Epic 的 Live Link Face App ，你可以把这个 Actor 看做 Live Link Face App 的模拟，它从图像源中求解兼容 Apple Arkit 标准的 51 个表情 (tongueOut 不支持)，并通过
和 Live Link Face App 一致的 Live Link 格式数据发送数据，因此你可以像使用 Apple 上的 Live Link Face App 一样使用它。虽然它还不具备 Live Link Face App 的某些功能，例如，
数据录制，头部算解等，但是，随着MediaPipe4U 持续的开发，这些功能将会集成到这个 Actor 中。


---   

## 安装

1. 启用 Epic 的 Live Link 插件
2. 复制 MediaPipe4ULiveLink 文件夹到项目的 Plugins 目录。
3. 在项目中启用 **MediaPipe Live Link** 插件。
4. 在插件 C++ 目录中找到 **MediaPipeFaceLinkActor**, 将它拖放到你的 Level 中。
5. 选中 **MediaPipeFaceLinkActor**，在细节面板中对节点进行配置。
   
[![FaceLink Setup](./images/live_link_actor_setup.jpg "FaceLink Setup")](./images/live_link_actor_setup.jpg)

当 MediaPipe 动作捕捉开始后（ MediaPipeHolisticComponent 组件 Start 之后），会自动开始表情捕捉，并且向 LiveLink 接收端（通常是你的 LiveLinkPose 动画蓝图节点）发送数据。

---   

## 属性

FaceLinkActor 属性很少，就像 Live Link Face App 一样，表情捕捉本身也不需要太多参数，一般情况下使用默认值即可。

[![FaceLink properties](./images/live_link_actor_detals.jpg "FaceLink properties")](./images/live_link_actor_detals.jpg)

**FaceSolution**    
FaceLinkActor 可以支持在多种 BlendShape (BS) 求解算法中切换，这里把算法当作算解器使用的"方案（solution）"。
默认使用 MediaPipe 方案，因为它不依赖任何硬件，有着良好的适用性。FaceSolution 表示使用的方案名称。   

支持的 FaceSolution 名称:
- MediaPipe
- NvAR (需要 MediaPipe4U NvAR 插件)

{: important}
> 当 MediaPipe4U 动作捕捉开始以后，虽然你可以设置 FaceSolution，但是它并不会生效，必须停止动作捕捉再启动才能切换方案。简单来说，FaceSolution 不能 mediapipe 运行过程中切换。
   
**AllowSolutionDegradation**   
是否允许方案（solution）降级回退，当 FaceSolution 设置为一个不存在的方案名称时候，如果 bAllowSolutionDegradation 属性设置未 **true**，将会回退到 MediaPipe 方案，
如果 bAllowSolutionDegradation 为 **false**，表情求解器将启动失败，并在日志中打印错误。
   
**LiveLinkSubjectName**    
用来指定 LiveLink 发送数据的 Subject 名称，如果你在动画蓝图中使用 LiveLinkPose 节点，这里的名称应该和 LiveLinkPose 节点上的 Subject 属性一致，以便动画蓝图节点可以从 MediaPipe4U 接收数据。   
默认值: **MediaPipe4U**   
   
**SmoothParams**    
指定表情的各个区域的平滑程度，和设置平滑算法的参数，关于这个参数的详细信息，下文进行详细说明。   
   
**SmoothEnabled**    
有的时候，可能你希望使用自己的平滑算法，这个开关用来开启/关闭插件内置的平滑算法。   

**PublishHeadRotation**   
是否启用头部旋转求解，如果为 true ，会额外传递三个曲线到 LiveLink, 它们分别是 **HeadPitch**, **HeadRoll**, **HeadYaw**。

{: .warning}
> 并不是所有的方案（Face Solution）都支持头部旋转求解，你的程序应该考虑不同方案对头部旋转的支持会不同。

**Disabled**  
是否禁用 MediaPipe4U 的 BS 求解，当设置为 **true**，将不会再发送 LiveLink 数据。
   
---   

## 平滑   

MediaPipeFaceLinkActor 可以按面容的不同区域来平滑表情，主要通过 **SmoothParams** 属性来进行设置。   

{: highlight}
> SmoothParams 属性如下：
> | 属性 | 说明 |
> |:----- |:----|
> | Iterations | 平滑算法迭代次数，主要用来消除抖动，数值越大，抖动越少，但是对表情的敏感度也会越低。 |
> | EyesSmooth     | 眼睛区域的 BS 平滑度，0.0 - 1.0, 数值约大，平滑度越高。 |
> | EyeBallsSmooth | 眼球区域的 BS 平滑度，0.0 - 1.0, 数值约大，平滑度越高。 |
> | BrownSmooth    | 眉毛区域的 BS 平滑度，0.0 - 1.0, 数值约大，平滑度越高。 |
> | MouthSmooth    | 嘴巴区域的 BS 平滑度，0.0 - 1.0, 数值约大，平滑度越高。 |
> | CheekSmooth    | 脸颊区域的 BS 平滑度，0.0 - 1.0, 数值约大，平滑度越高。 |
> | JawSmooth      | 下巴区域的 BS 平滑度，0.0 - 1.0, 数值约大，平滑度越高。 |
> | NoseSmooth     | 鼻子区域的 BS 平滑度，0.0 - 1.0, 数值约大，平滑度越高。 |
> | HeadSmooth     | 头部旋转平滑度，0.0 - 1.0, 数值约大，平滑度越高，要求 Face Solution 能够支持头部旋转求解。 |

---   
   
## 事件通知

[![Events](./images/live_link_actor_events.jpg "Events")](./images/live_link_actor_events.jpg)

MediaPipeFaceLinkActor 不支持手动启动/停止，而是自动跟随 mediapipe 启停。为此，MediaPipeFaceLinkActor 暴露了必要的事件，让你指导它何时启动和停止。   

**OnFaceLinkStarted**   
当 MediaPipeFaceLinkActor 开始表情捕捉流程时触发该事件。   

**OnFaceLinkStarted**   
当 MediaPipeFaceLinkActor 停止表情捕捉流程时触发该事件。   
   
**OnFaceCalibrated**   
当面容校准完成时触发该事件。
   
---   

## 校准

从不同的人面容中捕捉的表情可能会产生差异，例如一个人的眼睛大小可能影响 EyeBlink 相关的 BS 数值，为此 MediaPipeFaceLinkActor 提供了对面容进行校准的功能。
完成面容校准仅需调用 **PerformCalibration** 函数。

[![PerformCalibration](./images/live_link_perform_calibration.jpg "PerformCalibration")](./images/live_link_perform_calibration.jpg)

{: warning}
> **PerformCalibration** 是一个异步函数，调用结束时面容并不会理解被校准，它需要等待下一帧 blend shapes 数据才能完成校准, 完成校准后会通过 **OnFaceCalibrated** 事件来
> 通知应用程序。   
>
> 同时你需要注意，**PerformCalibration** 必须在 mediapipe 运行过程中调用才能校准，因为它需要 bs 数据帧，如果在 mediapipe 停止状态调用 **PerformCalibration**，
> 将永远不会触发 **OnFaceCalibrated** 回调。
>
> 可以通过 **MediaPipeHolisticComponent::IsRunning** 函数或 **MediaPipeAnimationInstance::IsMediaPipeRunning** 函数来判断 mediapipe 是否正在运行。


如果你希望使用上次的校准数据（虽然并不推荐这样做）来校准面容，你也可以使用 **PerformCalibrationImmediately** 函数通过传递一个帧数据来立即校准。
PerformCalibrationImmediately 函数不关心 mediapipe 是否正在运行，因此你可以在任何时候校准面容。

{: warning}
> 虽然你可以在任何情况下使用 PerformCalibrationImmediately 函数，但是你必须确保你将要校准的 Face Solution 和用来校准的帧数据是相同的 Face Solution，你应该注意下面的问题：    
> 1. 由于 **MediaPipeFaceLinkActor** 存在自动降级行为，要获取实际正在使用的 FaceSolution， 你不能通过 **FaceSolution** 来获取，而应该使用 **GetActualFaceSolution**
> 函数来获取正在运行的方案。
> 2. 必须注意： GetActualFaceSolution 仅在 mediapipe 运行过程中才能返回正确的方案名称，如果 mediapipe 停止，它将返回空字符串。
>
> 综上，不建议你在 mediapipe 停止时进行面容校准，这会增加很多不必要的麻烦，建议你永远在 mediapipe 运行过程中进行面容校准操作。


### 校准数据清理   

校准后将记录面容的信息，你可以通过 **UnCalibration** 函数来清理这些校准数据。

[![UnCalibration](./images/live_link_un_calibration.jpg "UnCalibration")](./images/live_link_un_calibration.jpg)

---   
   
## UE 编辑器中校准

为了方便开发，你也可以在编辑器中进行校准操作，细节面板中提供了校准和清理校准的按钮。

[![PerformCalibration](./images/live_link_calibration_buttons.jpg "PerformCalibration")](./images/live_link_calibration_buttons.jpg)


# 不同 Face Solution 对 Blend Shapes 的支持

|名称               | MediaPipe | NvAR  | 说明|
|:-----------------|:-----:|:------:|--------:|
|eyeBlinkLeft      |  :white_check_mark:Yes  |   :white_check_mark:Yes  |  左眼眨眼
|eyeLookDownLeft   |  :white_check_mark:Yes  |   :white_check_mark:Yes  |  左眼目视下方
|eyeLookInLeft     |  :white_check_mark:Yes  |   :white_check_mark:Yes  |  左眼注视鼻尖
|eyeLookOutLeft    |  :white_check_mark:Yes  |   :white_check_mark:Yes  |  左眼向左看
|eyeLookUpLeft     |  :white_check_mark:Yes  |   :white_check_mark:Yes  |  左眼目视上方
|eyeSquintLeft     |  :white_check_mark:Yes  |   :white_check_mark:Yes  |  左眼眯眼
|eyeWideLeft       |  :white_check_mark:Yes  |   :white_check_mark:Yes  |  左眼睁大
|eyeBlinkRight     |  :white_check_mark:Yes  |   :white_check_mark:Yes  |  右眼眨眼
|eyeLookDownRight  |  :white_check_mark:Yes  |   :white_check_mark:Yes  |  右眼目视下方
|eyeLookInRight    |  :white_check_mark:Yes  |   :white_check_mark:Yes  |  右眼注视鼻尖
|eyeLookOutRight   |  :white_check_mark:Yes  |   :white_check_mark:Yes  |  右眼向左看
|eyeLookUpRight    |  :white_check_mark:Yes  |   :white_check_mark:Yes  |  右眼目视上方
|eyeSquintRight    |  :white_check_mark:Yes  |   :white_check_mark:Yes  |   右眼眯眼
|eyeWideRight      |  :white_check_mark:Yes  |   :white_check_mark:Yes  |  右眼睁大
|jawForward        |  :white_check_mark:Yes  |   :white_check_mark:Yes  |  努嘴时下巴向前
|jawLeft           |  :white_check_mark:Yes  |   :white_check_mark:Yes  |  撇嘴时下巴向左
|jawRight          |  :white_check_mark:Yes  |   :white_check_mark:Yes  |  撇嘴时下巴向右
|jawOpen           |  :white_check_mark:Yes  |   :white_check_mark:Yes  |  张嘴时下巴向下
|mouthClose        |  :white_check_mark:Yes  |   :white_check_mark:Yes  |  闭嘴
|mouthFunnel       |  :white_check_mark:Yes  |   :white_check_mark:Yes  |  稍张嘴并双唇张开
|mouthPucker       |  :white_check_mark:Yes  |   :white_check_mark:Yes  |  抿嘴
|mouthLeft         |  :white_check_mark:Yes  |   :white_check_mark:Yes  |  向左撇嘴
|mouthRight        |  :white_check_mark:Yes  |   :white_check_mark:Yes  |  向右撇嘴
|mouthSmileLeft    |  :white_check_mark:Yes  |   :white_check_mark:Yes  |  左撇嘴笑
|mouthSmileRight   |  :white_check_mark:Yes  |   :white_check_mark:Yes  |  右撇嘴笑
|mouthFrownLeft    |  :white_check_mark:Yes  |   :white_check_mark:Yes  |  左嘴唇下压
|mouthFrownRight   |  :white_check_mark:Yes  |   :white_check_mark:Yes  |  右嘴唇下压
|mouthDimpleLeft   |  :white_check_mark:Yes  |   :white_check_mark:Yes  |  左嘴唇向后
|mouthDimpleRight  |  :white_check_mark:Yes  |   :white_check_mark:Yes  |  右嘴唇向后
|mouthStretchLeft  |  :white_check_mark:Yes  |   :white_check_mark:Yes  |  左嘴角向左
|mouthStretchRight |  :white_check_mark:Yes  |   :white_check_mark:Yes  |  右嘴角向右
|mouthRollLower    |  :white_check_mark:Yes  |   :white_check_mark:Yes  |  下嘴唇卷向里
|mouthRollUpper    |  :white_check_mark:Yes  |   :white_check_mark:Yes  |  下嘴唇卷向上
|mouthShrugLower   |  :white_check_mark:Yes  |   :white_check_mark:Yes  |  下嘴唇向下
|mouthShrugUpper   |  :white_check_mark:Yes  |   :white_check_mark:Yes  |  上嘴唇向上
|mouthPressLeft    |  :white_check_mark:Yes  |   :white_check_mark:Yes  |  下嘴唇压向左
|mouthPressRight   |  :white_check_mark:Yes  |   :white_check_mark:Yes  |  下嘴唇压向右
|mouthLowerDownLeft|  :white_check_mark:Yes  |   :white_check_mark:Yes  |  下嘴唇压向左下
|mouthLowerDownRigh|t :white_check_mark:Yes  |   :white_check_mark:Yes  |  下嘴唇压向右下
|mouthUpperUpLeft  |  :white_check_mark:Yes  |   :white_check_mark:Yes  |  上嘴唇压向左上
|mouthUpperUpRight |  :white_check_mark:Yes  |   :white_check_mark:Yes  |  上嘴唇压向右上
|browDownLeft      |  :white_check_mark:Yes  |   :white_check_mark:Yes  |  左眉向外
|browDownRight     |  :white_check_mark:Yes  |   :white_check_mark:Yes  |  右眉向外
|browInnerUp       |  :white_check_mark:Yes  |   :white_check_mark:Yes  |  蹙眉
|browOuterUpLeft   |  :white_check_mark:Yes  |   :white_check_mark:Yes  |  左眉向左上
|browOuterUpRight  |  :white_check_mark:Yes  |   :white_check_mark:Yes  |  右眉向右上
|cheekPuff         |  :white_check_mark:Yes  |   :white_check_mark:Yes  |  脸颊向外
|cheekSquintLeft   |  :white_check_mark:Yes  |   :white_check_mark:Yes  |  左脸颊向上并回旋
|cheekSquintRight  |  :white_check_mark:Yes  |   :white_check_mark:Yes  |  右脸颊向上并回旋
|noseSneerLeft     |  :white_check_mark:Yes  |   :white_check_mark:Yes  |  左蹙鼻子
|noseSneerRight    |  :white_check_mark:Yes  |   :white_check_mark:Yes  |  右蹙鼻子
|tongueOut         |  :o:No  |   :o:No  |  吐舌头
|HeadYaw         |  :o:No  |   :white_check_mark:Yes  |  左右转头
|HeadPitch       |  :o:No  |   :white_check_mark:Yes  |  上下抬头
|HeadRoll         |  :o:No  |   :white_check_mark:Yes  |  向肩膀偏头