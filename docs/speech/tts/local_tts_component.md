---
layout: default
nav_order: 1
title: 离线语音合成
parent: 语音合成 (TTS)
grand_parent: 语音套件
has_children: true
---

# 离线语音合成 (TTS)

MediaPipe4USpeech 内置一个 ULocalTTSSolutionComponent 组件，它提供离线 TTS 能力, 支持你将文本转为 PCM 语音数据输出。   

---   


## 如何使用

1. 向场景中添加 **AMediaPipeSpeechActor** 组件
2. 通过细节面板配置 LocalTTSSolution   

[![TTS details](./images/tts_details.jpg "tts details")](./images/tts_details.jpg)

---   

## 属性

**ConfigFile**   
语音模型的配置文件，它是一个相对路径，根目录是`MediaPipe4USpeech/Source/ThirdParty/SpeechAPI/Data/tts`。  
   
**LoadModelOnStart**     
当程序启动后自动加载模型包的方式。   
- Disabled: 不在启动程序后加载 TTS 模型。
- Async: 异步加载模型（在线程池线程中）。
- Sync: 同步加载模型（在游戏线程中）。

{: .important}
> 当设置加载方式为异步加载（Async）时，你可以通过 `OnModelsLoadCompleted` 事件来获得模型加载完成的通知。
   
**SpeakerId**      
发音人 id， 如果你的 TTS 没有多发音人，请设置为 -1。

**SampleRate**  
音频采样率，你设置的采样率必须和模型包支持的采样率一致，默认的模型包支持所有的采样率。 

**SaveAudioFile**
是否将音频保存为语音文件（.wav），这通常用于调试。   

**SaveAudioFilePath**
当 SaveAudioFile 为 **true** 时，这个属性控制音频文件的保存路径。   
这个路径可以是绝对路径，也可以是相对路径，相对路径根目录为 `Saved/M4UAudio`。

---   

## 事件

**OnModelsLoadCompleted**   
模型加载结束时回调的事件。

---   

## 功能函数     

### 列出发音人

你可以通过 **ListSpeakers** 函数列出发音人字典的内容。

[![List Speakers](./images/tts_list_speakers.jpg "List Speakers")](./images/tts_list_speakers.jpg)

### 检查模型是否已经加载

你可以通过 **IsModelsLoaded** 函数列出发音人字典的内容。

[![IsModelsLoaded](./images/is_model_loaded.jpg "IsModelsLoaded")](./images/is_model_loaded.jpg)

### 文本转语音
使用 ReLoadConfig 函数重新加载配置。支持在运行过程中重新读取 TTS 配置信息。   
> 当你有多套 TTS 模型和配置时，这个函数可以用作切换 TTS 模型。

[![ReLoadConfig](./images/tts_load_config.jpg "ReLoadConfig")](./images/tts_load_config.jpg)


## 自定义 TTS 模型

你可以下载预训练的 PaddleSpeech 模型用于 **MediaPipe4USpeech**, 甚至可以通过 PaddleSpeech 训练自己的模型。当前模型使用的模型类型为：

- 声学模型：FastSpeech2
- 声码器：Multi Band MelGAN

{: .important}
> 原生 PaddleSpeech 模型不能用于 MediaPipe4USpeech, 你必须使用 Paddle 官方工具将它转换为 PaddleLite 格式的模型文件。   
> 使用自定义模型时，如果你使用上述的模型类型，可以保证 **MediaPipe4USpeech** 正常工作，并获得最佳的性能。   
> 如果使用其他类型的模型，可能导致性能低下或无法工作。   
> 如果你使用其他模型遇到问题，请给我提交 issue。

### 编辑模型配置文件

MediaPipe4USpeech 的 TTS 模型包中通常包含一个配置文件，在模型包中路径是 `MediaPipe4USpeech/Source/ThirdParty/SpeechAPI/Data/tts/tts.conf`, 这是整个语音合成（TTS）的配置文件。
这和 **LocalTTSSolutionComponent** 上的 **ConfigFile** 一致。      

如果你自己转换 PaddleSpeech 模型(声学模型和声码器模型)后，你需要编辑这个配置。   
   
通常 PaddleSpeech 模型会包含音素表和发音人列表，你需要在 front.conf 中进行配置。  

{: .highlight}
> tts.conf 的绝大多数配置和文本前端有关，如果你不清楚文本前端，你不能改动。   
> 
> 自定义 TTS 适合高级用户，普通用户不理解 TTS 流程不应该轻易尝试。   

我们重点关注以下配置：   
```
--phone2id_path=./dict/fastspeech2_nosil_baker_ckpt_0.4/phone_id_map_zh_en.txt
--speakers_path=./dict/fastspeech2_nosil_baker_ckpt_0.4/speaker_id_map.txt

--ac_model_path=./models/acoustic.nb
--vo_model_path=./models/vocoder.nb
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

**ac_model_path**
声学模型文件的路径。

**vo_model_path**
声码器模型文件的路径


**其他配置**

语音包配置中的其他配置大多和文本前端有关，英文默认使用 g2p 作为前端处理，中文使用 jieba 分词处理，你不能改动这些配置和配置所用到的模型和文件。   

- g2p_XXX: 是 g2p 模型配置，你不应该改动或删除。    
- jieba_XXX: 是 jieba 分词程序的配置。

{: .important}
> 当你不需要中文文本前端（使用英文 TTS 模型）时，可以不配置结巴分词程序。








