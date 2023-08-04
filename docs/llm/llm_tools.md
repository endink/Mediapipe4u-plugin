---
layout: default
nav_order: 20
title: UE Editor 工具箱
parent: 大语言模型（LLM）
---

# UE Editor 工具箱

当你按照[使用 LLM](./usage.md)文档中的内容配置好 LLM 以后，制作界面仍然是一项耗费事件的事。
MediaPipe4ULLM 插件提供了可以 Unreal Editor 中使用的工具，方便你快速测试模型效果和直观的观看 LLM 的交互方式。

{: .highlight}
> 你可以参考[使用 LLM](./usage.md)文档的内容制作出和本工具一样的聊天界面。

## 如何使用    
按照[使用 LLM](./usage.md)文档中的步骤配置好模型，并且向场景中添加 `LLMActor`以后你就可以开始使用 LLM 工具和模型进行对话了。    

在 Unreal Engine Editor 打开依次打开菜单 `窗口（Windows）`>>`MediaPipe4U`>>`MediaPipe4U LLM`，你将看到 LLM 工具窗口。


[![LLM Tool](./images/llm_tools.jpg "LLM Tool")](./images/llm_tools.jpg)


### 功能

`Send`: 在输入框中输入聊天文字，点击 `Send` 按钮将发送聊天指令给 LLM。   
`Stop Completion`: 模型生成过程中点击`Stop Completion`可以理解停止生成。
`Reset Chat`: 可以开始新的聊天会话。

{: .highlight}
> 如果你集成了语音功能，LLM 工具还将为你朗读 LLM 生成的内容。






