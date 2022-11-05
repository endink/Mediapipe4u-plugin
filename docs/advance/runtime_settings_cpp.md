---
sort: 2
---
# 运行时控制 (C++)
   
**MediaPipe4U** 使用 C++ 开发，在 C++ 项目中你将获得最大的自由度，你可以很容易的访问和修改你在动画蓝图设计器中看到参数。

## 使用蓝图函数库

你可以通过 **UMediaPipeUtils** 类方便的访问 **MediaPipe4U** 的组件，例如： MediaPipeAnimInstance,UMediaPipeHolisticComponent 等

## 访问 MediaPipe 算解器(solver)

```cpp

if (MediaPipeCharacter)
{
    UMediaPipeAnimInstance* animInstance;
    if(UMediaPipeUtils::FindMediaPipeAnimationInstance(MediaPipeCharacter, animInstance))
    {
        UMediaPipeUtils::SetPoseSmooth(animInstance, Value);
        auto& handSolver = animInstance->GetHandsSolver();
        auto& locationSolver = animInstance->GetLocationSolver();
        auto& poseSolver = animInstance->GetPoseSolver();
    }
}
```

所有的算解器都具有一些公共行为，他们都继承自 **IMediaPipeSolver**.    
需要注意的是，受限于 UE 多接口的问题，从上面代码中的 locationSolver 和 poseSolver 获取 **IMediaPipeSolver** 你需要多一层调用：

```cpp
animInstance->GetLocationSolver()->GetSolver(); //GetSolver for getting IMediaPipeSolver
animInstance->GetPoseSolver()->GetSolver();
```
> 手指算计器实际上是包装了左手和右手算解器，所以它直接继承了 **IMediaPipeSolver**，无需再次调用 GetSolver

```cpp
class MEDIAPIPE_API IMediaPipeSolver
{
public:
	virtual ~IMediaPipeSolver() = default;
	virtual  bool IsInitialized() const = 0;
	virtual  void Initialize(const FAnimationInitializeContext& Context, const FHumanoidBoneSettings& BoneSettings) = 0;
	virtual bool Solve(const FMediaPipeFrame& MediaPipeFrame, FComponentSpacePoseContext& Output, float Alpha = 1.0f) = 0;
	virtual  void SetFilterParams(float KalmanParamQ, float KalmanParamR, float Smooth) = 0;
	virtual  void GetFilterParams(float& KalmanParamQ, float& KalmanParamR, float& Smooth) = 0;
	virtual void CacheBones(const FBoneContainer& RequiredBones) = 0;
	virtual bool IsDisabled() const = 0;
	virtual void SetDisabled(bool Disabled) = 0;
	virtual void ResetState() = 0;
	virtual float GetMediaPipeFPS() const = 0;
	virtual float GetFPS() const = 0;
	virtual float GetMinScoreThresh() const = 0;
	virtual void SetMinScoreThresh(float Threshold) = 0;
};
```

## 控制身体平滑度

```cpp

void SetPoseSmooth(float Value)
{
	if (MediaPipeCharacter)
	{
		UMediaPipeAnimInstance* animInstance;
		if(UMediaPipeUtils::FindMediaPipeAnimationInstance(MediaPipeCharacter, animInstance))
		{
			UMediaPipeUtils::SetPoseSmooth(animInstance, Value);
		}
	}
}

```

## 控制手指平滑度

void SetFingerSmooth(float Value)
{
	if (MediaPipeCharacter)
	{
		UMediaPipeAnimInstance* animInstance;
		if(UMediaPipeUtils::FindMediaPipeAnimationInstance(MediaPipeCharacter, animInstance))
		{
			UMediaPipeUtils::SetFingerSmooth(animInstance, Value);
		}
	}
}

## 控制关节锁定

锁定表示在驱动模型过程中是否锁定关节，

```cpp
UMediaPipeAnimInstance* animInstance;
if(UMediaPipeUtils::FindMediaPipeAnimationInstance(MediaPipeCharacter, animInstance))
{
    UMediaPipeUtils::SetPoseSmooth(animInstance, Value);
    auto& solver = animInstance->GetPoseSolver();
    auto& locks = solver->GetLocks();
    locks.bIsLockHead = true;
    locks.bIsLockFoot = true;
    solver->ApplyLocks();
}
```

>需要注意的是，为了避免每一帧都更新关节锁定信息，你在设置锁定信息后需要使用 **ApplyLocks** 函数使你的设置生效。
