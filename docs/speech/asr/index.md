---
layout: default
nav_order: 20
title: 语音识别 (ASR)
parent: 语音套件
has_children: true
---

# 语音识别 (ASR)

MediaPipe4USpeech 提供了语音识别（ASR）方案，支持实时的，离线的，低延迟的语音识别。   

MediaPipe4USpeech ASR 提供以下功能：   
   
- 离线语音，本地通过 CPU 推理的语音识别方案。
- VAD，算法 + AI 模型的双重人声检测，大幅降低误识别的概率。
- 标点恢复，基于 AI 模型的语音识别后标点恢复，生成带有标点的文本。
- 开发自定义语音识别时，支持任意音频采样率和通道数的重采样。
- 音频算法降噪，非 AI 的纯数学算法降噪，可以在一定程度过滤环境噪音。
- 语音识别接口，方便集成第三方的语音识别服务。