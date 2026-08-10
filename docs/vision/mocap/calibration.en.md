# Calibration

MediaPipe4U uses a calibration-free camera design and therefore cannot obtain physical camera parameters. Calibrating the character before motion capture corrects inaccurate position, leaning, and related issues.

Calibration has two parts:

- Pose calibration: corrects character leaning and legs that cannot fully extend.
- Location calibration: corrects an incorrect initial character position.
     
---   
## Overview

By default, MediaPipe4U starts a countdown before each capture and performs pose and location calibration when it ends.   
Control this behavior with `CalibrationCountdownSeconds` and `CalibrationPolicy` on MediaPipeAnimInstance.   

| Property | Description |
|-----|------|
|CalibrationCountdownSeconds|Countdown duration in seconds.|
|CalibrationPolicy|Countdown calibration behavior when capture starts.|

!!! tip

    CalibrationPolicy values:   
    
    **CountdownOnStart**: Count down and calibrate whenever capture starts.   
    **Manual**: Do not count down when capture starts.


### Runtime Countdown Calibration

With `CalibrationPolicy` set to **Manual**, MediaPipe4U does not start a countdown.   
Call `StartCalibrationCountdown` on `MediaPipeAnimInstance` at any time to start one manually.     
 
[![calibration](./images/calibration/start_countdown.jpg "calibration")](./images/calibration/start_countdown.jpg)   
   
   
Call **CancelCalibrationCountdown** on MediaPipeAnimInstance to cancel it.   
[![calibration](./images/calibration/cancel_countdown.jpg "calibration")](./images/calibration/cancel_countdown.jpg)   

 **Control Pose and Location Calibration**

By default, countdown completion calibrates location but not pose. Control this on the Animation Blueprint nodes.   

- **CountdownCalibrationEnabled** on MediaPipe Pose Solver controls pose calibration.   
- **CountdownCalibrationEnabled** on MediaPipe Location Solver controls location calibration.

!!! wanring
    
    Location calibration: a character cannot move until location calibration runs. If countdown location calibration is disabled, implement manual location calibration. 

[![calibration](./images/calibration/anim_nodes.jpg "calibration")](./images/calibration/anim_nodes.jpg)   

The Blueprint function **SetCountdownCalibrationEnabled** provides the same control.

> **SetCountdownCalibrationEnabled** returns whether the operation succeeded; normally this return value can be ignored.

[![calibration](./images/calibration/set_enabled.jpg "calibration")](./images/calibration/set_enabled.jpg)   

!!! tip

    Pose calibration requires the person to stand in a standard pose, so it is normally unsuitable for video capture unless the video begins with several seconds in that pose.    
    
    Before video capture, call **SetCountdownCalibrationEnabled** in Blueprint to disable countdown pose calibration.

    C++ can perform the same operation through static functions on `UMediaPipeMotionUtils`.


### Pose Calibration Invalidation

Some runtime operations invalidate pose calibration and require recalibration.

!!! warning

    Pose-calibration data is reset when these settings change at runtime:   
       
    - Disable/enable spine pitch (SpinePitchEnable)   
    - Spine pitch span (SetHipPitchSpan)   
    - Joint-lock state
       
    - For spine pitch and span concepts, read [Pose Solver: Spine Rotation Mode](../features/pose_solver.md).
  
---     

### Manual Calibration
In addition to countdown calibration, calibrate pose or location immediately in Blueprint or C++ as described below.
 
## Pose Calibration

Pose calibration records current joint angles as correction angles and applies them to every capture frame to correct bone-rotation offsets.   

 [![calibration](./images/calibration/effect.jpg "calibration")](./images/calibration/effect.jpg)

Pose calibration is applied to the MediaPipe Pose Solver Animation Blueprint node.

- Call `CalibratePose` on MediaPipeAnimInstance to calibrate pose.      
- Call `UnCalibratePose` to clear pose-calibration data.   



[![calibration](./images/calibration/calibrate_pose.jpg "calibration")](./images/calibration/calibrate_pose.jpg)


Use `Calibration` to control which joints are calibrated.

[![calibration](./images/calibration/pose_calibration_prop.jpg "calibration")](./images/calibration/pose_calibration_prop.jpg)


Use `SetPoseCalibrationFlags` from the Blueprint function library to change calibrated joints at runtime.

[![calibration](./images/calibration/set_pose_flags.jpg "calibration")](./images/calibration/set_pose_flags.jpg)

> `SetPoseCalibrationFlags` returns whether the operation succeeded; normally this can be ignored.

---

## Location Calibration

Location calibration captures an image and simulates parameters such as camera FOV to calculate the relationship between camera and 3D coordinates.

- Call `CalibrateLocation` on `MediaPipeAnimInstance` to calibrate location.      
- Call `UnCalibrateLocation` to clear location-calibration data.   

 [![calibration](./images/calibration/calibrate_location.jpg "calibration")](./images/calibration/calibrate_location.jpg)
