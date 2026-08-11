# Windows Packaging

In most cases, `MediaPipe4U` can be easily packaged and distributed together with your project, but there are some limitations.

## Limitations

1. `MediaPipe4U` does not support packaging projects built with a **source-built engine** where the project `LinkType` is set to `Modular`.
2. The packaging configuration of `MediaPipe4U` is `Development`. It only supports `Development` and `Shipping` packaging, and does **not** support `DebugGame`.
3. `MediaPipe4U` only supports the `Windows x64` platform and does not support other platforms (such as Windows x86, Windows ARM).

> In fact, when the project `LinkType` is set to `Modular`, `MediaPipe4U` can compile successfully under the **Development Editor** configuration and can be used normally in the Editor, but it may fail to compile under **Development / Shipping** configurations.

## Unreal Engine Types

For convenience, the documentation categorizes engines into two types:

1. `Source Build`: An engine built by downloading the Unreal Engine source code and compiling it yourself.
2. `Launcher Build`: An engine installed via Epic Games Launcher.

---

## Packaging Environment

For Windows packaging, refer to the [Environment Requirements](../install/requirement.en.md) for the MediaPipe4U requirements.

> Deployment environment for the packaged program:
>
> For the packaged application, you usually only need to install the latest Windows SDK and Visual C++ Redistributable, as Microsoft maintains backward compatibility for these components.
> However, the Windows SDK has minimum OS version requirements. For example, if you install the Windows 11 SDK (Ver: `10.0.22621`) and are running Windows 10, your Windows 10 version must not be lower than 1507.
>
> Visual C++ Redistributable ([Download](https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist))

!!! tip "Build Environment Check"

    You can open the following directory to check the installed VC versions:

    C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Tools\MSVC

    It is recommended to use MSVC version `14.38.33130` to build your project, since `MediaPipe4U` is built with this version.

    You can use Visual Studio Installer to install the required MSVC toolchains. For example, the toolchain corresponding to `14.38.33130` is:
    `MSVC v143 - VS 2022 C++ x64/x86 build tools (v14.38-17.8)`

## Configuring the Host MSVC Compiler Version

When multiple MSVC versions (VC toolchains) are installed on your machine, Unreal Engine will first try to find its preferred MSVC version. If that version is not found, it will use the latest available version installed on your system.

!!! tip

    Different versions of Unreal Engine have different preferred MSVC versions.

You can manually configure which MSVC version Unreal Engine uses by editing the Unreal Engine build configuration file, which is usually located at:

{++C:\Users\&lt;Your User Name&gt;\AppData\Roaming\Unreal Engine\UnrealBuildTool\BuildConfiguration.xml++}

Under the `WindowsPlatform` section in this XML file, add `CompilerVersion` to specify the MSVC version used by Unreal Engine.

The following example configures Unreal Engine to use MSVC version `14.38.33130`:

```xml
<?xml version="1.0" encoding="utf-8" ?>
<Configuration xmlns="https://www.unrealengine.com/BuildConfiguration">
	<VCProjectFileGenerator>
        <Version>VisualStudio2022</Version>
    </VCProjectFileGenerator>
    <WindowsPlatform>
        <Compiler>VisualStudio2022</Compiler>
        <CompilerVersion>14.38.33130</CompilerVersion>
    </WindowsPlatform>
</Configuration>
```

!!! tip

    Modifying `BuildConfiguration.xml` will cause **all** Unreal Engine versions on this machine to use MSVC `14.38.33130` when building projects.

    It is **not recommended** to use an excessively new MSVC version, as it will increase the MSVC runtime requirements on the target machine.
    Currently, `14.38.33130` is a very good choice.
    

## Configuring the MSVC Compiler Version for a Single Project

The `BuildConfiguration.xml` file described above changes the UE compiler version for the entire machine. If you only want to change it for an individual project, you can use one of the following approaches:

