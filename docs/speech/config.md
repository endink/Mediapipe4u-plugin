---
layout: default
nav_order: 1
title: 配置插件
parent: 语音套件
---

# 配置插件

## 安装模型：

当你下载 MediaPipe4U 解压后，包含了 **Media4USpeech** 插件，但是并不包含声学模型和声码器模型，你需要手动下载单独发布的模型包，才能让 TTS 功能正常工作。   
按以下步骤完成 **Media4USpeech** 的配置：

1. 在 Github 的 [Release页面](https://github.com/endink/Mediapipe4u-plugin/releases) 中找到你需要的模型包。   
> 不同的语音和音色，有不同的模型包。   
2. 将模型包解压到 MediaPipe4USpeech/Source/ThirdParty/SpeechAPI/Data  

{: .important}
> 目前 Media4USpeech 仅支持**中文普通话**模型包，后续会发布英文模型包。

   
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
> Media4USpeech 语音合成基于 [PaddleSpeech](https://github.com/PaddlePaddle/PaddleSpeech) 开发，使用 PaddleLite 推理库执行推理，理论上，你可以转换任意的 PaddleSpeech 模型到 PaddleLite 格式，
> 然后将他应用于 **Media4USpeech**。


## 使用自定义模型

你可以下载预训练的 PaddleSpeech 模型用于 **Media4USpeech**, 甚至可以通过 PaddleSpeech 训练自己的模型。当前模型使用的模型类型为：

- 声学模型：FastSpeech2
- 声码器：Multi Band MelGAN

> 使用自定义模型时，如果你使用上述的模型类型，可以保证 **Media4USpeech** 正常工作，并获得最佳的性能。   
> 如果使用其他类型的模型，可能导致性能低下或无法工作。   
> 如果你使用其他模型遇到问题，请给我提交 issue。

### 配置文件

当你下载模型包以后，模型包中通常包含一个配置文件，路径是 **speech/front.conf**, 这是整个语音合成（TTS）的配置文件。   
如果你自己转换 PaddleSpeech 模型(声学模型和声码器模型)后，你需要编辑这个配置。   
   
通常 PaddleSpeech 模型会包含音素表和发音人列表，你需要在 front.conf 中进行配置。  

{: .highlight}
> front.conf 的绝大多数配置和文本前端有关，你不能改动。   

我们重点关注以下配置：   
```
--speakers_path=./dict/fastspeech2_nosil_baker_ckpt_0.4/speaker_id_map.txt
--phone2id_path=./dict/fastspeech2_nosil_baker_ckpt_0.4/phone_id_map_zh_en.txt
```

**speakers_path**   
表示发音人字典文件，路径是当前 front.conf 所在目录的相对路径（也支持使用绝对路径，不推荐）。
> 如果模型只提供单独发音人（发音人只有一个），请配置发音人文件路径为空：   
> --speakers_path=   
   
**phone2id_path**   
音素字典文件，路径是当前 front.conf 所在目录的相对路径（也支持使用绝对路径，不推荐）。    

{: .wanrning}
> 当前 TTS 文本前端支持中英混合（中文为主）。   
> 如果你不理解 TTS 文本前端技术，那简单说就是，你下载 PaddleSpeech 模型时候要使用中英混合的模型。   
> Media4USpeech 不支持原生格式的 PaddleSpeech 模型，必须将他们转换为 PaddleLite 格式，具体信息请参考 PaddleSpeech 项目。


### 模型文件

模型包中包含一个存放声学模型和声码器模型的目录，路径是 **speech/models**。   
约定了两个固定的文件名：

- **acoustic.nb** ：这是 PaddleLite 格式声学模型。   
- **vocoder.nb** ：这是 PaddleLite 格式声码器模型。   

> models 目录以 g2pE_mobile 开头的文件是 g2p 英文分词 AI 模型，你不能删除或改动。 