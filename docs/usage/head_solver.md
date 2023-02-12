---
sort: 4
---

# 头部算解器

通常情况下，**MediaPipe4U** 使用 mediapipe holistic 中的 33 个地标实时计算 3D 模型的姿态，但是在具有脸部特写的场景中，mediapipe holistic 并不能得到精确的头部旋转。
为此，**MediaPipe4U** 提供的独立头部算解器，该算解器使用 mediapipe face mesh 中的脸部地标来计算头部旋转，因此能够获得更加准确的头部运动数据。

## 限制

只有在 mediapipe face mesh 可以获得清楚的地标时该算解器才能够正常工作，因此，头部算解器只适用于摄像头或视频中有面补特写的画面的场景（半身直播模式满足这个场景）。

## 如何使用

要使用头部算解器只需要完成以下步骤：

1. 在动画蓝图（继承自 **MediaPipeAnimInstance**）将 **SolveHeadFromFaceMesh** 变量设置为 true。
2. 在动画蓝图中加入 **MediaPipeHeadSolver** 节点。


[![UMediaPipeLiveLinkComponent](./images/use_head_solver.jpg "Shiprock")](images/use_head_solver.jpg)   