### Option 1: Hard-code It in Target.cs (Recommended)
Set it in the `.Target.cs` constructor under the project's `Source` directory. It takes effect after the configuration is loaded and can also override the local global XML configuration:
> UE must be a C++ project for these two files to exist.   

```csharp
public XXXTarget(TargetInfo Target) : base(Target)
{
    Type = TargetType.Editor;
    DefaultBuildSettings = BuildSettingsVersion.V7;
    IncludeOrderVersion = EngineIncludeOrderVersion.Latest;
    ExtraModuleNames.Add("RPG_G1");

    WindowsPlatform.CompilerVersion = "14.38.33130";
}
```

### Option 2: Project-level BuildConfiguration.xml
UBT also reads the configuration under the project directory, which has a higher priority than the local global configuration:       
```
<YouGameFolder>\Saved\UnrealBuildTool\BuildConfiguration.xml
```
Example content:
```
<?xml version="1.0" encoding="utf-8" ?>
<Configuration xmlns="https://www.unrealengine.com/BuildConfiguration">
    <WindowsPlatform>
        <CompilerVersion>14.38.33130</CompilerVersion>
    </WindowsPlatform>
</Configuration>
```

  

## Packaging with Launcher Build Engine

Packaging with a Launcher build engine requires no special handling. You can package the project normally.
For details on how to package Unreal Engine projects, please refer to the official Unreal Engine documentation:

https://docs.unrealengine.com/packaging-unreal-engine-projects

## Packaging with Source Build Engine

Packaging with a source-built Unreal Engine (hereafter referred to as *source build engine*) differs from normal projects. Follow the steps below:

Assume the project name is **MyProject** (the name in the `.uproject` file, file name, and folder name are all `MyProject`), and the plugins are placed in the project’s `Plugins` directory:

> On Windows, `MediaPipe4U` only supports Win64 builds. If you are cross-compiling for other platforms, the steps may differ slightly.

### Enable Plugins

In the `MyProject.uproject` file, all plugins used by `MediaPipe4U` are already enabled, as shown below:

```json
{
	"FileVersion": 3,
	"EngineAssociation": "5.1",
	"Category": "",
	"Description": "",
	"Modules": [
		{
			"Name": "MyProject",
			"Type": "Runtime",
			"LoadingPhase": "Default"
		}
	],
	"Plugins": [
		{
			"Name": "ModelingToolsEditorMode",
			"Enabled": true,
			"TargetAllowList": [
				"Editor"
			]
		},
		{
			"Name": "MediaPipe4U",
			"Enabled": true
		},
		{
			"Name": "MediaPipe4UPremium",
			"Enabled": true
		},
        {
			"Name": "MediaPipe4UMotion",
			"Enabled": true
		},
		{
			"Name": "GStreamer",
			"Enabled": true
		},
		{
			"Name": "MediaPipe4UGStreamer",
			"Enabled": true
		},
		{
			"Name": "MediaPipe4ULiveLink",
			"Enabled": true
		},
		{
			"Name": "MediaPipe4UBVH",
			"Enabled": true
		},
		{
			"Name": "MediaPipe4UNvAR",
			"Enabled": true
		},
		{
			"Name": "MediaPipe4USpeech",
			"Enabled": true
		},
        {
			"Name": "MediaPipe4ULLM",
			"Enabled": true
		},
        {
			"Name": "MediaPipe4ULLMSpeech",
			"Enabled": true
		}
	]
}
```

> In the **MyProject** example, the project enables every plugin in the current release package. You can select only the plugins you need, but must also enable their direct dependencies listed in [Plugins and Dependencies](./plugin_content.en.md). For example, motion capture requires at least `MediaPipe4U`, `MediaPipe4UPremium`, and `MediaPipe4UMotion`.

---

### Check LinkType

Below is an example of the **MyProject** `Target.cs` file:

