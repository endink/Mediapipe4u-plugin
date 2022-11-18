# Mediapipe4U 插件

- [中文文档](https://opensource.labijie.com/Mediapipe4u-plugin/)   

- [English Document is here (sorry it's google translate)](https://opensource-labijie-com.translate.goog/Mediapipe4u-plugin/?_x_tr_sch=http&_x_tr_sl=zh-CN&_x_tr_tl=en&_x_tr_hl=zh-CN&_x_tr_pto=wapp)

基于 MediaPipe 的 UnrealEngine 动作捕捉插件。   

---
## 性能表现：

由于 MediaPipe Windows 版本不支持 GPU 推理，Windows 依靠 CPU 完成人形姿态预测（具体信息参考 MediaPipe）：

**测试环境**

CPU： AMD 3600 CPU   
内存: 32GB   
显卡: 1660s（此型号显卡无光追）   


**表现：** 

帧率(fps)： 18-24  

CPU 占用率：20% (测试 DEMO 仅包含 MetahumanLight 场景和 VRM 模型)  

---

Download the latest version:

[One Drive](https://1drv.ms/u/s!AkmROUeQfSBjzV5uyQA89imBfFwk?e=AvQmeN)(2022-11-18)

[奶牛快传](https://cowtransfer.com/s/4f26bf775a8b41) (2022-11-18)

Demo Project:   
https://github.com/endink/MediaPipe4U-Demo   

> Demo 工程不包含插件，你自行下载插件，放到该工程的 Plugins 目录

**Follow Me**

[B站](https://space.bilibili.com/481665211)   

[Youtube](https://www.youtube.com/channel/UCiOTp6S7N3GX46_nLQ17CrA)   


**演示 DEMO**

[![MediaPipe4U Demo Video](https://res.cloudinary.com/marcomontalbano/image/upload/v1666755370/video_to_markdown/images/youtube--a0Ug_bFGQYk-c05b58ac6eb4c4700831b2b3070cd403.jpg)](https://youtu.be/a0Ug_bFGQYk)

国内如果视频无法显示，请访问[B站视频](https://www.bilibili.com/video/BV1JD4y1r7ow)   

## 更新日志

### 2022-11-18

- [fix] 自定义骨骼映射无效的严重 BUG， 感谢网友 **[Gobcurry](https://github.com/Gobcurry)** 抽出宝贵时间发现问题。（issue: #2）
- [new] 新增骨骼映射资产 (Remap Asset)，动画蓝图骨骼映射使用映射资产。
- [new] 手腕扭曲矫正，通过肘部随动旋转简单矫正手腕扭曲变形。
- [remove] 动画蓝图中移除 BoneSettings 变量，不再通过 BoneSettings 配置骨骼，请使用新的映射资产映射。

### 2022-11-12

- [fix] 图片动补重复释放内存引起崩溃的问题
- [fix] 启动时 GStreamer 未配置导致 UE Editor 崩溃，改为延迟启动
- [fix] 上半身模式脊柱锁定无效问题
