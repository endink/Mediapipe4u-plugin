# Motion-Capture Data Export 


## Export BVH 

Motion-capture data export is provided by the **MediaPipe4UBVH** extension plugin for **MediaPipe4U**. It captures skeletal animation while MediaPipe is running and saves it as a BVH file.   
The data-export feature depends on MediapPipeAnimInstance. It is tightly integrated with **MediapPipeAnimInstance** and cannot be used independently.


## Usage

1. Add MediaPipeBVHRecorder to the scene (it is an Actor).
   
2. Call the **Open** function to start recording.   
  
3. Call the **CloseAndSave** function (passing the path to save) to stop recording.

> You can also call **Close** to stop recording without saving data; this is typically used when the user cancels saving.

## Recording Settings

The following describes several fields of **MediaPipeBVHRecorder**:

| Field | Description |
| ---- | --- |
|FrameRate| Frame rate written to the data. It is independent of the actual frame rate, so motion-capture data can use a separate recording frame rate. |
|UseRootBone| Whether to use the root bone. When true, the first bone in the skeleton is used as the root bone; when false, the pelvis mapped by MediaPipe4U is used as the root bone. |
|AutoStop| Whether to stop recording automatically when MediapPipe capture stops (recording stops but recorded data is not cleared; call **Close** or **CloseAndSave** after stopping to complete the recording process). |
|AutoStop| Whether to stop recording automatically when MediapPipe stops. |
|FirstFrameWithRefPose|Whether to write the initial pose to the first frame of animation data.|
|DebugFormat|Whether to use the debug data format. This format is primarily for debugging; it is not a standard motion-capture data file, but it clearly shows the data for each joint.|
|HighPrecision| Whether to use high-precision data. Animation data retains two decimal places by default; when this field is **true**, six decimal places are retained.|




