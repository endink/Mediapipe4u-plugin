---
sort: 5
---

# 动补数据导出 


## 导出 BVH （需要 20221209 版本）

动补数据导出通过 **MediaPipe4U** 的扩展插件 **MediaPipe4UBVH** 实现，改插件支持在 MediaPipe 运行期间捕获骨骼数据，并保存为 bvh 文件。   
动补数据导出功能依赖 MediapPipeAnimInstance ，它和 **MediapPipeAnimInstance** 紧密集成，不可单独使用。


## 使用方法

1. 向场景中添加 MediaPipeBVHRecorder （这是一个 Actor）
   
2. 调用 **Open** 函数可以开始录制。   
  
3. 调用 **CloseAndSave** 函数（传入需要保存的文件路径）停止录制

> 也可以调用 **Close** 函数停止录制，但是不保存数据，通常在用户取消保存时使用该函数。

## 录制设置

下面是 **MediaPipeBVHRecorder** 一些字段的含义：

| 字段 | 说明 |
| ---- | --- |
|FrameRate| 写入的数据帧率，和实际帧率无关，动补数据可以单独记录帧率 |
|UseRootBone| 是否使用根骨骼，为 true 将使用骨架中的第一根骨骼作为根骨骼，false 将使用 MediaPipe4U 映射的盆骨作为根骨骼 |
|AutoStop| 是否在 MediapPipe 捕获停止时自动停止录制（停止录制，但是不清理已录制的数据，在停止后应该调用 **Close** 或 **CloseAndSave** 函数完成录制过程） |
|AutoStop| 是否在 MediapPipe 停止时自动停止录制 |
|FirstFrameWithRefPose|是否将初始姿态写入到动画数据的第一帧|
|DebugFormat|是否使用调试数据格式，调式数据格式主要用于调试，它不是标准的动补数据文件，但是在文件中可以清晰的看到各个关节数据
|HighPrecision| 是否使用高精度数据，默认动画数据保留小数点后2位，如果该字段为 **true**，将保留小数点后 6 位



