# Quick Start

Using MediaPipe4U for motion capture requires only three steps:

1. Prepare runtime components: create an Unreal Engine `Actor` containing the runtime components.
2. Prepare a motion-capture character: create an Unreal Engine `Character` to display the animation.
3. Start motion capture: create a Blueprint that starts the motion-capture program.

If your Unreal Engine project is ready and MediaPipe4U is installed, this tutorial takes only about 3-5 minutes.


## Prepare Runtime Components

Create an **Actor** and add `MediaPipeHolisticComponent`.   

This example names the Actor `Actor_QuickStart_Runtime`.   
Add these components:   

- `MediaPipeHolisticComponent`: core motion-capture algorithm component
- `StaticImageSourceComponent`: optional; captures motion from a single image
- `GStreamerImageSourceComponent`: optional; captures motion from a video file

The completed `Actor_QuickStart_Runtime` should look like this:


![Actor_QuickStart_Runtime](./images/quick_start/prepare_runtime_actor.jpg "Actor_QuickStart_Runtime")


## Prepare the Motion-Capture Character

### Create an Animation Blueprint

Create an **Animation Blueprint** with `MediaPipeAnimInstace` as its base class and use Unreal Engine 5's built-in `SK_Mannequin` as its skeletal mesh.  

This example names it `ABP_Mannequins_MediaPipe`.

![ABP_Mannequins_MediaPipe](./images/quick_start/create_anim_blueprint.jpg "ABP_Mannequins_MediaPipe")

Open it and add these Blueprint nodes in order:

- `MediaPipePoseSolver`: pose solver
- `MediaPipeHandSolver`: hand/finger solver
- `MediaPipeLocationSolver`: location/translation solver
- `MediaPipeHeadSolver`: head solver

![ABP_Mannequins_MediaPipe](./images/quick_start/anim_blueprint_graph.jpg "ABP_Mannequins_MediaPipe")

Save and compile the Animation Blueprint.

### Create a Character

Create a **Blueprint** based on `Character`; this example names it `Character_MediaPipe`.

![Character_MediaPipe](./images/quick_start/create_character.jpg "Character_MediaPipe")

Open `Character_MediaPipe`, select Class Defaults, choose the `Skeletal Mesh` asset in Details, and set `Anim Class` to `ABP_Mannequins_MediaPipe`.

![Character_MediaPipe](./images/quick_start/character_details.jpg "Character_MediaPipe")

Save and compile the Character Blueprint.


## Start Motion Capture

### Create a Level

Create a Level named `QuickStart` in this example.

Place these Blueprints in the Level:

- `Character_MediaPipe`: motion-capture Character.
- `Actor_QuickStart_Runtime`: runtime-component Actor.

![level_quickstart](./images/quick_start/level_quickstart.jpg "level_quickstart")

### Edit the Level Blueprint

Open the Level Blueprint and add the following nodes.

![start_camera_async](./images/quick_start/start_camera.jpg "start_camera_async")

Save and compile the Level Blueprint.

### Run the Level

Run the Level. It opens the camera and drives the 3D character with captured human motion.


## Capture Motion from a Video File

Modify the Level Blueprint to use `GStreamerImageSourceComponent`.

![start_video_file](./images/quick_start/start_video_file.jpg "start_video_file")

Save and compile, then rerun the Level to capture motion from `C:\my_video.mp4` and drive the character.


## Capture Motion from an Image File

Modify the Level Blueprint to use `StaticImageSourceComponent`.

![start_image_file](./images/quick_start/start_image_file.jpg "start_image_file")

Save and compile, then rerun the Level to capture motion from `C:\my_picture.jpg` and drive the character.
