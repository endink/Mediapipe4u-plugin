---
layout: default
nav_order: 90
title: Control Rig Pose Baker
parent: UE 工具
has_children: false
---

# Control Rig Pose Baker
{: .d-inline-block }

Beta
{: .label .label-green }  

MediaPipe4U 提供一个姿势资产烘焙工具，用于将 Control Rig 资产(ControlRig Pose Asset)转换为动画蓝图可用的姿势资产（PoseAsset）。

{: .important}
> 这对于 Metahuman 使用者来说非常有用。    
> 
> Epic 已经为 Metahuman 制作好了音素动画资产，只不过它的格式是 Control Rig Pose。我们没有办法在动画蓝图中直接使用。   
> 
> 通过 MediaPipe4U 提供的烘焙工具，可以快速的将这些资产转为动画蓝图可用的 PoseAsset。   


## 如何使用

1. 在 Unreal Editor 的窗口（Window）菜单中找到 MediaPipe4U --> Control Rig Pose Baker，将打开烘焙工具。
2. 选择要烘焙的 Control Rig Pose 所使用的骨架（Skeleton）
3. 选择要烘焙的 Control Rig Pose 所使用的 Control Rig。
4. 在内容浏览器中选择要进行烘焙的 Control Rig Pose （可以选择多个）。
5. 点击 Add From Content Browser 按钮添加 Pose。
6. 点击 Start Bake 进行烘焙。
7. 在 Pose Asset 编辑器中保存资产。

[![control rig baker](./images/control_rig_pose_baker.jpg "control rig baker")](./images/control_rig_pose_baker.jpg)


烘焙完成时将自动打开 Pose Asset 编辑器，你将看到烘焙得到的 Pose Asset。

[![control rig baker](./images/control_rig_pose_baker_result.jpg "control rig baker")](./images/control_rig_pose_baker_result.jpg)




