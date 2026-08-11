
# Windows 打包

一般情况下， `MediaPipe4U` 能够很容易的和你的项目一起打包发布，但是也有一些限制条件。   

## 限制

1. `MediaPipe4U` 不支持通过源码构建引擎并且项目（project）的 `LinkType` 设置为 `Modular` 的项目打包。
2. `MediaPipe4U` 的打包配置是 `Development` ，只支持 `Development` 和 `Shipping` 打包，不支持 `DebugGame` 打包。
3. `MediaPipe4U` 只支持 `Windows x64` 平台，不支持其他平台 (如 Windows X86, Windows ARM ) 打包。

> 事实上，当项目（project）的 `LinkType` 设置为 `Modular` 时， `MediaPipe4U` 可以在 Development Editor 配置下编译成功，即在 Editor 中可以正常使用，但可能无法通过 Development/Shipping 编译。   
  

## Unreal Engine 类型

为了方便描述，文档中把引擎分为两种：

1. `源码版`： 下载 UnrealEngine 源码自己编译的引擎。   
2. `Launcher 版`：使用 Epic Game Launcher 安装的引擎。
   
---  

## 打包环境

MediaPipe4U 的 Windows 打包环境要求以[环境要求](../install/requirement.md)为准。

> 打包后程序的部署环境：    
> 
> 对于打包后的程序， 通常你只需要下载最新的 Windows SDK 和 Visual C++ Redistributable， 因为微软会保持这些组件向后兼容。    
> 但是 Windows SDK 会对你的系统最低版本有要求。例如你下载了 Windows 11 SDK (Ver: `10.0.22621`) ，如果你使用的是 Windows 10, 会要求你的 Windows 10 版本不能低于 1507。 
>
> Visual C++ Redistributable ([下载地址](https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist))


!!! tip "编译环境检查"

    你可以打开以下目录查看你已经安装的 VC 版本:

    C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Tools\MSVC   

    推荐你使用 `14.38.33130` 版本的 MSVC 来构建你的工程，因为 `MediaPipe4U` 使用这个版本的 VC 来编译。    

    你可以使用 Visual Sutdio Installer 来安装 MSVC 相关的工具链，例如 `14.38.33130` 对应的 toolchain 为：    
    `MSVC v143 - VS 2022 C++ x64/x86 build tools (v14.38-17.8)`
    

## 为主机配置 MSVC 编译器版本

当你的机器下安装了多个 MSVC （这里的 MSVC 指 VC Toolchain）版本时， Unreal Engine 会先尝试查找引擎首选的 MSVC 版本来编译，如果找不到这个版本的 MSVC， 将使用你机器上的最新版本。    

!!! tip

    不同版本的 Unreal Engine 有不同的首选 MSVC 版本。

你可以通过以下方式，手动配置 Unreal Engine 构建使用的 MSVC 版本。

编辑 Unreal Engine 的 Build 配置文件，这个文件通常在如下位置：

{++C:\Users\&lt;Your User Name&gt;\AppData\Roaming\Unreal Engine\UnrealBuildTool\BuildConfiguration.xml++}

在这个 XML 文件的配置节 `WindowsPlatform` 下添加 `CompilerVersion` 配置 Unreal Engine 使用指定 MSVC 版本编译。

下面的例子展示了配置 Unreal Engine 使用 `14.38.33130` 版本的 MSVC 编译。

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

    修改 `BuildConfiguration.xml` 会使本机所有版本的 Unreal Engine 都使用 MSVC `14.38.33130` 编译工程。 

    **不建议**使用太高的`MSVC`版本构建项目，因为这会使得最终运行程序的机器 MSVC 版本要求很高。    
    目前看来 `14.38.33130` 是一个很好的选择。
    

## 为单个项目配置 MSVC 编译器版本

上述的 BuildConfiguration.xml 将修改整个机器上的 UE 编译器版本，如果你只想为个别项目修改，可以使用如下方案：

