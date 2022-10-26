---
sort: 4
---
# 回显图像

你可能希望在屏幕上显示图像源中的图像，**MediaPipe4U** 提供了回调函数，方便你在材质或 UMG 渲染图像源中的图片。

[![image callback](./images/texture_callback.jpg "Shiprock")](images/texture_callback.jpg)

**UMediaPipeHolisticComponent** 组件上提供了 OnVideoTextureCreated 事件，通过绑定该事件，你可以得到一个 Texture2D 对象，使用它来渲染。

> 视频动补、图片动补和摄像头动补均可以使用该事件。

蓝图实例如下：

[![OnVideoTextureCreated](./images/video_texture_created_event_blueprint.jpg "OnVideoTextureCreated")](images/video_texture_created_event_blueprint.jpg)


该事件是一个多播委托， C++ 定义如下：
```cpp
DECLARE_DYNAMIC_MULTICAST_DELEGATE_ThreeParams(FOnVideoTextureCreated, UTexture2D*, NewTexture, int, TextureWidth, int, TextureHeight);

UPROPERTY(Category="MediaPipe | VideoTexture", BlueprintAssignable)
FOnVideoTextureCreated OnVideoTextureCreated;
```


值得一提的是，为了方便你将图像绘制到 UMG 中，我们提供了一个 **SetTextureToImage** 蓝图函数帮助你对齐图像到 Canvas 的角落。   

如果你恰好是用 UImage 对象渲染图像，并且你的 UImage 控件放置于一个 Canvas 中，那么你可以使用该蓝图简化你的图像对齐和自动缩放操作。

该函数 C++ 定义如下：

```cpp
UFUNCTION(BlueprintCallable, Category="MediaPipe")
static bool UMediaPipeUtils::SetTextureToImage(UImage* Image, UTexture2D* Texture, int TextureWidth, int TextureHeight, float MaxImageWidthPercent, float MaxImageHeightPercent, EAnchorPosition AnchorPosition);
```
**SetTextureToImage** 参数说明：

该函数只有当你的 Image 放置在 Canvas 中才有效

| 参数 | 类型 | 说明 |
|------|-----|------|
|Image| UImage* | UMG 中的 Image 组件 |
|Texture| UTexture2D* | 要绘制到 Image 的纹理（图片）  |
|TextureWidth| int | 图片的宽度  |
|TextureHeight| int | 图片的高度  |
|MaxImageWidthPercent| float | 0~1 表示图片允许在 canvas 中的宽度最大占比（1 表示 100%）  |
|MaxImageHeightPercent| float | 0~1 表示图片允许在 canvas 中的高度最大占比（1 表示 100%）  |
|AnchorPosition| EAnchorPosition | 图片在 canvas 中的位置， 值说明参考下面的说明 |
   


>**AnchorPosition** 值
>
>TopLeft: 左上角    
>TopRight: 右上角   
>BottomLeft: 左下角   
>BottomRight: 右下角   
>TopCenter: 上方中央   
>BottomCenter: 下方中央   
>MiddleCenter: 正中