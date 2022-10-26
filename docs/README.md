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

**演示 DEMO**

[![MediaPipe4U Demo Video](https://res.cloudinary.com/marcomontalbano/image/upload/v1666755370/video_to_markdown/images/youtube--a0Ug_bFGQYk-c05b58ac6eb4c4700831b2b3070cd403.jpg)](https://youtu.be/a0Ug_bFGQYk)

国内如果视频无法显示，请访问[B站视频](https://www.bilibili.com/video/BV1JD4y1r7ow)

