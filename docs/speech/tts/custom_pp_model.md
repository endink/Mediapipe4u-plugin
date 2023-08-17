---
layout: default
nav_order: 20
title: 自定义 PaddleSpeech 模型
parent: 语音合成 (TTS)
grand_parent: 语音套件
has_children: false
---

# 自定义 TTS 模型

MediaPipe4U 的 TTS 模块基于 [Paddle Speech](https://github.com/PaddlePaddle/PaddleSpeech) 语音技术，你可以使用一部分 Paddle Speech 的预训练模型，也可以自己使用 Paddle Speech 训练你自己的模型。

PaddleSpeech 官方的预训练模型可以访问下面的地址直接下载（仅 Onnx 模型可以直接下载使用）：   

[https://github.com/PaddlePaddle/PaddleSpeech/blob/develop/docs/source/released_model.md](https://github.com/PaddlePaddle/PaddleSpeech/blob/develop/docs/source/released_model.md)    

BTW: MediaPipe4U 提供的语音包也是用这些预训练模型制作的。

{: .important}
> 此文档仅适用于 20230728 或更高版本的 MediaPipe4U 插件。
> 
> 随着 MediaPipe4U 插件的开发迭代，当前文档描述的模型包结构可能会随之变化。

---   


## 了解 TTS 技术

要自定义 TTS 模型，你需要了解基本的 TTS 技术概念。   

大体上，所有的端到端 TTS 都包含三个核心组件：

- 文本前端: 将音频数据转换到音素数据
- 声学模型: 将音素数据转换成声学数据
- 声码器模型: 将声学数据转换为可播放的音频数据

其中文本前端被封装到 MediaPipe4U Speech 插件中，你不可以自定义，插件内置了两套文本前端，分别用于处理中文、英文。
由于文本前端的限制，目前插件只能支持中文、英文的模型。   
但是，你可以通过改变声学模型和声码器模型，得到不同的音色和不同音质输出。

---   

## MediaPipe4U Speech TTS 语音模型包约定

这里所说的模型都是指 PaddleSpeech 的 TTS 模型，其他技术方案的模型不被支持。

### 模型限制

**支持的模型类型:**

- 声学模型：FastSpeech2
- 声码器：HiFiGAN，Parallel WaveGAN，Multi Band MelGAN	

{: .important}
>  声码器我们推荐 **HiFiGAN** 类型，这个模型可以在性能和效果之间得到最佳的平衡（Multi Band MelGAN 最快但效果最差，Parallel WaveGAN 推理速度太慢）。

**支持的模型格式:**  

- PaddleLite 
- Onnx

{: .warning}

> 最初版本的  MediaPipe4U Speech 插件使用 PaddleLite 推理，新版 M4U Speech 自己重写了 Onnx 推理，相比 PaddleLite， CPU 推理速度提升 500% 以上。
> 
> PaddleSpeech 官方提供的 PaddleLite 预训练模型并不能直接使用，因为 PaddleLite 版本兼容性问题，必须使用 PaddleLite 1.20-rc 版本转换工具自己生成，制作过程比较麻烦。
> PaddleSpeech 官方的 Onnx 模型可以直接下载使用。
> 
> 总之，不推荐使用 PaddleLite 模型，而应该使用 Onnx 模型。

### TTS 语音模型包结构

MediaPipe4U 对语音包格式做了约定，是一个 GZip 格式的压缩文件，解压后都包含一个 tts 文件夹，tts 文件夹下包含一个 tts.conf 文件，
通常还包含一个 dict 文件夹和一个 models 文件夹。

- tts.conf：模型包配置文件
- dict: 存放字典数据的文件夹
- models：存放模型的文件夹

---   

## 制作 M4U Speech 的 TTS 语音模型包

要制作一个语音模型包，你只需要几个步骤：

1. 根据你需要的语言，下载一个对应的 M4U Speech 语音模型包，并解压,以它作为模板。
2. 移除语音模型包中的声学模型文件、声码器模型文件、音素字典文件、发音人字典（多发音人）文件。
3. 复制你自己的声学模型文件和声码器模型文件到 models 目录。
4. 复制模型的音素字典文件、发音人字典文件到 dict 目录。
5. 修改模型配置文件 tts.conf （下面介绍）。
6. 使用压缩软件用 gzip 格式打包成压缩文件 。

> 步骤 6 为可以选步骤，打包成 gzip 文件可以通过编辑器安装你的模型包，便于分发，你也可以拷贝 tts 文件夹手动安装语言包。
> 
> 关于安装语音模型包的方法，请阅读[安装语音模型包文档](../config.md)。

{: .highlight}
> 你只需要修改配置文件中的这些项：
> 
> - ac_model_path
> - vo_model_path
> - phone2id_path
> - speakers_path
> - default_speaker_id
> 
> 只要你的声学模型和你使用的模板语音模型包的语言类型一致，配置文件的其他部分你不用关心也不用修改。 

---   

## TTS 模型包配置文件

每一个模型包中，都包含一个 tts 文件夹，这是插件的约定，文件夹下包含一个 tts.conf 文件，我们来看一个英语 TTS 模型的配置：

```shell
# dict conf fastspeech2_0.4
--seperate_tone=false

--cmu_path=./dict/cmudict-0.7b
--homograph2features_path=./dict/homograph2features.txt
#--order_dict_path=./dict/orderdict.txt


--speakers_path=./dict/speaker_id_map.txt

--ac_model_path=./models/fastspeech2_ljspeech.onnx
--vo_model_path=./models/hifigan_ljspeech.onnx

# g2p models
--g2p_decoder_model_path=./models/g2pE_mobile_decoder.mnn
--g2p_encoder_model_path=./models/g2pE_mobile_encoder.mnn

--phone2id_path=./dict/phone_id_map.txt
--language=en
--use_onnx=true
--default_speaker_id=100

```

> 其中 # 号开头的行代表这一行被注释，是无效的数据行，以 `--` 是有效的参数。

创建自定义模型包只需要关注下面这些参数：

{: .highlight}
> 配置中的文件路径都是相对于配置文件所在目录。

| 参数名 | 必须 | 说明 |
|:--------|------|:------|
| ac_model_path | Y | 声学模型文件路径。 |
| vo_model_path | Y | 声码器模型文件路径。 |
| use_onnx |  | 是否使用 Onnx 推理，建议使用，如果不设置，将使用 PaddleLite 推理（要求你使用 PaddleLite 格式的模型文件）。 |
| language |  | 模型语言，支持：zh, zh_mix, en，如果不指定，默认 zh_mix。 |
| phone2id_path | Y | 音素字典文件路径，不同模型可能会提供不同的字典， PaddleSpeech 的声学模型中都会包含这个文件。 |
| speakers_path |  | 发音人字典文件路径，如果你的模型支持多个发音人，必须包含这个配置，PaddleSpeech 的多发音人声学模型中都会包含一个发音人字典文件，如果是单发音人模型，注释或删除 speakers_path 配置。 |
| default_speaker_id |  | 默认的发音人 id，如果不指定，多发音人将用 0 作为默认发音人 id。 |

> **use_onnx** 是历史遗留问题，旧版插件不支持 Onnx 推理，建议你只使用 Onnx 模型，PaddleLite 模型制作复杂，推理速度缓慢，不再推荐使用。

模型的语言将影响文本前端对文本进行前置处理。   
模型语言可用的值：
- zh: 中文模型，这种模型无法对英文字符、单词发音。
- zh_mix: 中文模型，这种模型可以对中文发音，同时也能对英文字符、单词发音。
- en: 英文模型，这种模型无法对非英文字符发音。

{: .warning}
> 指定错误的语言类型，可能导致程序崩溃，因为各个语言的音素数量不同。


### 其他配置

语音模型包配置中的其他配置大多和文本前端有关，英文默认使用 g2p 作为前端处理，中文使用 jieba 分词处理，你不能改动这些配置和配置所用到的模型和文件。   

- g2p_XXX: 是 g2p 模型配置，你不应该改动或删除。    
- jieba_XXX: 是 jieba 分词程序的配置。

{: .important}
> 当模型是非中文时时，无需配置结巴分词程序。