### 方案 1：在 Target.cs 里写死（推荐）
在项目 Source 目录的 .Target.cs / .Target.cs 构造函数里设置，会在配置加载之后生效，同样能覆盖本机全局 XML：
> UE 必须是 C++ 项目才有这两个文件   

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

### 方案 2：项目级 BuildConfiguration.xml
UBT 会额外读取项目目录下的配置，且优先级高于本机全局配置：       
```
<YouGameFolder>\Saved\UnrealBuildTool\BuildConfiguration.xml
```
内容示例：
```
<?xml version="1.0" encoding="utf-8" ?>
<Configuration xmlns="https://www.unrealengine.com/BuildConfiguration">
    <WindowsPlatform>
        <CompilerVersion>14.38.33130</CompilerVersion>
    </WindowsPlatform>
</Configuration>
```

  

## Launcher 版引擎打包

Launcher 版引擎构打包不需要特别处理，正常打包即可，文档不做说明，关于如何打包 Unreal Engine 项目，请查阅 Unreal Engine 官方文档：   

[https://docs.unrealengine.com/packaging-unreal-engine-projects](https://docs.unrealengine.com/packaging-unreal-engine-projects)

## 源码版引擎打包

从 UnrealEngine 源码编译的引擎（以下简称源码版引擎），打包和普通项目有一定差异，可以遵循以下步骤：

以下假设我们的项目名称为 **MyProject** (.uproject 中的 name 和文件名，文件夹均为 MyProject)，并且插件是放在项目的 `Plugins` 文件夹下:

> 在 Windows 平台上，`MediaPipe4U` 只支持 Win64 构建，如果你使用其他平台交叉编译，步骤可能稍有差异。

### 启用插件

`MyProject.uproject` 文件中 `MediaPipe4U` 用到的插件都已经 Enable, 如下文件：   

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

> **MyPorject** 例子中，工程启用了当前发布包中的所有插件。你可以根据需求选择插件，但必须同时启用[插件和依赖](./plugin_content.md)中列出的直接依赖；例如只使用动作捕捉时，至少需要 `MediaPipe4U`、`MediaPipe4UPremium` 和 `MediaPipe4UMotion`。

---   


### 检查 LinkType

这是 **MyProject** 的 target.cs 文件示例：   

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

确保你的 `LinkType` **不是** TargetLinkType.Modular，`MediaPipe4U` 不支持 **Modular** 编译。   


!!! tip

    LinkType = TargetLinkType.Default; 这行不是必须的，默认是 **Default**。      
    LinkType = TargetLinkType.Monolithic 也是可以的，但是不能是 **Modular** 。   

---   

### 复制 C++ 链接符号文件

- 在项目根目录下（.uproject 文件所在目录）新建 `copy_intermediate.bat` 文件，用记事本打开它，复制下面的文件内容：

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

**注意**：文件第三行中的 MyProject 改为你的项目名称，xcopy 部分可以注释掉你没有用到的插件。

- 保存 `copy_intermediate.bat` 文件

- 鼠标双击执行 **copy_intermediate.bat**
  
!!! tip

    这个脚本做了什么 ?
    
    执行脚本后会把链接符号复制到你的项目 Build 目录, 这样你在编译时就不会出现 LINK 2XXX 错误。
    Launcher 版引擎打包时会自动进行复制操作，源码版引擎不会，所以我们需要这个脚本手动执行这个操作。
    
    
    xcopy /S /Y "%PLUGIN_DIR%\ `PluginName` \Intermediate\Build\Win64\UnrealGame\" "%DEV_DIR%"
    
    xcopy 命令这一行是一个固定格式用来复制一个插件的链接符号，每个插件都需要复制。
    其中 `PluginName` 可以替换为一个项目中的插件（Plugins 文件夹中的任意插件目录）。
    
    你可以用这个脚本处理任何预编译的插件打包问题。

---   

### 打包你的项目

如果一切顺利，现在你的项目就会成功打包了。
