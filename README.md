# Mediapipe4U

MediaPipe4U is an UnrealEngine plugin that integrated Google Mediapipe technology for capturing human motion (inclue body, fingers, face) and puppeteering 3D avatar through webcam, videos, and images in realtime.

[简体中文](./README_CN.md)

## Docment

- [简体中文](https://opensource.labijie.com/Mediapipe4u-plugin/)   

- [English (sorry it's google translate)](https://opensource-labijie-com.translate.goog/Mediapipe4u-plugin/?_x_tr_sch=http&_x_tr_sl=zh-CN&_x_tr_tl=en&_x_tr_hl=zh-CN&_x_tr_pto=wapp)

- [日本語 (申し訳ありませんが、それは単なるGoogle翻訳です)](https://opensource-labijie-com.translate.goog/Mediapipe4u-plugin/?_x_tr_sl=zh-CN&_x_tr_tl=ja&_x_tr_hl=zh-CN&_x_tr_pto=wapp)

- [한국어 (죄송합니다, 이것은 단지 구글 번역입니다)](https://opensource-labijie-com.translate.goog/Mediapipe4u-plugin/?_x_tr_sl=zh-CN&_x_tr_tl=ko&_x_tr_hl=zh-CN&_x_tr_pto=wapp)

## Dowload   

| Unreal Engine | China Site | Global Site | Update |
|---| --- | --- |----|
| UE 5.0 | [cowtransfer (China)](https://cowtransfer.com/s/67550e0a47c94c) | [OneDrive](https://1drv.ms/u/s!AkmROUeQfSBjzgnukXwh-G34dm3W?e=2eOWEr) | 2023-03-16 |
| UE 5.1 | [cowtransfer (China)](https://cowtransfer.com/s/fc820570589544) | [OneDrive](https://1drv.ms/u/s!AkmROUeQfSBjzgqGxF0e7tFHdHCb?e=stAFwP) | 2023-03-16 |
  


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
  
Because the plugin is precompiled and contains a large number of C++ link symbols and debug symbols, it will cost **5G** disk space after decompression (most files are UE-generated binaries in Intermediate).   
Don't need to worry about disk usage, this is just disk usage during development, after the project is packaged, the plug-in disk usage is **200M** only (most files are GStreamer dynamic library).
  

**Demo Project**   

- https://github.com/endink/MediaPipe4U-Demo  

> The demo project does not contain plugins, you need to download the plugin and copy content to the project's plugins folder to run.

---   

[![MediaPipe4U](./cover.gif "MediaPipe4U")](./cover.gif)

---   

---   

## FAQ

If you have any questiongs, please check [FAQ](./faq) first. The problems listed there may be also yours. If you can’t find an answer in the FAQ, please post an issue. Private message or emal may cause the question to be mised .

---
## Performance

Since the Windows version of MediaPipe does not support GPU inference, Windows relies on the CPU to inferring human pose estimation (see MediaPipe offical site for more details).

**Hardware Evnrioment**

CPU： AMD 3600 CPU   
RAM: 32GB   
GPU: Nvidia 1660s


**Evaluation** 

Frame Rate： 18-24 fps 

CPU usage：20% (Based on DEMO project)  

---


**Follow Me**

[bilibili](https://space.bilibili.com/481665211)   

[Youtube](https://www.youtube.com/channel/UCiOTp6S7N3GX46_nLQ17CrA)   

## Update History (Chinese)

### 2023-03-16
- [new] 位置算解节点加入 GroundIK，支持将脚贴合到地面（[文档](https://opensource.labijie.com/Mediapipe4u-plugin/features/location_solver.html)） 
- [fix] 动画蓝图切换后资源重复释放 (#30)，问题无法复现，需要等待反馈者测试
- [fix] BVH 插件骨骼节点索引错误 （#28）

### 2023-03-11
- [fix] Unreal Engine 5.1 打包后启动程序死锁（卡住，Blocking）

### 2023-03-09
- [new] Unreal Engine 5.1 版本加入 NvAR 表情捕捉支持

### 2023-02-27

- [new] NvAR 统计数据加入（[文档](https://opensource.labijie.com/Mediapipe4u-plugin/advance/stats.html)）
- [imporve] GStreamer 升级到 1.22.0 （如果出现 GStreamer 相关编译错误，请重新安装 GStreamer Runtime 和 SDK）
- [fix] :boom::punch::punch::punch: 修复 MediaPipe NvAR 史诗级 BUG，随着启停次数增加，NvAR 帧率逐渐下降 (<mark>如果你使用了 MediaPipe4UNvAR , 必须更新此版本！！！</mark>)
- [fix] 修复 0225 版本编译错误

### 2023-02-25

- [new] 加入了指标统计，可以通过 Stat 查看关键性能数据 （[文档](https://opensource.labijie.com/Mediapipe4u-plugin/advance/stats.html)）
- [new] 支持获取图像源的 FPS，方便排查性能问题 
- [new] IK 驱动模式，方便集成 ControlRig (<mark>实验性</mark>)
- [imporve] 移除 protobuf 依赖，避免使用 protobuf 的项目打包出现冲突
- [imporve] 优先摄像头 RBG 编码，某些摄像头默认 YUV 编码时帧率过低
- [fix] 编辑器中强行退出游戏可能导致崩溃

### 2023-02-12

- [new] MediaPipeAnimInstance 增加手动连接 MediaPipe 功能，当场景中存在多个带有 MediaPipe 动画蓝图的角色时，你可以手动控制驱动其中一个
- [new] 支持动态切换动画蓝图（SetAnimInstanceClass）后连接 MediaPipe
- [fix] 网络游戏模式下，**MediaPipeAnimInstance** 可能会崩溃 [BUG #20](https://github.com/endink/Mediapipe4u-plugin/issues/20)
- [fix] 摄像头动补在 Annotated 回显模式下工作不正常

### 2023-02-10 （milestone）   
> 重构底层代码，一致的图片处理工作流，减少了一次图片内存复制，这个版本带来了帧率提升   

:pushpin:**里程碑版本**   

- [new] :fire:预览版质量的 **Nvidia AR** 表情捕捉集成, ([文档](./experiment/README.md)，示例已经包含在 [Demo](https://github.com/endink/MediaPipe4U-Demo) 工程中）
- [new] 手指矫正，解决手指无法伸直的问题（**TODO**:文档暂缺）
- [new] **MediaPipeHolistic** 生命周期事件(OnInitialized, OnStarted, OnStopeed)蓝图支持
- [new] 图片、摄像头、视频图像回显都支持开启/关闭 MediaPipe 装饰（Annotated）模式了，便于分析动补帧
- [new] 摄像头捕捉加入了限制图片分辨率能力，在低端机器上可以提升帧率 (**TODO**:文档暂缺)
- [new] 全新重构的图片工作流，可以和任何第三方图片处理库集成（集成用例： NvAR 集成，[文档](./extensions/image_consumer.md)）
- [new] 修正头部算解器（HeadSolver） Roll 偏差
- [new] **MediaPipeLiveLink** 可以被禁用，多个主题(LiveLink Subject)同时工作时，禁用不需要的主题可以避免不必要的开销
- [imporve] 更易于实现的自定义图像源基类 **MediaPipeImageSourceComponent** (C++)
- [imporve] **MediaPipeRemapAsset** 现在可以在编辑器中导入/导出 Json 文件，方便在多人开发时共享资产
- [imporve] 摄像头动补也使用异步模式回显图片，提高了性能和帧率
- [fix] **MediaPipeLinkLink** 表情捕捉卡顿的严重性能问题 (Big Bug)
- [fix] 重置缓存可能存在线程不安全问题，（[BUG #18](https://github.com/endink/Mediapipe4u-plugin/issues/18)） 
- [fix] 骨骼绑定缺失时可能引起的程序崩溃
- [fix] 快速反复启停时导致静态图片绘制出错

### 2023-01-15
- [new]前胸关节如果未配置映射，自动获取颈骨（neck）的父关节作为前胸
- [new]头部算解器添加新的滤波算法，减少抖动（效果明显）
- [new]半身模式不只是锁定关节了，半身模式脊柱骨骼添加新的滤波算法（效果明显）
- [new]**StandardMediaPipeAnimInstance** 正式可用，可以通过 C++ 代码为角色动态设置 MediaPipe 动补（运行时附加动画蓝图，不用在编辑器中绑定骨骼制作动画蓝图，适用于动态加载模型场景）
- [fix]自定义骨骼无效（[issue #13](https://github.com/endink/Mediapipe4u-plugin/issues/13) 无法验证，本机测试无误）
- [fix]编辑器模式下，偶尔多播委托失效导致动补停住
- [fix]图片动补模式下，当前图片源（ImageSource）属性为空
- [fix]半身动补模式，头部扭曲矫正可能失效

- [improve]mediapipe 底层代码改进，开启关闭 pipeline 现在是线程安全的，回调事件只会在游戏线程执行（方便更新 UI）
- [improve]提高膝盖极向准确性，减少膝盖扭曲（膝盖极像开关即将移除）


### 2023-01-06
- [fix]骨骼层级刷新错误（[issue #10](https://github.com/endink/Mediapipe4u-plugin/issues/10), 感谢 **[Muscaric](https://github.com/Muscaric)** 提供反馈）

### 2023-01-04
- [fix]带有初始旋转角度的模型扭曲矫正错误
- [new]扭曲矫正开关，可以控制是否开启扭曲矫正
- [new]表情捕捉标定功能加入
- [new]表情捕捉重制:
- [new]表情降噪与平滑参数
- [new]膝盖极像开关（矫正膝盖侧弯问题）
- [new]表情平滑支持分别设置脸部和眼部平滑
- [new]表情捕捉加入虹膜追踪

### 2022-12-20
- [new] BVH 导出
- [new] 头部算解器（从 face mesh 计算头部旋转）
- [new] 关节扭曲校正
- [new] 关节二次平滑支持（C++）
- [new] 前胸 (chest) 关节映射
- [fix] 侧身时位移计算错误
- [fix] 脊柱锁定不生效

### 2022-11-25

- [fix] Pose 算解器骨骼映射索引超出范围错误，感谢网友 **[tiantianaixuexi](https://github.com/tiantianaixuexi)** 提交反馈（#3）
- [improve] 骨骼缓存时机变为第一帧数据，解决多次重复发生缓存

### 2022-11-22

- [new] 集成 UnrealEngine OpenCV，升级到 4.5.5
- [fix] Pose 算解器骨骼缓存 BUG
- [new] 兼容UrealEngine 5.1 API (目前仍然使用 5.0 编译)

### 2022-11-18

- [fix] 自定义骨骼映射无效的严重 BUG， 感谢网友 **[Gobcurry](https://github.com/Gobcurry)** 抽出宝贵时间发现问题。（issue: #2）
- [new] 新增骨骼映射资产 (Remap Asset)，动画蓝图骨骼映射使用映射资产。
- [new] 手腕扭曲矫正，通过肘部随动旋转简单矫正手腕扭曲变形。
- [remove] 动画蓝图中移除 BoneSettings 变量，不再通过 BoneSettings 配置骨骼，请使用新的映射资产映射。

### 2022-11-12

- [fix] 图片动补重复释放内存引起崩溃的问题
- [fix] 启动时 GStreamer 未配置导致 UE Editor 崩溃，改为延迟启动
- [fix] 上半身模式脊柱锁定无效问题