```csharp
using UnrealBuildTool;
using System.Collections.Generic;

public class MyProjectTarget : TargetRules
{
	public MyProjectTarget( TargetInfo Target) : base(Target)
	{
		Type = TargetType.Game;
		LinkType = TargetLinkType.Default; // Here can not be Modular
		DefaultBuildSettings = BuildSettingsVersion.V2;
		ExtraModuleNames.AddRange( new string[] { "MyProject" } );
	}
}
```

Make sure `LinkType` is **not** `TargetLinkType.Modular`. `MediaPipe4U` does not support **Modular** builds.

!!! tip

    `LinkType = TargetLinkType.Default;` is not mandatory, as `Default` is the default setting.
    `LinkType = TargetLinkType.Monolithic` is also supported, but **Modular** is not.

---

### Copy C++ Link Symbol Files

- Create a new file named `copy_intermediate.bat` in the project root directory (where the `.uproject` file is located), open it with Notepad, and paste the following content:

```powershell

set TARGET_DIR=%~dp0Intermediate
set PLUGIN_DIR=%~dp0Plugins
set PROJECT_MODULE_NAME=MyProject


set DEV_DIR=%TARGET_DIR%\Build\Win64\%PROJECT_MODULE_NAME%\

xcopy /S /Y "%PLUGIN_DIR%\MediaPipe4U\Intermediate\Build\Win64\UnrealGame\" "%DEV_DIR%"
xcopy /S /Y "%PLUGIN_DIR%\MediaPipe4UPremium\Intermediate\Build\Win64\UnrealGame\" "%DEV_DIR%"
xcopy /S /Y "%PLUGIN_DIR%\MediaPipe4UMotion\Intermediate\Build\Win64\UnrealGame\" "%DEV_DIR%"
xcopy /S /Y "%PLUGIN_DIR%\GStreamer\Intermediate\Build\Win64\UnrealGame\" "%DEV_DIR%"
xcopy /S /Y "%PLUGIN_DIR%\MediaPipe4UGStreamer\Intermediate\Build\Win64\UnrealGame\" "%DEV_DIR%"
xcopy /S /Y "%PLUGIN_DIR%\MediaPipe4UBVH\Intermediate\Build\Win64\UnrealGame\" "%DEV_DIR%"
xcopy /S /Y "%PLUGIN_DIR%\MediaPipe4ULiveLink\Intermediate\Build\Win64\UnrealGame\" "%DEV_DIR%"
xcopy /S /Y "%PLUGIN_DIR%\MediaPipe4UNvAR\Intermediate\Build\Win64\UnrealGame\" "%DEV_DIR%"
xcopy /S /Y "%PLUGIN_DIR%\MediaPipe4USpeech\Intermediate\Build\Win64\UnrealGame\" "%DEV_DIR%"
xcopy /S /Y "%PLUGIN_DIR%\MediaPipe4ULLM\Intermediate\Build\Win64\UnrealGame\" "%DEV_DIR%"
xcopy /S /Y "%PLUGIN_DIR%\MediaPipe4ULLMSpeech\Intermediate\Build\Win64\UnrealGame\" "%DEV_DIR%"

pause
```

**Note**: Replace `MyProject` on the third line with your actual project name. You can comment out the `xcopy` lines for plugins you are not using.

- Save the `copy_intermediate.bat` file
- Double-click to execute **copy_intermediate.bat**

!!! tip

    What does this script do?

    After running the script, it copies link symbols into your project’s Build directory, preventing LINK 2XXX errors during compilation.
    Launcher build engines perform this copying automatically during packaging, but source build engines do not, which is why this manual step is required.

    xcopy /S /Y "%PLUGIN_DIR%\ `PluginName` \Intermediate\Build\Win64\UnrealGame\" "%DEV_DIR%"

    This `xcopy` command is a fixed pattern used to copy link symbols for a plugin. Each plugin requires one such copy command.
    `PluginName` can be replaced with any plugin directory under the `Plugins` folder.

    You can use this script to handle packaging issues for any precompiled plugin.

---

### Package Your Project

If everything goes smoothly, your project should now be packaged successfully.
