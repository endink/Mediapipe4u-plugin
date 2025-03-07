---
layout: default
nav_order: 10
title: 安装插件
parent: 安装和配置
---

# 安装插件

**MediaPipe4U** 提供以下 UnrealEngine 插件，插件的安装方式和普通的 UE 插件安装方式相同。

---
1. 拷贝以下目录到 [UE项目根目录]/Plugins

- MediaPipe4U
- GStreamer
- MediaPipe4UGStreamer
- MediaPipe4ULiveLink

完成后你的目录结构通常如下：

```
UEProjectSample
├─Binaries
├─Build
├─Config
├─Content
├─Intermediate
├─Plugins
│  ├─GStreamer
│  ├─MediaPipe4U
│  ├─MediaPipe4UGStreamer
│  ├─MediaPipe4ULiveLink
├─Saved
├─Script
└─Source
```

2. 打开 UE Editor, 确保以下插件已经启用

[![启用插件](images/plugin_enable.jpg "Shiprock")](images/plugin_enable.jpg)


