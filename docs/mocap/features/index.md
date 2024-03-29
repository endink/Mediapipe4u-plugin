---
layout: default
nav_order: 3
title: 核心功能
parent: 动作和表情
has_children: true
---

# 核心功能

**MediaPipe4U** 主要通过动画蓝图中的节点来实现动作捕捉，所以动画蓝图节点就是 **MediaPipe4U** 的核心功能。   

**MediaPipe4U** 包含以下动画蓝图节点：

- **MediaPipe Pose Node**: 姿态节点
- **MediaPipe Hand Node**: 手部节点
- **MediaPipe Location Node**: 位置（位移）节点
- **MediaPipe Head Node**: 头部节点


**MediaPipe4U** 主要通过一个 Actor 实现表情捕捉。

- **MediaPipe Face Link Actor**

**MediaPipe4U** 提供了不同形式的图像源（Image Source）用来捕捉动作和表情.

- 静态图片（jpg, png）。   
- 视频文件 (mp4, avi)。   
- 流媒体 （RTMP/RSTP/HTTP  
- 摄像头
- Unrean Engine Media Player
