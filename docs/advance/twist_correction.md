---
sort: 3
---

# 关节扭曲校正

“扭曲校正”将骨骼旋转的百分比重新分配到父骨骼，以校正在某一旋转轴上旋转的关节扭曲变形。    
**MediaPipe4U**中的扭曲校正包含了手腕，肘关节和头部:   

[![twist correction](./images/twist_correction.gif "correction")](images/twist_correction.gif)

- Wrist Correct：手腕 (Hand) 使用前臂 (LowerArm) 来进行校正。
- Lower Arm Correct：前臂 (Lower Arm) 使用上臂 (UpperArm) 来进行校正。
- Head Correct：头部 (Head) 使用脖子 (Neck) 来进行校正。    


> 同时支持蓝图和 C++ 获取校正参数（权重），并且可以在运行过程中动态调整。

## 在蓝图中设置校正权重  

[![twist correction](./images/update_twist_correction_settings.jpg "correction")](images/update_twist_correction_settings.jpg)

## C++ 设置校正权重

```cpp
FTwistCorrectionSettings settings;
settings.HeadCorrectAlpha = 0.5f;
settings.WristCorrectAlpha = 0.85f;
settings.LowerArmCorrectAlpha = 0.15f;
UMediaPipeUtils::SetTwistCorrectionSettings(animInstance, settings);

```

## 校正属性

|属性|默认是|说明|
|-----|----|------|
|HeadCorrectAlpha|0.5| 0-1 的值，表示头部校正骨骼在轴线上的旋转权重，用来校正头部旋转，仅校正 Roll 方向的旋转 |
|WristCorrectAlpha|0.85| 0-1 的值，表示手腕校正骨骼(默认为 Lower Arm)在轴线上的旋转权重 |
|LowerArmCorrectAlpha|0.15| 0-1 的值，表示肘关节校正骨骼(Upper Arm)在轴线上的旋转权重 |


**手腕校正效果**

[![twist correction](./images/wirst_correction.jpg "correction")](images/wirst_correction.jpg)

**肘关节校正效果**

[![twist correction](./images/lower_arm_correction.jpg "correction")](images/lower_arm_correction.jpg)

**头部校正效果**

[![twist correction](./images/head_correction.jpg "correction")](images/head_correction.jpg)