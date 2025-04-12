
# MediaPipe 动画蓝图

`MediaPipeAnimInstance` 类作为 `MediaPipe4U` 动作捕捉的动画蓝图基类，从 `MediaPipeHolisticComponent` 组件中持续获取 mediapipe 数据，
并将这些数据应用到各个 `MediaPipe4U` 相关的动画蓝图节点。

当一个骨骼网格体 (`USkeletalMeshComponent`) 的 `Anim Class` 设置为一个继承自 `MediaPipeAnimInstance` 的动画蓝图类型时，这个骨骼网格体将被 `MediaPipe4U` 驱动。


![SkeletalMeshDetails](./images/anim_instance/anim_instance_details.png){ align=right }

> `MediaPipeAnimInstance` 存在于 `MediaPipe4UMotion` 插件中，是动作捕捉的核心元件。

