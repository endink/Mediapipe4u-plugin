---
layout: default
nav_order: 1
title: 离线语音识别
parent: 语音识别 (ASR)
grand_parent: 语音套件
has_children: true
---

# 离线语音识别 (ASR)

MediaPipe4USpeech 内置一个 ULocalASRSolutionComponent 组件，它提供离线的端到端的 ASR 能力, 支持你将音频输出转为文本输出。

---   
## 如何使用

1. 向场景中添加 **AMediaPipeSpeechActor** 组件
2. 通过细节面板配置 LocalASRSolution   

[![ASR details](./images/asr_details.jpg "ASR details")](./images/asr_details.jpg)

---   
## 属性

**ConfigFile**   
语音模型的配置文件，它是一个相对路径，根目录是`MediaPipe4USpeech/Source/ThirdParty/SpeechAPI/Data/asr`。  
   
**LoadModelOnStart**     
当程序启动后自动加载模型包的方式。   
- Disabled: 不在启动程序后加载 TTS 模型。
- Async: 异步加载模型（在线程池线程中）。
- Sync: 同步加载模型（在游戏线程中）。

{: .important}
> 当设置加载方式为异步加载（Async）时，你可以通过 `OnModelsLoadCompleted` 事件来获得模型加载完成的通知。
   
**VadLevel**      
VAD 级别，表示 VAD 检测的激进模式。

**SampleRate**  
音频采样率，你设置的采样率必须和 ASR 模型支持的采样率一致，大多数的 ASR 模型都使用 16000 单声道音频。 

**SampleChannels**  
音频声道数，你设置的声道数必须和 ASR 模型支持的声道数一致，大多数的 ASR 模型都使用 16000 单声道音频。  

**VadEnabled**   
是否启用 VAD 端点识别（关于端点识别，本文档后续章节详细介绍）。   

**SaveAudioFile**   
是否将音频保存为语音文件（.wav），这通常用于调试。      

**SaveAudioFilePath**   
当 SaveAudioFile 为 **true** 时，这个属性控制音频文件的保存路径。   
这个路径可以是绝对路径，也可以是相对路径，相对路径根目录为 `Saved/M4UAudio`。

**DeNoise**   
是否启用降噪，将输入音频（通常是麦克风）进行算法降噪处理。   

**NoiseInDB**   
当 **DeNoise** 为 **true** 时，这个属性用于控制噪音的分贝数（通常，在声学领域，分贝值越小，表示的声音越大）。

**MaxVoiceSeconds**    
音频数据缓冲的最大长度（单位：秒），即一次识别最多能识别多少秒的音频。

**MaxSilenceSeconds**   
当启用 Vad 端点识别时，这个属性控制静音多少秒认为一句话说话结束。

---   
## 事件   

**OnModelsLoadCompleted**   
模型加载结束时回调的事件。

---   

## 功能函数     

### 检查模型是否已经加载

你可以通过 **IsModelsLoaded** 函数列出发音人字典的内容。

[![IsModelsLoaded](./images/is_model_loaded.jpg "IsModelsLoaded")](./images/is_model_loaded.jpg)

---   

## 端点检测   

LocalASRSolutionComponent 包含两种使用方式：

1. **手动模式**： 手动开始开始和停止识别，当开始后采集语音数据，当停止时发送语音数据进行识别（可以开发类似“按住说话”的功能）。   
2. **端点检测模式**： 手动开始，但是使用 VAD 检测是否有人说话，当指定的时间（**MaxSilenceSeconds** 属性）内无人说话时认为一句话结束，自动发送语音数据进行识别（可以连续的进行语音听写，开发类似自动字幕功能）。

{: .warning}
> 无论是否使用端点检测模式，当语音数据超过 **MaxVoiceSeconds** 设定的最大长度时，会自动发送语音数据进行识别。    
> 
> 当开启端点检测时，如果语音数据被发送（VAD 识别到说话结束）后，语音数据长度会被重置，然后继续等待下一句语音数据到来，因此可以连续不断的识别长语音。   
> 端点检测模式下 **MaxVoiceSeconds**的含义为一句话的最大长度（单位：秒）。







