---
layout: default
nav_order: 20
title: 集成其他TTS方案
parent: 语音合成(TTS)
grand_parent: 语音套件
has_children: true
---

## 集成其他TTS方案

MediaPipe4USpeech 将 TTS 功能抽象为 **ITTSSolution** 接口，通过实现这个接口，你可以将其他的 TTS 方案整合到 MediaPipe4USpeech 中。
例如，可以实现一个调用 Microsoft Azure 语音接口的方案。

```cpp
class MEDIAPIPESPEECH_API ITTSSolution
{
	GENERATED_BODY()

	// Add interface functions to this class. This is the class that will be inherited to implement this interface.
public:
	virtual int GetSpeakerId() = 0;
	virtual int32 GetSampleRate() =0;

	virtual  bool TextToSpeech(const FString& Sentence, FWavClip& OutWav) = 0;
	
	virtual void RaiseWavChunkReceivedEvent(TSharedRef<FWaveChunk> InWavChunk) = 0;
	virtual void RaiseInferenceCompletedEvent(const FGuid& SentenceId, ESpeechState State) = 0;

	virtual FTTSInferenceCompletedEvent& GetInferenceCompletedEvent() = 0;
	virtual FTTSWavChunkReceivedEvent& GetWavChunkReceivedEvent() = 0;

	virtual void SetDebugLogEnabled(bool bEnabled) = 0;
};
```

### 函数说明   
   
**TextToSpeech**   
   
执行文本转语音，并且输出一个 PCM 数据块。   

**GetSpeakerId**   
   
获取默认的发音人 id，id 必须为数字，如果你的 TTS 方案发音人不是数字，你需要自己制作发音人字典，如果你没有发音人（只有一个发音人），可以返回 -1。   

**GetSampleRate**   
   
获取 TTS 采样率。   

**GetInferenceCompletedEvent**   
   
返回 TTS 文本处理完成的事件。   

**GetWavChunkReceivedEvent**   
   
返回 TTS 分句片段执行完成的事件，如果你的 TTS 不支持分句，你仅在完成时触发一次该事件即可。   

**RaiseWavChunkReceivedEvent**   
   
触发一个分句 TTS 片段完成的事件。   

**RaiseInferenceCompletedEvent**   
   
触发整个文本 TTS 完成的事件。   

**SetDebugLogEnabled**   
   
设置是否启用调试日志。   









