---
layout: default
nav_order: 1
title: 离线语音合成
parent: 语音合成(TTS)
grand_parent: 语音套件
has_children: true
---

# 离线语音合成 (TTS)

MediaPipe4USpeech 内置一个 ULocalTTSSolutionComponent 组件，它提供离线 TTS 能力, 支持你将文本转为 PCM 语音数据输出。

## 如何使用

1. 向场景中添加 **AMediaPipeSpeechActor** 组件
2. 通过细节面板配置 LocalTTSSolution   

[![TTS details](./images/tts_details.jpg "TS details")](./images/tts_details.jpg)

## 属性

**AcousticModelFile**   
声学模型文件，查找路径为 MediaPipe4USpeech/Source/ThirdParty/SpeechAPI/Data/speech/models   
   
**VoiceCoderModelFile**   
声码器模型文件，查找路径为 MediaPipe4USpeech/Source/ThirdParty/SpeechAPI/Data/speech/models   
   
**ConfigFile**   
TTS 配置文件，包含文本前端配置、音素配置和发音人配置，相信信息请参考[TTS 配置](../config.md)。   

## 功能函数     

### 列出发音人

你可以通过 **ListSpeakers** 函数列出发音人字典的内容。

[![List Speakers](./images/tts_list_speakers.jpg "List Speakers")](./images/tts_list_speakers.jpg)

### 重新加载配置   
使用 ReLoadConfig 函数重新加载配置。支持在运行过程中重新读取 TTS 配置信息。   
> 当你有多套 TTS 模型和配置时，这个函数可以用作切换 TTS 模型。

[![ReLoadConfig](./images/tts_load_config.jpg "ReLoadConfig")](./images/tts_load_config.jpg)


## 使用自定义模型

你可以下载预训练的 PaddleSpeech 模型用于 **MediaPipe4USpeech**, 甚至可以通过 PaddleSpeech 训练自己的模型。当前模型使用的模型类型为：

- 声学模型：FastSpeech2
- 声码器：Multi Band MelGAN

{: .important}
> 原生 PaddleSpeech 模型不能用于 MediaPipe4USpeech, 你必须使用 Paddle 官方工具将它转换为 PaddleLite 格式的模型文件。   
> 使用自定义模型时，如果你使用上述的模型类型，可以保证 **MediaPipe4USpeech** 正常工作，并获得最佳的性能。   
> 如果使用其他类型的模型，可能导致性能低下或无法工作。   
> 如果你使用其他模型遇到问题，请给我提交 issue。

### 配置文件

MediaPipe4USpeech 的模型包中通常包含一个配置文件，在模型包中路径是 **speech/front.conf**, 这是整个语音合成（TTS）的配置文件。   
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
> MediaPipe4USpeech 不支持原生格式的 PaddleSpeech 模型，必须将他们转换为 PaddleLite 格式，具体信息请参考 PaddleSpeech 项目。


### 模型文件

模型包中包含一个存放声学模型和声码器模型的目录，路径是 **speech/models**。   
约定了两个固定的文件名：

- **acoustic.nb** ：这是 PaddleLite 格式声学模型。   
- **vocoder.nb** ：这是 PaddleLite 格式声码器模型。   

### 其他文件
> 名称以 g2pE_mobile 开头的文件是 g2p 英文分词 AI 模型，你不能删除或改动。 









