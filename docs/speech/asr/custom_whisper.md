---
layout: default
nav_order: 10
title: 自定义 Whisper 模型
parent: 语音识别 (ASR)
grand_parent: 语音套件
has_children: true
---

# 自定义 Whisper 模型

MediaPipe4U Speech 通过集成 [whisper.cpp](https://github.com/ggerganov/whisper.cpp) 来支持 Whisper 的语言识别。   
MediaPipe4U Speech 的 Whisper 功能支持 CPU 和 GPU 推理。   

{: .important}
> Whisper 的 GPU 推理不依赖于特定显卡供应商，任何支持 Direct3D 11.0 的显卡都支持。 

---   
## Whisper 简介

[Whisper](https://github.com/openai/whisper) 是 OpenAI 开源的语音识别模型。   
Whisper 支持 **99** 种语言，MediaPipe4USpeech 中的 Whisper 。    
> 你可以将任意的 whisper 模型通过 whisper.cpp 的转换工具转换为 gglm 格式以供 MediaPipe4U Speech 来使用。

Whisper 各种语言的效果可以参考下面的错误率图表:

[![Whisper WER](./images/language-breakdown.svg "Whisper WER")](./images/breakdown.svg)

可以看出，Whisper 比较擅长的语言是:
- 西班牙语
- 意大利语
- 葡萄牙语
- 德语
- 日语

{: .highlight}
> Whisper 提供了多种规格模型，推荐使用 small 或 medium 规格的模型以获得最佳的性能和最好的效果。
>
> 模型尺寸越大效果越好，但是推理速度也会越慢。
> 如果你决意使用 large 模型，可以对其进行量化来提升推理性能。

---   

## ASR 语音模型包结构

MediaPipe4U 对 ASR 语音包格式做了约定，是一个 GZip 格式的压缩文件，解压后都包含一个 asr 文件夹，asr 文件夹下包含一个 asr.conf 文件，
通常还包含一个 models 文件夹。

- asr.conf：模型包配置文件
- models：存放模型的文件夹

以 Whisper 模型包为例， ASR 模型包结构如下：

```
├─asr
│  │─asr.conf
│  │
│  └─models
│          ggml-small.en.bin
```

{: .important}
> asr.conf 文件必须是 utf8 编码的文本文件。   

asr.conf 文件每一行是一个模型参数，以 -- 开头，非 -- 开头的行无效，被认为是注释。  

--- 

## 配置参数：   

一个典型的 Whisper 模型包 asr.conf 文件内容如下：

```shell
# config for whisper
--model_path=./models/ggml-small.en.bin
--provider=whisper-gpu
--language=en
```

**model_path**   
表示模型文件的路径。   
可以是绝对路径，也可以是 `asr.conf` 的相对路径，相对路径通常以 ./ 开头，表示 `asr.conf` 所在的目录。    

{: .important}
> whisper 模型必须是 ggml 格式的模型，也支持 ggml 量化后的模型。   

**provider**   
模型推理提供程序，如果不填写表示 FunASR 模型（FunASR 模型数量有限，这里不介绍如何制作 FunASR 模型）。    
Whisper 模型有两种 provider 值：   
- `whisper`: 表示 whisper 模型使用 CPU 推理。
- `whisper-gpu` 表示 whisper 模型使用 GPU 推理。

{: .important}
> whisper 模型的 GPU 推理不依赖 CUDA， 任何 GPU （AMD/Nvidia/Intel）都会获得加速效果。

**language**   
表示使用的语言，whisper 有多语言模型（支持 99 种语言），但是你需要为推理引擎指定一种语言，目前不支持语言自动识别。   

---   

## 模型转换

你可以在 HuggingFace 上下载已经转换为 gglm 格式的 whisper 模型：   

[https://huggingface.co/ggerganov/whisper.cpp](https://huggingface.co/ggerganov/whisper.cpp)

你也可以使用 whisper.cpp 来转换原生的 whipser 模型到 gglm 格式，如果你想自己转换模型，请看[这里](https://github.com/ggerganov/whisper.cpp/blob/master/models/README.md)


---   

## 模型量化    

量化后的模型运行速度更快，尺寸更小，但是精度会有所损失，你可以根据实际情况来选择量化或者不量化。   

关于 whisper 模型量化的方法，请看[这里](https://github.com/ggerganov/whisper.cpp#quantization)。