---
layout: default
nav_order: 1
title: 配置插件
parent: 语音套件
---

# 配置插件

## 安装模型：

当你下载 MediaPipe4U 解压后，包含了 **MediaPipe4USpeech** 插件，但是并不包含声学模型和声码器模型，你需要手动下载单独发布的模型包，才能让 TTS 功能正常工作。   
按以下步骤完成 **MediaPipe4USpeech** 的配置：

1. 在 Github 的 [Release页面](https://github.com/endink/Mediapipe4u-plugin/releases) 中找到你需要的模型包。   
> 不同的语音和音色，有不同的模型包。   
2. 将模型包解压到 MediaPipe4USpeech/Source/ThirdParty/SpeechAPI/Data  

{: .important}
> 目前 MediaPipe4USpeech 仅支持**中文普通话**模型包，后续会发布英文模型包。

   
以普通话模型包为例，完成上述步骤后，你的插件目录结构应该是这样

```
[Plugins Folder]\MediaPipe4USpeech\Source\ThirdParty\SpeechAPI\Data
└─speech
    ├─dict
    │  ├─fastspeech2_nosil_baker_ckpt_0.4
    │  ├─jieba
    │  │  └─pos_dict
    │  ├─speedyspeech_nosil_baker_ckpt_0.5
    │  └─tranditional_to_simplified
    └─models
```

> Plugins Folder 是你的项目 Plugins 目录。

{: .highlight}
> MediaPipe4USpeech 语音合成基于 [PaddleSpeech](https://github.com/PaddlePaddle/PaddleSpeech) 开发，使用 PaddleLite 推理库执行推理，理论上，你可以转换任意的 PaddleSpeech 模型到 PaddleLite 格式，
> 然后将他应用于 **MediaPipe4USpeech**。