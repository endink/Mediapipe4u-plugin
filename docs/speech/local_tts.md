# 离线语音合成 (TTS)

MediaPipe4USpeech 提供离线 TTS 能力, 支持你将文本转为 PCM 音频数据并使用 Unreal Engine 播放。   

---   


## 如何使用

1. 安装 TTS 模型。
1. 向场景中添加 `MediaPipeSpeechActor` 组件。
2. 通过细节面板配置 TTS 。
3. 调用 `MediaPipeSpeechActor` 的 `SpeakText`/`SpeakTextAsync` 函数朗读文本。

> 安装 TTS 模型，请阅读[安装语音模型](./setup_models.md)文档。


---   

## 属性

`MediaPipeSpeechActor` 有很多关于 TTS 的属性，下面详细说明：

![TTS details](./images/local_tts/tts_details.jpg "TTS details")

**TTSSolutino**    
表示 TTS 使用的方案，一般来说离线 TTS 使用 **Local** 即可。
   
**LoadTTSOnStart**     
当程序启动后自动加载 TTS （加载模型）的方式。   

- `Disabled`: 不在启动程序后加载 TTS 模型。
- `Async`: 异步加载模型（在线程池线程中）。
- `Async`: 同步加载模型（在游戏线程中）。

!!! tip
    当设置加载方式为异步加载（Async）时，你可以通过 `OnTTSLoaded` 事件来获得 TTS 模型加载完成的通知。
   

**SaveTTSAudioFile**
是否将音频保存为语音文件（.wav），这通常用于调试。   

**SaveTTSAudioFilePath**
当 SaveAudioFile 为 **true** 时，这个属性控制音频文件的保存路径。   
这个路径可以是绝对路径，也可以是相对路径，相对路径根目录为 `Saved/M4UAudio`。

---   

## 事件

**OnTTSLoaded**    
TTS 加载结束时回调的事件。


**OnTTSCompleted**    
TTS 模型完成文本转语音时（推理完成）发生，这个时候已经输出的音频数据，但是音频播放不一定完成。


**OnTTSWaveReceived**   
TTS 完成推理后，音频播放组件接受到推理输出的音频数据时发生。

**OnSpeakingCompleted**    
TTS 朗读结束时发生，这个时候最后一段音频块已经播放完毕。

**OnSpeakingChunkStarted**    
TTS 开始朗读一块音频时发生。

**OnSpeakingChunkCompleted**    
TTS 完成一块音频数据的朗读时发生。

!!! tip
    
    TTS 会自动切割长文本，然后分段进行 TTS 推理，每一段文本生成一块音频数据，从而实现边推理边播放。

---   

## 函数     

|函数名| 说明 |
|----------|------------|
|ListSpeakers     | 列出发音人，如果 TTS 模型支持多发音人，这里将列出所有发音人, 如果 TTS 未完成加载，将返回空数组。  |
|GetSpeakerId     | 获取当前的发音人 Id，如果 TTS 未完成加载，将返回 **-1**。  |
|IsTTSLoading     | 指示 TTS 是否正在加载中。  |
|IsTTSReady       | 指示 TTS 是否已经准备就绪（加载完成，并且成功加载）。  |
|SetSpeakerId     | 通过一个 **Id** 设置发音人, 发音人 Id 可以通过 `ListSpeakers` 函数获得。 |
|IsSpeaking       | 指示 TTS 是否正在朗读。 |
|IsSpeakStopping  | 指示 TTS 是否正在停止朗读。 |
|GetTTSState      | 获取 TTS 模型加载状态。 |
|SpeakText        | 朗读文本。<br />参数 `StopPrevious` 表示是否停止正在进行的朗读，即打断现有的朗读。|
|StopText         | 停止朗读。|

## 异步函数   
|函数名| 说明 |
|----------|------------|
|LoadTTSAsync     | 当 `LoadTTSOnStart` 属性未 **Disabled** 时，不会自动加载 TTS，需要使用这个函数手动加载 。|
|SpeakTextAsync   | 朗读文本。<br />参数 `StopPrevious` 表示是否停止正在进行的朗读，即打断现有的朗读。|
|StopTextAsync    | 停止朗读。|


## 蓝图函数库

- `ListTTSSolutions`: 列出当前可以使用的 TTS 方案。














