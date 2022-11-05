---
sort: 100
---
# 运行时动画重定向 (C++)

> <mark>这是一个实验性功能，不保证任意场景可用性</mark>

运行时动画重定向允许同一类型的模型（相同骨骼但蒙皮的同的角色模型，例如两个 VRM 模型，两个 metahuman 模型）之间传递骨骼动画和表情。

---   
**解决的问题**

在运行时提供 UE 的骨骼重定向（IK Retargeter）类似的能力。通常用于满足运行时加载用户模型的需求。

例如运行时动态加载 VRM 模型的功能，VRM 模型的骨架都是相同的结构 ，由于 IK Retargeter 是骨架绑定的，只能支持在 Editor 中制作重定向资产（IKRig 和 IKRetargeter），这个场景可以借助 MediaPipe4U 的重定向功能完成。

---   
## 限制
运行时重定向需要保证源（MediaPipeAnimInstance 的角色）和目标（要复制动画的目标）具有完全相同的人形骨骼层级和保证两个骨架（skeleton）对应的每个骨骼朝向一致，但是并不要求每个骨骼的名称相同。

---   
## 使用方法

通过在 **USkeletalMeshComponent** 设置动画类为 **URuntimeRetargetAnimInstance** 类型并配置重定向参数，不完全代码参考如下：

```cpp
//mesh is USkeletalMeshComponent*
mesh->SetAnimInstanceClass(URuntimeRetargetAnimInstance::StaticClass());
auto* animInstance = mesh->GetAnimInstance();
if(auto* vrmRetargetAnimInstance = Cast<URuntimeRetargetAnimInstance>(animInstance))
{
    /*
    config retarget asset.
    SourceSkeletalMesh: source USkeletalMeshComponent 
    SourceBones: source bone mapping
    TargetBones: target bone mapping
    */
    vrmRetargetAnimInstance->ConfigureRetarget(SourceSkeletalMesh, SourceBones, TargetBones)
}
```