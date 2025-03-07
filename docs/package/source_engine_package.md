---
layout: default
nav_order: 1
title: 源码版引擎打包
parent: 打包部署
---
# 源码版引擎打包

从 UnrealEngine 源码编译的引擎（以下简称源码版引擎），打包和普通项目有一定差异，可以遵循以下步骤：


以下假设我们的项目名称为 **MyProject** (.uproject 中的 name 和文件名，文件夹均为 MyProject)，并且插件是放在项目的 **Plugins** 文件夹下:
> 只以 Windows 平台为例，**MediaPipe4U** 只支持 Win64 构建，如果你使用其他平台交叉编译，步骤可能稍有差异。

## 启用插件

MyProject.uproject 文件中 MediaPipe4U 用到的插件都已经 Enable, 如下文件：   

```json
{
	"FileVersion": 3,
	"EngineAssociation": "5.0",
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
		}
	]
}
```

> **MyPorject** 使用了所有的 **MediaPipe4U** 插件，如果你只需要动补功能，你只需要确保 **MediaPipe4U** 的 Enable 已经设置为 **true**。

---   


## 检查 LinkType

这是 MyProject 的 target.cs 文件示例：   

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

确保你的 **LinkType** 不是 **TargetLinkType.Modular**，**MediaPipe4U** 不支持 **Modular** 编译。   


{: .note }
> LinkType = TargetLinkType.Default; 这行不是必须的，默认是 **Default**。   
> LinkType = TargetLinkType.Monolithic 也是可以的，但是不能是 **Modular** 。   

---   

## 手动 Copy C++ 链接符号文件

- 在项目根目录下（.uproject 文件所在目录）新建 **copy_intermediate.bat** 文件，用记事本打开它，复制下面的文件内容：

```powershell
set TARGET_DIR=%~dp0Intermediate
set PLUGIN_DIR=%~dp0Plugins
set PROJECT_MODULE_NAME=MyProject


set DEV_DIR=%TARGET_DIR%\Build\Win64\%PROJECT_MODULE_NAME%\

xcopy /S /Y "%PLUGIN_DIR%\MediaPipe4U\Intermediate\Build\Win64\UnrealGame\" "%DEV_DIR%"
xcopy /S /Y "%PLUGIN_DIR%\GStreamer\Intermediate\Build\Win64\UnrealGame\" "%DEV_DIR%"
xcopy /S /Y "%PLUGIN_DIR%\MediaPipe4UGStreamer\Intermediate\Build\Win64\UnrealGame\" "%DEV_DIR%"
xcopy /S /Y "%PLUGIN_DIR%\MediaPipe4UBVH\Intermediate\Build\Win64\UnrealGame\" "%DEV_DIR%"
xcopy /S /Y "%PLUGIN_DIR%\MediaPipe4ULiveLink\Intermediate\Build\Win64\UnrealGame\" "%DEV_DIR%"
xcopy /S /Y "%PLUGIN_DIR%\MediaPipe4UNvAR\Intermediate\Build\Win64\UnrealGame\" "%DEV_DIR%"
xcopy /S /Y "%PLUGIN_DIR%\MediaPipe4Speech\Intermediate\Build\Win64\UnrealGame\" "%DEV_DIR%"

pause
```

**注意**：文件第三行中的 MyProject 改为你的项目名称，xcopy 部分可以注释掉你没有用到的插件。

- 保存 **copy_intermediate.bat** 文件

- 鼠标双击执行 **copy_intermediate.bat**
  
{: .new-title }
> 这个脚本做了什么 ?
>
> 执行脚本后会把链接符号复制到你的项目 Build 目录, 这样你在编译时就不会出现 LINK 2XXX 错误。
> Launcher 版引擎打包时会自动进行复制操作，源码版引擎不会，所以我们需要这个脚本手动执行这个操作。
>
> 
> xcopy /S /Y "%PLUGIN_DIR%\ `PluginName` \Intermediate\Build\Win64\UnrealGame\" "%DEV_DIR%"
>
> xcopy 命令这一行是一个固定格式用来复制一个插件的链接符号，每个插件都需要复制。
> 其中 `PluginName` 可以替换为一个项目中的插件（Plugins 文件夹中的任意插件目录）。
> 
> 你可以用这个脚本处理任何预编译的插件打包问题。
>

---   

## 打包你的项目

UnrealEngine 项目打包请参考文档：

[https://docs.unrealengine.com/5.0/packaging-unreal-engine-projects/](https://docs.unrealengine.com/5.0/packaging-unreal-engine-projects/)

如果一切顺利，现在你的项目就会成功打包了。



