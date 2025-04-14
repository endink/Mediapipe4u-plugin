
# 使用 M4U Remoting

## 概述

![M4U Remoting](./images/get_started/remoting_icon.jpg "M4U Remoting")

- `MediaPipe4U Remoting` 是一个 Android App, 旨在将 MediaPipe4U 的捕捉能力延申到移动端（当前仅支持 Android），M4U Remoting 还在成长阶段，目前只具备表情捕捉。       
- `MediaPipe4U Remoting` 的本质是在移动端运行 google mediapipe 算解器，并将求解的数据结果发送到 Unreal Engine 端，供给 MediaPipe4U 在 Unreal Engine 中完成后续处理（例如：驱动 3D 角色动作）。    

!!! tip

    `MediaPipe4U Remoting` 是一个开源 App， 你可以在这里下载它的源代码：       
    [https://github.com/endink/M4URemoting-Android](https://github.com/endink/M4URemoting-Android)


## Windows 防火墙设置

你的防火墙可能不允许手机访问主机的端口（默认端口 **22345**），你可以通过保存以下内容为 bat 文件并执行，让防火墙允许端口通过。

```powershell
netsh advfirewall firewall add rule name="Port22345" dir=in action=allow protocol=UDP localport=22345
```

!!! tip

    上述命令保存为 bat 文件后需要用**管理员身份**执行，对 bat 文件点击鼠标右键，“以管理员身份运行” 即可。


## 表情捕捉

`MediaPipe4ULiveLink` 插件中内置了名为 **Remoting** 的 Face Solution，用来接收来自 `MediaPipe4U Remoting` App 捕捉到的表情数据，并通过 Live Link 协议发送到 Live Link 接收端（通常是 LiveLinkPose 动画蓝图节点）。   

> 移动端表情捕捉不但可以摆脱有线的束缚，因为移动端 mediapipe 支持 GPU 推理，加之它只运行单一的表情算解器，所以通常能够获得比 windows 摄像头更高的算解帧率。   
> 实测安卓表情捕捉帧率可以达到 30 PFS。
 
!!! tip

    此文档假设你已经知道如何使用 MediaPipe4U 进行表情捕捉，并且已经清楚 MediaPipe4U 中的以下概念：

    - Face Solution
    - Face Link Actor 
      
    如果你不清楚这些内容，请先阅读[使用表情捕捉](../facial/get_started.md) 。


### 使用方法：

1. 启动手机端 Remoting App, 在 `Settings` 中填写正确的主机 IP 地址。
2. 设置好 MediaPipe4U 的表情捕捉功能。
3. 设置 `Face Link Actor` 的 `Face Solution` 为 "**Remoting**"。
4. 运行使用 MediaPipe4U 插件的 Unreal Engine 项目。

> 默认 MediaPipe4U 会在 **22345** 端口侦听来自 Remoting App 的数据包，你也可以修改这个端口号，但是修改端口号以后手机端也必须使用一致的端口号设置。

![M4U Remoting](./images/get_started/remoting_setup.jpg "M4U Remoting")


### 手机端校准命令

Remoting App 具有远程控制 MediaPipe4U 的能力，你可以从安卓设备发送校准指令， MediaPipe4U 将进行校准操作，只需在主界面点击 + 按钮。



### 设置说明

一般情况下，M4U Remoting 是一个开箱即用的 App， “零配置”即可工作良好，也提供了少量的设置：

|设置项| 说明 |
|:------|:-----|
|Host | 运行 MediaPipe4U 的主机 IP 地址。|
|Port | 运行 MediaPipe4U 的主机开放的通讯端口地址。|
|Display Face |出于隐私考虑，可以通过这个开关，控制关闭/开启摄像头画面。|
|Detection Threshold |检测人脸的阈值，数值越大，对人脸清晰度、遮挡等条件越苛刻。|
|Tacking Threshold |连续侦测人脸的阈值，对于视频流来说，如果能够复用上一帧的人脸数据，例如人脸位置，可以提供计算效率，数值越大，对上一帧的可信度要求越高。|
|Present Threshold |人脸地标可信度阈值，当检测到人脸地标后对每个区域的的可信度评价，如果低于这个阈值，这个区域表情将算解失败。|
|Inference | AI 推理方式，优先使用 GPU 加速推理，如果你使用 GPU 出现问题，可以切换到 CPU 推理。|


