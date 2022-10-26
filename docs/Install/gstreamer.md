---
sort: 3
---

# GStreamer 配置

如果你使用了 **MediaPipe4UGStreamer** 和 **GStreamer** 插件，那么你还需要配置 GStreamer.

---

## 下载 GStreamer   

到 GStremer 官网下载 GStreamer 开发包和运行库   

打开下载页面： https://gstreamer.freedesktop.org/download/

[![GStremer下载](images/gstremer_download.jpg "Shiprock")](images/gstremer_download.jpg)

你需要同时下载运行时(runtime installer) 和 开发包（development installer），安装时请将运行时和开发包安装到同一个目录。

## 检查 GStreamer 环境变量

如果你使用的安装包，那么会自动配置环境变量，如果你使用二进制（binraries）方式安装，请自行配置环境变量。

**MediaPipe4U** 提供的 **GStreamer** 插件会检查以下环境变量来链接 GStremer 库。

- GSTREAMER_1_0_ROOT_MSVC_X86_64
- GSTREAMER_ROOT

请确保上述环境变量至少存在一个，并且值为 GStremer安装目录\1.0\msvc_x86_64\ , 如下图

> *图片仅为了说明，你只需要配置其中一个环境变量即可*   

[![GStremer Env](images/gstremer_env.jpg "Shiprock")](images/gstremer_env.jpg)



只要以上配置正确 **MediaPipe4UGStreamer** 和 **GStreamer** 插件 就会正常工作了。