---
sort: 99
---
# 运行时骨骼配置 (C++)

满足在运行时才能确定人形骨骼配置的场景。**MediaPipe4U** 提供了运行时骨骼配置能力。   

我们可以通过 **MediaPipeAnimInstance** 动画蓝图的 BoneSettings 属性（变量）完成人形骨骼映射，但是有时候，这种编辑器中配置映射的功能无法满足一些特定需求，例如：
例如，我们支持了用户加载 VRM 文件读取模型信息，但是骨骼名称需要从 VRM 文件提供的元数据中获取，并不能提前知道，此时，使用运行时骨骼配置就能解决这个问题。

通过实现 MediaPipe4U 插件中的 **IBoneSettingsProvider** 结构创建一个骨骼提供程序，该接口定义如下：

```cpp
class MEDIAPIPE_API IBoneSettingsProvider
{
    public:
        virtual ~IBoneSettingsProvider() = default;
        virtual  void ApplyBoneSettings(const FBoneContainer& BoneContainer, FHumanoidBoneSettings& BoneSettings) = 0;
        
        static void LoadBoneSetting(const FBoneContainer& BoneContainer, FBoneReference& BoneReference, const FName& BoneName);
};

```

然后调用 **UMediaPipeAnimInstance::PrepareSolvers** 函数，不完全代码如下：

```cpp

if(auto* mediapipeAnimInstance = Cast<UMediaPipeAnimInstance>( animInstance))
{
    //FVrmBoneSettingsProvider 是一个 IBoneSettingsProvider 实现
    FVrmBoneSettingsProvider provider(VrmAssetList); 

    mediapipeAnimInstance->PrepareSolvers(&provider);
    
}
```

如何实现 **IBoneSettingsProvider** 接口，可以参考内置的 **UE5BoneSettingsProvider** 实现 实现

