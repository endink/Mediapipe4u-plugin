---
sort: 6
---

# 半身/全身动补

MediaPipe4U 提供了半身动补和全身动补切换，半身动补将锁住盆骨 (Hips 关节) 和下肢 (Legs)。

## 半身动补的优化

半身动补模式下，MediaPipe4U 会对脊柱加入额外的滤波器，以消除身体的抖动。


## 使用方法

- MediaPipeUtils::SetMediaPipeAnimationMode 函数可以在包含 MediaPipeAnimInstance 的 Actor 切换全身/半身模式。
- MediaPipeAnimInstance 的 Mode 字段也可以切换全身/半身模式。

