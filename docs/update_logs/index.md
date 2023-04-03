---
layout: default
nav_order: 110
title: 更新日志
has_children: false
---


### 2023-04-01   

Fix
{: .label .label-yellow .d-inline-block  }
LOD 变化时，如果骨骼变化，引发程序崩溃

Fix
{: .label .label-yellow .d-inline-block  }
MediaPipe 表情解算 BrowDown 时右眼误差

Fix
{: .label .label-yellow .d-inline-block  }
UE Editor 中 LiveLink管理器状态和 MediaPipeFaceLinkActor 不一致

Fix
{: .label .label-yellow .d-inline-block  }
LiveLink Source 无法删除的问题 



### 2023-04-01   

New
{: .label .label-green.d-inline-block  }
全新的 MediaPipe BlendShapes 求解器，不依赖 Nvidia GPU，兼容苹果 51 个 Arkit 表情 ([文档](https://opensource.labijie.com/Mediapipe4u-plugin/features/face_link_actor.html))。   

New
{: .label .label-green .d-inline-block  }
MediaPipe4U 的 LiveLink 统一成全新的 MediaPipeFaceLinkActor（[文档](https://opensource.labijie.com/Mediapipe4u-plugin/features/location_solver.html)），支持在 MediaPipe/NvAR 算法切换，可以自动降级算法。    

New
{: .label .label-green.d-inline-block  }
全新的面容校准（Face Calibration）算法。

New
{: .label .label-green.d-inline-block  }
动态 MediaPipe Graph 构造支持，支持切换装饰线条显示风格，Pose/Holistic/Face 之间切换。

New
{: .label .label-green.d-inline-block  }
位置校准倒计时读秒蓝图支持，方便集成校准 UI (请下载最新的 Demo Project 查看)。

New
{: .label .label-green.d-inline-block  }
GStreamer 使用[GStreamer uridecodebin](https://gstreamer.freedesktop.org/documentation/playback/uridecodebin.html)工作流，支持从 HTTP/RTSP/RMTP/M3U8 等网络协议中解析视频流（#37）。

Improve
{: .label .d-inline-block  }
Pose Solver 优化（Optimization）加入膝盖极像矫正。

Improve
{: .label .d-inline-block  }
GStreamer 显示警告信息，更容易定位产生错误的原因。

Improve
{: .label .d-inline-block  }
MediaPipe 更新到 0.9.2，TFLite 模型更新到最新。

Improve
{: .label .d-inline-block  }
MediaPipe/NvAr 连接库不再使用嵌入 CRT。

Improve
{: .label .d-inline-block  }
MediaPipe/NvAr 中的 OpenCV 支持 Highgui，方便图形调试。

Fix
{: .label .label-yellow .d-inline-block  }
某些视频文件在缩放时产生异常（#43）。

Fix
{: .label .label-yellow .d-inline-block  }
StaticImageSource 可能引发图片未释放的警告。

Fix
{: .label .label-yellow .d-inline-block  }
GStreamer 出现错误不会自动关闭 Pipline, 从而导致下次启动异常。

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
