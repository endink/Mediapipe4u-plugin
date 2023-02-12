---
sort: 7
---

# 切换动画蓝图

你可能因为各种原因，需要在程序运行以后改变骨骼网格体上的动画蓝图。   

不论是蓝图还是 C++，你都可以通过设置 **USkeletalMeshComponent** 的 **SetAnimInstanceClass** 函数来改变一个骨骼体的动画蓝图。

[![蓝图操作](images/set_anim_instance_class.jpg "Shiprock")](images/set_anim_instance_class.jpg)   


然后，当你切换到一个 **MediaPipeAnimInstace** 的蓝图时，你还需要将动画蓝图连接到 MediaPipe 。    

## 蓝图中切换动画蓝图

在蓝图中你可以使用 **MediaPipeAnimInstace** 的 **ConnectToMediaPipeInLevel** 函数完成这个过程：


[![蓝图操作](images/reinitailize_mediapipe_anim.jpg "Shiprock")](images/reinitailize_mediapipe_anim.jpg)   、

>注意: **ConnectToMediaPipeInLevel** 具有 bool 类型的返回值，用来指示连接 MediaPipe 是否成功

## C++ 中切换动画蓝图

如果你使用 C++ 编程，可以调用 **MediaPipeAnimInstace::Reinitailize** 函数完成这个过程： 

```cpp
USkeletalMeshComponent* Mesh = XXXX;
UClass* AnimInstanceClass = UMediaPipeAnimInstance::StaticClass(); //This should be your Blueprint class
Mesh->SetAnimInstanceClass(AnimInstanceClass);
UAnimInstance* AnimInstance = Mesh->GetAnimInstance();
if(UMediaPipeAnimInstance* MediaPipeAnimInstance = Cast<UMediaPipeAnimInstance>(AnimInstance))
{
    if(MediaPipeAnimInstance->ConnectToMediaPipeInLevel())
    {
        // switch ok
    }
    else
    {
        // switch fault
    }
}
```
