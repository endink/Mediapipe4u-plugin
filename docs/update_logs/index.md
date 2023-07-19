---
layout: default
nav_order: 110
title: 更新日志
has_children: false
---

### 2023-07-18   
{: .d-inline-block }

Current
{: .label .label-green }    
[new] 支持在插件配置界面中更新许可证（[文档](https://opensource.labijie.com/Mediapipe4u-plugin/licensing/update_license.html)）。   
[new] 支持在插件配置界面中更新语音模型（[文档](https://opensource.labijie.com/Mediapipe4u-plugin/speech/config.html)）。   
[new] :rainbow: 加入离线语音识别（ASR）功能（需要下载模型包）从麦克风识别语音并转为文字([文档](https://opensource.labijie.com/Mediapipe4u-plugin/speech/quick_start.html))。   
[new] 支持从蓝图中更新许可证，方便从自己的服务器分发许可证到客户端。   
[improve] :thumbsup: MediaPipe 升级到 0.10.2, 更新了 google 模型，使用新的 mediapipe solution api，表情捕捉大幅改进，普通摄像头的表情捕捉已经处于 Production Ready 水平了。   
[improve] 使用 Pose Tracker 装饰线条（Annotion）时，不再绘制 ROI 红色线框（详情: [#81](https://github.com/endink/Mediapipe4u-plugin/issues/81)）。   
[improve] GStreamer 打包时不再打包无用的 PC (C++ package config) 文件，进一步减小打包尺寸。   
[fix] 暂时移除 FixMediaPipe，因为它会导致腿部跳变（详情: [#81](https://github.com/endink/Mediapipe4u-plugin/issues/81)）。   

{: .warning}
> [**break change**] :red_circle: 原有的 TTS 模型包格式不再兼容新版插件，升级插件后请删除原有模型包 （speech 目录）, 使用编辑器导入模型包功能导入新的语音模型包。   


### 2023-06-28   
[new] :rainbow:MediaPlayerImageSource: 支持从 Unreal Engine 的 MediaPlayer 中捕获画面作为图像源（[文档](https://opensource.labijie.com/Mediapipe4u-plugin/mocap/features/image_source.html)）。     
[new] 上半身锁定：支持设置上半身三个轴向的锁定 ([文档](https://opensource.labijie.com/Mediapipe4u-plugin/mocap/features/pose_solver.html))。      
[fix] 修复校准时初始关节带有旋转角时产生的校准错误。   
[fix] 阻尼算法造成的关节扭曲矫正错误。   
[fix] 半身模式时校准无法正常工作。   


### 2023-06-20   
[new] Pose Solver: 支持开启/关闭姿势优化的具体项。   
[improve] 缩减编译后的体积（磁盘空间占用从 10GB 降低到 6GB）。    
[fix] 脊柱旋转模式时可能造成姿势校准不正确。        


### 2023-06-17   
[new] 新增姿态校准功能，纠正 mediapipe 原始数据中脊柱、小腿没有伸直的问题（[文档](https://opensource.labijie.com/Mediapipe4u-plugin/mocap/advance/calibration.html)）。     
[new] 新增手动校准功能，姿势校准，位置校准均支持手动校准和自动校准设置（[文档](https://opensource.labijie.com/Mediapipe4u-plugin/mocap/advance/calibration.html)）。    
[new] 新增脊柱旋转模式，有助于运动中稳定脚部（[文档](https://opensource.labijie.com/Mediapipe4u-plugin/mocap/features/pose_solver.html)）。    
[new] 手指捕捉手掌丢失时回弹处理规则 。   
[new] UE Editor 动补工具加入关节锁定、校准等功能。   
[new] UE Editor 动补工具支持对视频文件快进、暂停。   
[improve] mediapipe 升级到最新版（[v0.10.1](https://github.com/google/mediapipe/releases/tag/v0.10.1)）。     
[improve] Hand Solver：加入手腕旋转阻尼，防止跳变。     
[improve] LocationSolver: Location IK 算法改进，位移计算更合理。     
[improve] Ground IK: 脚步和脚踝旋转平滑。     
[improve] Ground IK: 加入脚步限滑，改善脚步抖动问题。    
[fix] GroundIK: 检测脚踝位置不正确。     
[fix] GroundIK: 节点 FeetVerticalOffset 等几个属性设置无效。      
[fix] ControlRigPose Baker 工具生成的 PoseAsset 不正确。   

### 2023-05-21

[new] 新增 **MediaPipe4USpeech** 插件支持离线 TTS 和音唇同步（[文档](https://opensource.labijie.com/Mediapipe4u-plugin/speech/)）。   
[new] ControlRigPose 烘焙工具，方便制作 Metahuman 的口型资产。   
[fix] 移除工具箱材质，使用 C++ 动态创建，修复 UE5.0 打包材质问题。   

### 2023-04-23

[new] :fire:加入 M4U Remoting, 支持从安卓设备捕捉表情（[文档](https://opensource.labijie.com/Mediapipe4u-plugin/features/m4u_remoting.html)）。      
[new] Android 面补工具开放下载（商业授权功能，免费授权无法打包）   
[new] UE 编辑器工具新功能：    
- LiveLink 追踪   
- 位移、姿势校准   
- 面容校准   

[new] 统一位置、姿态校准，从 AnimationInstance 访问 CalibrationCountDownSeconds 等参数；现在，支持手动校准位置和姿势（:red_circle:Break Changes）。   
[fix] 动补回调包发生错误时可能导致 texture 被占用无法释放   
[fix] 退出编辑器时概率引发崩溃   
[fix] UE 工具箱状态不同步   



### 2023-04-08

[new] 添加 UE 编辑器工具箱功能，方便在编辑器中调试参数 ([文档](https://opensource.labijie.com/Mediapipe4u-plugin/features/ue_editor_toolkits.html))

### 2023-04-03

- [fix] LOD 变化时，如果骨骼变化，引发程序崩溃
- [fix] MediaPipe 表情解算 BrowDown 时右眼误差
- [fix] UE Editor 中 LiveLink管理器状态和 MediaPipeFaceLinkActor 不一致
- [fix] LiveLink Source 无法删除的问题 

### 2023-04-01
全新的 MediaPipe BlendShapes 求解器，不依赖 Nvidia GPU，兼容苹果 51 个 Arkit 表情 ([文档](https://opensource.labijie.com/Mediapipe4u-plugin/features/face_link_actor.html))。
- [new] MediaPipe4U 的 LiveLink 统一成全新的 MediaPipeFaceLinkActor（[文档](https://opensource.labijie.com/Mediapipe4u-plugin/features/location_solver.html)），支持在 MediaPipe/NvAR 算法切换，可以自动降级算法。 
- [new] 全新的面容校准（Face Calibration）算法。
- [new] 动态 MediaPipe Graph 构造支持，支持切换装饰线条显示风格，Pose/Holistic/Face 之间切换。
- [new] 位置校准倒计时读秒蓝图支持，方便集成校准 UI (请下载最新的 Demo Project 查看)。
- [new] GStreamer 使用[GStreamer uridecodebin](https://gstreamer.freedesktop.org/documentation/playback/uridecodebin.html)工作流，支持从 HTTP/RTSP/RMTP/M3U8 等网络协议中解析视频流（#37）。
- [improve] Pose Solver 优化（Optimization）加入膝盖极像矫正。
- [improve] GStreamer 显示警告信息，更容易定位产生错误的原因。
- [improve] MediaPipe 更新到 0.9.2，TFLite 模型更新到最新。
- [improve] MediaPipe/NvAr 连接库不再使用嵌入 CRT。
- [improve] MediaPipe/NvAr 中的 OpenCV 支持 Highgui，方便图形调试。
- [fix] 某些视频文件在缩放时产生异常（#43）。
- [fix] StaticImageSource 可能引发图片未释放的警告。
- [fix] GStreamer 出现错误不会自动关闭 Pipline, 从而导致下次启动异常。

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
