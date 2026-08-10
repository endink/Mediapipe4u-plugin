
# Start Motion Capture

## Camera Motion Capture

Call the **StartCamera** function of **MediaPipeHolisticComponent** to start camera motion capture. When called from Blueprint, it looks roughly like this:

[![MediaPipe Runtime Actor](./images/start_camera.jpg "Shiprock")](images/start_camera.jpg)   

StartCamera parameter description

|Parameter|Description|
|-------------|----------------|
|DeviceId|Camera ID; usually, 0 represents the first camera on the PC|
|ResolutionX |Horizontal camera resolution|
|ResolutionY |Vertical camera resolution|

> Note: Cameras generally support many resolutions. Larger images are not always better; overly large images reduce computational efficiency. 1280*720 is recommended.


## Image Motion Capture

Call the **StartImageSource** function of **MediaPipeHolisticComponent**, passing in StaticImageSouceComponent. The method is straightforward, so refer to the Blueprint node below:


[![Image Motion Capture](./images/start_static_image.jpg "Shiprock")](images/start_static_image.jpg)   


## Video Motion Capture

Call the **StartImageSource** function of **MediaPipeHolisticComponent**, passing in GStreamerImageSourceComponent:   

> After starting MediaPipe, also call the **Start** function of **GStreamerImageSource** to begin video playback.

[![Image Motion Capture](./images/start_vedio.jpg "Shiprock")](images/start_vedio.jpg)   


## Stop Motion Capture

Call the **Stop** function of **MediaPipeHolisticComponent**. Pass GStreamerImageSourceComponent to StartImageSource:   
> After stopping MediaPipe, also stop GStreamerImageSource playback (call the **Stop** function of **GStreamerImageSource**).


[![Stop Motion Capture](./images/stop_mediapipe.jpg "Shiprock")](images/stop_mediapipe.jpg)   
