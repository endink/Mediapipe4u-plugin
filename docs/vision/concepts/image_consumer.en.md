# Image Consumer (C++)

## Architecture

MediaPipe4U vision tasks continuously process frames from an image source. MediaPipe4U combines multiple AI and AR technologies, such as Google MediaPipe and Nvidia NvAR,
most of which consume image frames for computation. MediaPipe4U uses a publish/subscribe (PUB/SUB) pattern to deliver images to these technologies and integrate their vision processing.

> For image sources, read [Image Source](./image_source.md).

A simple workflow is shown below:

[![NvAR](./images/image_consumer/Image_work_flow.jpg "NvAR")](./images/image_consumer/Image_work_flow.jpg)

All `ImageConsumer` instances consume the **same frame** and run **serially**. This simplifies low-level thread management and reduces memory copying.
Consequently, an `ImageConsumer` must not consume an image synchronously, because synchronous consumption blocks the next Consumer from receiving the frame.

!!! tip

    Recommended **ImageConsumer** pattern: buffer a queue. When a frame arrives, simply Enqueue it, then Dequeue and consume it in a background-thread loop or in a UE component's Tick event.

---  

## ImageFrame Lifecycle

All consumers share the same frame, reducing memory copies and improving efficiency, but the frame must be released at the correct time.    
 
**Pooling**   

`ImageSource` maintains a frame-object memory pool. After all consumers finish, the frame returns to the pool and its memory can be reused, reducing frequent allocation and release.
When other idle frames remain in the pool, a slow consumer does not prevent other consumers from processing in parallel.

!!! warning

    If an **ImageConsumer** holds a frame for a long time because `Consume` does not return, the `ImageSource` pool fills up. With no free memory, `ImageSource` stops distributing frames.
 

---


## Implement IImageConsumer in C++

MediaPipe4U abstracts an `ImageConsumer` as a C++ interface, not an Unreal Engine interface and therefore unavailable in Blueprint. Implement it to integrate image-processing functionality with MediaPipe4U.

```cpp

class IImageConsumer
{
public:
	virtual ~IImageConsumer() = default;
	virtual  bool CanConsume() = 0;
	virtual bool Consume(const FImageSourceInfo& SourceInfo, const TSharedPtr<IMediaPipeTexture>& Texture) = 0;
};


```
`IImageConsumer` functions:

|Function|Description|Notes|
|----|----|----|
| CanConsume | Returns **true** when frames can be consumed, causing ImageSource to call Consume. Returns **false** when this Consumer does not accept frames. | Return **false** to effectively turn consumption off.|
| Consume | Consumes an image frame.<br/><br/>Parameters:<br/>`SourceInfo`: image height, width, format, and other information;<br/>`Texture`: pointer to the frame and its byte-array data. |:bangbang:**Note**:<br/>Do not implement `Consume` synchronously. Blocking the current thread prevents other Consumers from receiving frames.|

> **SourceInfo** and **Texture** are read-only and must not be modified.   
> **SourceInfo** stores frame information; **Texture** stores frame data.

**SourceInfo Structure**

```cpp

struct FImageSourceInfo
{
	int Width = 0;
	int Height = 0;
	int WidthStep = 0;
	MediaPipeImageFormat Format = MediaPipeImageFormat::UNKNOWN;
	bool bIsStatic = false;
	int CvMatType = 0;
	int NumOfChannels = 0;
	int ByteDepth = 0;
};
```

|Property|Description |
|----|----|
| Width | Image width in pixels. |
| Height | Image height in pixels. |
| WidthStep | Row-data stride. MediaPipe4U ImageSources use no byte alignment, so it can be treated as Width * NumOfChannels. |
| Format | Format. For UE compatibility, MediaPipe4U currently uses RGBA and BGRA, although the enum defines all MediaPipe-supported formats. | 
| IsStatic | Whether the frame is static: static frames come from images; non-static frames come from video streams. | 
| CvMatType | Useful for OpenCV integration; currently only **CV_8U**. |
| NumOfChannels | Number of image channels. |
| ByteDepth | Bit depth. |   