```cpp
void UE5BoneSettingsProvider::ApplyBoneSettings(const FBoneContainer& BoneContainer,
	FHumanoidBoneSettings& BoneSettings)
{
	LoadBoneSetting(BoneContainer, BoneSettings.Root, FName(TEXT("root")));
	LoadBoneSetting(BoneContainer, BoneSettings.Hips, FName(TEXT("pelvis")));
	
	LoadBoneSetting(BoneContainer, BoneSettings.LeftUpperLeg, FName(TEXT("thigh_l")));
	LoadBoneSetting(BoneContainer, BoneSettings.RightUpperLeg, FName(TEXT("thigh_r")));
	
	LoadBoneSetting(BoneContainer, BoneSettings.LeftLowerLeg, FName(TEXT("calf_l")));
	LoadBoneSetting(BoneContainer, BoneSettings.RightLowerLeg, FName(TEXT("calf_r")));

	LoadBoneSetting(BoneContainer, BoneSettings.LeftFoot, FName(TEXT("foot_l")));
	LoadBoneSetting(BoneContainer, BoneSettings.RightFoot, FName(TEXT("foot_r")));
	LoadBoneSetting(BoneContainer, BoneSettings.LeftToe, FName(TEXT("ball_l")));
	LoadBoneSetting(BoneContainer, BoneSettings.RightToe, FName(TEXT("ball_r")));

	LoadBoneSetting(BoneContainer, BoneSettings.Spine, FName(TEXT("spine_01")));

	LoadBoneSetting(BoneContainer, BoneSettings.Neck, FName(TEXT("neck_01")));

	LoadBoneSetting(BoneContainer, BoneSettings.Head, FName(TEXT("head")));

	LoadBoneSetting(BoneContainer, BoneSettings.LeftShoulder, FName(TEXT("clavicle_l")));
	LoadBoneSetting(BoneContainer, BoneSettings.RightShoulder, FName(TEXT("clavicle_r")));

	LoadBoneSetting(BoneContainer, BoneSettings.LeftUpperArm, FName(TEXT("upperarm_l")));
	LoadBoneSetting(BoneContainer, BoneSettings.RightUpperArm, FName(TEXT("upperarm_r")));

	LoadBoneSetting(BoneContainer, BoneSettings.LeftLowerArm, FName(TEXT("lowerarm_l")));
	LoadBoneSetting(BoneContainer, BoneSettings.RightLowerArm, FName(TEXT("lowerarm_r")));

	LoadBoneSetting(BoneContainer, BoneSettings.LeftHand, FName(TEXT("hand_l")));
	LoadBoneSetting(BoneContainer, BoneSettings.RightHand, FName(TEXT("hand_r")));

	LoadBoneSetting(BoneContainer, BoneSettings.LeftThumbProximal, FName(TEXT("thumb_01_l")));
	LoadBoneSetting(BoneContainer, BoneSettings.LeftThumbIntermediate, FName(TEXT("thumb_02_l")));
	LoadBoneSetting(BoneContainer, BoneSettings.LeftThumbDistal, FName(TEXT("thumb_03_l")));
	LoadBoneSetting(BoneContainer, BoneSettings.RightThumbProximal, FName(TEXT("thumb_01_r")));
	LoadBoneSetting(BoneContainer, BoneSettings.RightThumbIntermediate, FName(TEXT("thumb_02_r")));
	LoadBoneSetting(BoneContainer, BoneSettings.RightThumbDistal, FName(TEXT("thumb_03_r")));

	LoadBoneSetting(BoneContainer, BoneSettings.LeftIndexProximal, FName(TEXT("index_01_l")));
	LoadBoneSetting(BoneContainer, BoneSettings.LeftIndexIntermediate, FName(TEXT("index_02_l")));
	LoadBoneSetting(BoneContainer, BoneSettings.LeftIndexDistal, FName(TEXT("index_03_l")));
	LoadBoneSetting(BoneContainer, BoneSettings.RightIndexProximal, FName(TEXT("index_01_r")));
	LoadBoneSetting(BoneContainer, BoneSettings.RightIndexIntermediate, FName(TEXT("index_02_r")));
	LoadBoneSetting(BoneContainer, BoneSettings.RightIndexDistal, FName(TEXT("index_03_r")));

	LoadBoneSetting(BoneContainer, BoneSettings.LeftMiddleProximal, FName(TEXT("middle_01_l")));
	LoadBoneSetting(BoneContainer, BoneSettings.LeftMiddleIntermediate, FName(TEXT("middle_02_l")));
	LoadBoneSetting(BoneContainer, BoneSettings.LeftMiddleDistal, FName(TEXT("middle_03_l")));
	LoadBoneSetting(BoneContainer, BoneSettings.RightMiddleProximal, FName(TEXT("middle_01_r")));
	LoadBoneSetting(BoneContainer, BoneSettings.RightMiddleIntermediate, FName(TEXT("middle_02_r")));
	LoadBoneSetting(BoneContainer, BoneSettings.RightMiddleDistal, FName(TEXT("middle_03_r")));

	LoadBoneSetting(BoneContainer, BoneSettings.LeftRingProximal, FName(TEXT("ring_01_l")));
	LoadBoneSetting(BoneContainer, BoneSettings.LeftRingIntermediate, FName(TEXT("ring_02_l")));
	LoadBoneSetting(BoneContainer, BoneSettings.LeftRingDistal, FName(TEXT("ring_03_l")));
	LoadBoneSetting(BoneContainer, BoneSettings.RightRingProximal, FName(TEXT("ring_01_r")));
	LoadBoneSetting(BoneContainer, BoneSettings.RightRingIntermediate, FName(TEXT("ring_02_r")));
	LoadBoneSetting(BoneContainer, BoneSettings.RightRingDistal, FName(TEXT("ring_03_r")));

	LoadBoneSetting(BoneContainer, BoneSettings.LeftLittleProximal, FName(TEXT("pinky_01_l")));
	LoadBoneSetting(BoneContainer, BoneSettings.LeftLittleIntermediate, FName(TEXT("pinky_02_l")));
	LoadBoneSetting(BoneContainer, BoneSettings.LeftLittleDistal, FName(TEXT("pinky_03_l")));
	LoadBoneSetting(BoneContainer, BoneSettings.RightLittleProximal, FName(TEXT("pinky_01_r")));
	LoadBoneSetting(BoneContainer, BoneSettings.RightLittleIntermediate, FName(TEXT("pinky_02_r")));
	LoadBoneSetting(BoneContainer, BoneSettings.RightLittleDistal, FName(TEXT("pinky_03_r")));
}
```


