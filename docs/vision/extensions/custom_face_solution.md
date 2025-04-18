# 自定义表情捕捉算法

如果你对内置的表情捕捉算法不满意，你还可以使用 **C++** 开发自己的表情捕捉算法插入到 `MediaPipe4U`。

`MediaPipe4U` 中表情捕捉算法，被抽象为 `IFaceSolution`（C++）接口， 你可以自己实现 `IFaceSolution` 在 `MediaPipe4U` 中加入自己的方案。


## 基本流程

添加自定义 `IFaceSolution` ，需要如下步骤：

- 实现 `IFaceSolution` 接口。
- 注册你的 `IFaceSolution` 实现。
- 在 `MediaPipeFaceLinkActor` 中使用你的方案。
- 在你不再需要这个实现时，注销它 (可选)。

本文档下面的内容为你详细介绍这个过程。

### 实现方案 

`IFaceSolution` 抽象一个表情捕捉解决方案, 下面是接口定义：

```cpp

class IFaceSolution
{
public:
	DECLARE_MULTICAST_DELEGATE_OneParam(FOnFaceBlendShapesSolved, TSharedPtr<FARBlendShapeMap> SolvedBlendShapes)
	virtual ~IFaceSolution() = default;

	virtual bool IsEnabled() const = 0;
	virtual bool Initialize(const FFaceSolutionInitializationContext& Context) = 0;
	virtual bool IsSolveFromImageFrame() = 0;
	virtual bool SolveFrame(const FImageSourceInfo& InSourceInfo, const TSharedPtr<IMediaPipeTexture>& Texture) = 0;
	virtual void UnInitialize(UMediaPipeHolisticComponent* MediaPipeHolisticComponent) = 0;

	virtual FOnFaceBlendShapesSolved& OnFaceBlendShapesSolved() = 0;
};

```

#### 函数介绍
|函数| 说明  |
|-----|---------|
|IsEnabled| 是否启用这个表情捕捉方案，通过实现这个函数，你还可以在内部动态控制方案的开启/关闭。 |
|Initialize| 方案初始化，你可以从输入参数中获取表情捕捉初始化的上下文 `FFaceSolutionInitializationContext` 来初始化你的算法。 |
|UnInitialize| 方案的卸载清理操作 |
|IsSolveFromImageFrame| 指示你的方案是否需要 `MediaPipe4U` 给你投递图像（`IMediaPipeTexture`）来进行计算。<br/> 举例：<br> `Remoting` 方案不需要投递图像，因为它利用安卓摄像头的画面的计算表情。<br/> `NvAR` 方案通过使用 `MediaPipe4U` 中的图像（来自 Image Source 的图像）来计算表情。   |
|SolveFrame | 当 `IsSolveFromImageFrame` 返回是 **true** 时，可以从这个函数接收来自 `MediaPipe4U` 的图像并计算表情。 |
| OnFaceBlendShapesSolved | 表情算解完成时触发的事件。 |

当你的的方案求解到表情时通过一个 `FOnFaceBlendShapesSolved` 事件（这个事件在 `OnFaceBlendShapesSolved` 函数返回） 通知  `MediaPipe4U` 你的算法已经完成算解。
`MediaPipe4U` 会将你的计算结果应用到 3D 角色。


## 注册方案

方案通常在你的 Module 加载时，进行注册。   
一个方案通常要求有唯一的名称，名称在注册时提供。   
通过调用 `FFaceSolutionManager` 的 `RegisterSolution` 函数注册你的方案。   


!!! tip

    `FFaceSolutionManager` 是单例模式的类，通过 `Get` 静态函数获得实例。   

    `MediaPipe4U` 要求你以共享指针 `TSharedPtr` 的形式注册你的方案实例。

例如，下面是 NvAR 方案的注册：

```cpp
FFaceSolutionManager::Get().RegisterSolution(FName("NvAR"), MakeShared<FNvARFaceSolution>());
```

## 使用方案

通过将 `MediaPipeFaceLinkActor` 的 `FaceSolution` 属性设置为你注册的方案名称，就可以在表情捕捉中使用你的方案。

## 注销方案

通常在你的 Module 被卸载时，你应该你应该注销你的方案。

通过调用 `FFaceSolutionManager` 的 `UnregisterSolution` 函数注册你的方案。   

例如，下面是 NvAR 方案的注销：

```cpp
FFaceSolutionManager::Get().UnregisterSolution(FName("NvAR"));
```


