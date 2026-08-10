# Switching Between Upper-body and Full-body Motion Capture

MediaPipe4U supports switching between upper-body and full-body motion capture. Upper-body motion capture locks the pelvis (Hips joint) and lower limbs (Legs).

## Upper-body Motion Capture Optimization

In upper-body motion-capture mode, MediaPipe4U applies an additional filter to the spine to remove body jitter.


## Usage

- The MediaPipeUtils::SetMediaPipeAnimationMode function can switch between full-body and upper-body modes for an Actor that contains MediaPipeAnimInstance.
- The Mode field of MediaPipeAnimInstance can also switch between full-body and upper-body modes.
