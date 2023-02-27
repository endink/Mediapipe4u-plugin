# Mediapipe4U 插件

基于 MediaPipe 的 UnrealEngine 动作捕捉插件。 

- [中文文档](https://opensource.labijie.com/Mediapipe4u-plugin/)   

- [English Document is here (sorry it's google translate)](https://opensource-labijie-com.translate.goog/Mediapipe4u-plugin/?_x_tr_sch=http&_x_tr_sl=zh-CN&_x_tr_tl=en&_x_tr_hl=zh-CN&_x_tr_pto=wapp)


**下载地址**   

<!-- - [One Drive](https://1drv.ms/u/s!AkmROUeQfSBjzgQUnM8l4gOrrHyu?e=NJ8lyd)(2023-02-25)

- [奶牛快传](https://cowtransfer.com/s/d7251cf7109f46) (2023-02-25) -->

Please wait...


**Demo Project**   
- https://github.com/endink/MediaPipe4U-Demo  

> Demo 工程不包含插件，你自行下载插件，放到该工程的 Plugins 目录

---   

[![MediaPipe4U](./cover.gif "MediaPipe4U")](./cover.gif)

---   

---   

**问题反馈**   

如果你遇到问题，请优先查看 [FAQ](./faq)，这里整理了许多网友遇到的问题，或许也是你遇到的问题，如果 FAQ 中找到不到，优先使用 github 提交 issue, 私信可能会导致问题被我遗忘。

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


**Follow Me**

[B站](https://space.bilibili.com/481665211)   

[Youtube](https://www.youtube.com/channel/UCiOTp6S7N3GX46_nLQ17CrA)   


国内如果视频无法显示，请访问[B站视频](https://www.bilibili.com/video/BV1JD4y1r7ow)   

## 更新日志

### 2023-02-25

- [new] 加入了指标统计，可以通过 Stat 查看关键性能数据
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