> This information lets other image structures such as cv::Mat and NvImage be filled directly without copying memory.


**IMediaPipeTexture Interface**

**IMediaPipeTexture** is a simple image-data interface compatible with most popular image-processing libraries. GStreamer, OpenCV, and NvImage integrations are built in.

```cpp

class IMediaPipeTexture
{
public:
    virtual ~IMediaPipeTexture() = default;
    virtual long GetImageId() const = 0;
    //get uint8*
    virtual void* GetData() const = 0; // currently only a uint8 array
    virtual void Release() = 0;
    virtual long DataSize() const = 0;
};

```

|Function|Description|
|----|----|
| GetImageId | Frame ID used internally by MediaPipe4U. Because frames are pooled, IDs repeat and are not unique image identifiers. |
| GetData | Array containing image data; currently only **uint8**. |
| DataSize | Image-data size in bytes: `num * sizeof(uint8)`. Because only **uint8** data is used, this also equals GetData.Num(). |
| Release | :bangbang: Never call this method. It returns memory to the pool. An `Image Consumer` does not manage the `IMediaPipeTexture` lifecycle. |




## Register and Unregister

After implementing `IImageConsumer`, register it with the MediaPipe4U vision workflow through `FImageWorkflow::RegisterConsumer`.

> `FImageWorkflow` is a singleton. Obtain its sole instance through static `Get`.

```cpp
TSharedPtr<IImageConsumer> yourInstance = MakeSharedable<IImageConsumer>(new YourImageConsumerClass());
FImageWorkflow::Get().RegisterConsumer(yourInstance);
```

Unregister it when it is no longer needed:

```cpp
FImageWorkflow::Get().UnregisterConsumer(yourInstance);
```

> Alternatively, return **false** from `CanConsume` to stop it.   

!!! warning

    When a Consumer no longer needs frames, unregister or stop it to improve performance.

## Integrate with UObject

Because Unreal Engine `UInterface` participates in garbage collection, `IImageConsumer` is not a UE interface. MediaPipe4U provides an Unreal Engine wrapper interface for integration with Components and Actors:

```cpp
UINTERFACE()
class UImageConsumerProvider : public UInterface
{
	GENERATED_BODY()
};

/**
 * 
 */
class MEDIAPIPE_API IImageConsumerProvider
{
	GENERATED_BODY()
public:
	virtual IImageConsumer* GetImageConsumer() = 0;
};

```

Its single pure virtual C++ function returns your `IImageConsumer` implementation.
This wrapper must also be implemented in C++. Blueprint is unsupported because image processing affects the stability and performance of the entire MediaPipe4U pipeline.

> A Component can implement both `IImageConsumer` and `IImageConsumerProvider`, returning **this** from `GetImageConsumer` to wrap a UE component.   

NvAR provides an example:   

```cpp
//.h
UCLASS(BlueprintType)
class MEDIAPIPENVAR_API ANvARLiveLinkActor : public AActor, public IImageConsumer, public IImageConsumerProvider

//.cpp
IImageConsumer* ANvARLiveLinkActor::GetImageConsumer()
{
	return this;
}
```

`RegisterConsumer` and `UnregisterConsumer` on `FImageWorkflow` also accept `IImageConsumerProvider`.   

!!! warning

    When using `IImageConsumerProvider`, take care with UE garbage collection. If the implementation is a UComponent, consider `AddToRoot` to prevent collection.

Because `IImageConsumerProvider` is an Unreal Engine interface, register it through C++ or through the MediaPipe4U Blueprint function library.

Blueprint function names:

- RegisterImageConsumer
- UnregisterImageConsumer


[![ImageConsumer](./images/image_consumer/blueprint_register.jpg "ImageConsumer")](./images/image_consumer/blueprint_register.jpg)
