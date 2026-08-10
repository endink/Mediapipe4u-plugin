# Custom Solutions (C++)

If the built-in facial-capture algorithms do not meet your needs, use **C++** to develop and integrate your own algorithm with `MediaPipe4U`.

Facial-capture algorithms in `MediaPipe4U` are abstracted by the `IFaceSolution` C++ interface. Implement `IFaceSolution` to add your own solution.


## Basic Process

Adding a custom `IFaceSolution` requires these steps:

- Implement the `IFaceSolution` interface.
- Register your `IFaceSolution` implementation.
- Use your solution in `MediaPipeFaceLinkActor`.
- Unregister it when it is no longer needed (optional).

The remainder of this document describes the process in detail.

### Implement a Solution 

`IFaceSolution` abstracts a facial-capture solution. The interface is defined as follows:

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

#### Functions
|Function| Description  |
|-----|---------|
|IsEnabled| Whether the solution is available. Implement this function to dynamically control availability internally.<br/> For example, the solution should be unavailable during `Initialize`, so return **false**. |
|Initialize| Initializes the solution. Use the supplied `FFaceSolutionInitializationContext` to initialize your algorithm. |
|UnInitialize| Unloads and cleans up the solution. |
|IsSolveFromImageFrame| Indicates whether the solution needs `MediaPipe4U` to deliver images (`IMediaPipeTexture`) for computation.<br/> Examples:<br> The `Remoting` solution needs no image delivery because it calculates expressions from the Android camera image.<br/> The `NvAR` solution calculates expressions from images in `MediaPipe4U` supplied by an Image Source.   |
|SolveFrame | When `IsSolveFromImageFrame` returns **true**, this function receives images from `MediaPipe4U` and calculates expressions. |
| OnFaceBlendShapesSolved | Event triggered when expression solving completes. |

When your solution has solved an expression, notify `MediaPipe4U` through the `FOnFaceBlendShapesSolved` event returned by `OnFaceBlendShapesSolved`.
`MediaPipe4U` applies the result to the 3D character.


## Register a Solution

A solution is usually registered when its Module loads.   
A solution normally requires a **unique** name, supplied during registration.   
Call `RegisterSolution` on `FFaceSolutionManager` to register it.   


!!! tip

    `FFaceSolutionManager` is a singleton. Obtain its instance through the static `Get` function.   

    `MediaPipe4U` requires the solution instance to be registered as a shared pointer (`TSharedPtr`).

For example, NvAR is registered as follows:

```cpp
FFaceSolutionManager::Get().RegisterSolution(FName("NvAR"), MakeShared<FNvARFaceSolution>());
```

## Use a Solution

Set `FaceSolution` on `MediaPipeFaceLinkActor` to the registered solution name to use it for facial capture.

## Unregister a Solution

Normally, unregister your solution when its Module unloads.

Call `UnregisterSolution` on `FFaceSolutionManager`.   

For example, NvAR is unregistered as follows:

```cpp
FFaceSolutionManager::Get().UnregisterSolution(FName("NvAR"));
```


