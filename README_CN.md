# Mediapipe4U 插件

基于 MediaPipe 的 UnrealEngine 动作捕捉插件。 

## 文档

- [简体中文](https://opensource.labijie.com/Mediapipe4u-plugin/)   

- [English (sorry it's google translate)](https://opensource-labijie-com.translate.goog/Mediapipe4u-plugin/?_x_tr_sch=http&_x_tr_sl=zh-CN&_x_tr_tl=en&_x_tr_hl=zh-CN&_x_tr_pto=wapp)

- [日本語 (申し訳ありませんが、それは単なるGoogle翻訳です)](https://opensource-labijie-com.translate.goog/Mediapipe4u-plugin/?_x_tr_sl=zh-CN&_x_tr_tl=ja&_x_tr_hl=zh-CN&_x_tr_pto=wapp)

- [한국어 (죄송합니다, 이것은 단지 구글 번역입니다)](https://opensource-labijie-com.translate.goog/Mediapipe4u-plugin/?_x_tr_sl=zh-CN&_x_tr_tl=ko&_x_tr_hl=zh-CN&_x_tr_pto=wapp)

## 下载地址   

|UE 版本| 下载地址 1 | 下载地址 2 | 更新时间 |
|---| --- | --- |----|
| UE 5.0 | [奶牛快传](https://cowtransfer.com/s/e7711d7ab2dd48) | [OneDrive](https://1drv.ms/u/s!AkmROUeQfSBjzgxonQa0ml_PuFzU?e=Cnydei) | 2023-04-01 |
| UE 5.1 | [奶牛快传](https://cowtransfer.com/s/8f1f181a691f47) | [OneDrive](https://1drv.ms/u/s!AkmROUeQfSBjzguazsZnaIwpCASw?e=zi0jWF) | 2023-04-01 |
  


<!-- > ### 历史版本  
> 
> - **Unreal Engine 5.0**
>
>  - [One Drive](https://1drv.ms/u/s!AkmROUeQfSBjzgWrCryGWYDK1SJj?e=7KUhai) (2023-02-27)
>
>  - [奶牛快传](https://cowtransfer.com/s/148d44d7d7bb48) (2023-02-27)
>
>- **Unreal Engine 5.1**
>
>  - [One Drive](https://1drv.ms/u/s!AkmROUeQfSBjzgibw3mJ9vC1kfwl?e=BDsqXt) (2023-03-11)
>
>  - [奶牛快传](https://cowtransfer.com/s/57864613496641) (2023-03-11)    -->
  

  
插件由于采用预编译，包含大量 C++ 链接符号和调试符号，解压后会占用 **5G** 磁盘空间（大部分为 Intermediate 中的 UE 生成代码）
你不需要担心磁盘占用问题，这只是开发期间的磁盘占用，在项目打包后，插件磁盘占用大约是 **200M**（主要为 GStreamer 动态库）

**Demo Project**   

- https://github.com/endink/MediaPipe4U-Demo  

> Demo 工程不包含插件，你自行下载插件，放到该工程的 Plugins 目录

---   

[![MediaPipe4U](./cover.gif "MediaPipe4U")](./cover.gif)

---   

---   

## 问题反馈

如果你遇到问题，请优先查看 [FAQ](./faq)，这里整理了许多网友遇到的问题，或许也是你遇到的问题，如果 FAQ 中找到不到，优先使用 github 提交 issue, 私信可能会导致问题被我遗忘。

---
## 性能

由于 MediaPipe Windows 版本不支持 GPU 推理，Windows 依靠 CPU 完成人形姿态预测（具体信息参考 MediaPipe）：

**测试环境**

CPU： AMD 3600 CPU   
内存: 32GB   
显卡: 1660s（此型号显卡无光追）   


**表现：** 

帧率(fps)： 18-24  

CPU 占用率：20% (测试 DEMO 仅包含 MetahumanLight 场景和 VRM 模型)  

---


**Follow Me**

[B站](https://space.bilibili.com/481665211)   

[Youtube](https://www.youtube.com/channel/UCiOTp6S7N3GX46_nLQ17CrA)   


国内如果视频无法显示，请访问[B站视频](https://www.bilibili.com/video/BV1JD4y1r7ow)   

