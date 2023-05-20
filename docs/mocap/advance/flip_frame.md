---
layout: default
title: 镜像/翻转视频流
parent: 进阶用法
grand_parent: 动作和表情
nav_order: 60
---
# 镜像/翻转视频流

某些情况情况下，你的视频流可能产生画面左右颠倒的情况，或者你希望通过颠倒画面产生不同的动补算解效果，
你可以通过设置 **UMediaPipeHolisticComponent** 的 **SourceHorizontalFlip** 属性来水平翻转图像。   

[![Video Flip](./images/video_flip.jpg "Video Flip")](images/video_flip.jpg)

**注意** : 并不是所有的图像源（Image Source）都支持翻转操作，下面的图像源翻转操作的支持情况：    

|图像源| 图像源说明 |水平翻转支持|
|--------|------|--------|
| WebcamImageSource | 摄像头 | Yes |
| GStreamerImageSource | 视频流 | No |
| StaticImageSource | 图片 | No |


