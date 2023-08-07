---
layout: default
nav_order: 1
title: 系统要求
parent: 大语言模型（LLM）
---

# 系统要求

---
## 内存要求

不同的模型规格，需要的物理内存大小不相同，模型越大，推理速度越慢。

{: .important}
> 由于当前只支持 CPU 推理，建议不要使用高于 7B 的模型规格，推荐使用 **Q4_0** 量化后的模型， 以达到最佳推理速度。

**内存要求**   

| Model | Original size |         Q4 size        |
|------:|--------------:|-----------------------:|
|    7B |         13 GB |                 3.9 GB |
|   13B |         24 GB |                 7.8 GB |
|   30B |         60 GB |                19.5 GB |
|   65B |        120 GB |                38.5 GB |

{: .highlight}
> 推理引擎会将模型全部加载到内存，因此内存的要求和模型在磁盘上的大小相当（略大，除了模型，还需要缓存一些内容）。
>
> Q4 表示 4bit 量化，你可以通过 Q4 的尺寸推断出其他量化格式的模型大小。

---   

## 模型支持   

目前 MediaPipe4ULLM 使用 [llama.cpp](https://github.com/ggerganov/llama.cpp)作为推理后端，因此支持的模型和 llama.cpp 保持一致：

- [X] LLaMA 🦙
- [x] LLaMA 2 🦙🦙
- [X] [Alpaca](https://github.com/ggerganov/llama.cpp#instruction-mode-with-alpaca)
- [X] [GPT4All](https://github.com/ggerganov/llama.cpp#using-gpt4all)
- [X] [Chinese LLaMA / Alpaca](https://github.com/ymcui/Chinese-LLaMA-Alpaca) and [Chinese LLaMA-2 / Alpaca-2](https://github.com/ymcui/Chinese-LLaMA-Alpaca-2)
- [X] [Vigogne (French)](https://github.com/bofenghuang/vigogne)
- [X] [Vicuna](https://github.com/ggerganov/llama.cpp/discussions/643#discussioncomment-5533894)
- [X] [Koala](https://bair.berkeley.edu/blog/2023/04/03/koala/)
- [X] [OpenBuddy 🐶 (Multilingual)](https://github.com/OpenBuddy/OpenBuddy)
- [X] [Pygmalion 7B / Metharme 7B](#using-pygmalion-7b--metharme-7b)
- [X] [WizardLM](https://github.com/nlpxucan/WizardLM)
- [X] [Baichuan-7B](https://huggingface.co/baichuan-inc/baichuan-7B) and its derivations (such as [baichuan-7b-sft](https://huggingface.co/hiyouga/baichuan-7b-sft))
- [X] [Aquila-7B](https://huggingface.co/BAAI/Aquila-7B) / [AquilaChat-7B](https://huggingface.co/BAAI/AquilaChat-7B)

---   

## 性能参考

不同的 CPU 可能对性能产生一定影响，以下是用非常低端的设备实测的数据：

CPU: AMD3600   
RAM: 32G   
GPU: NVIDIA GTX 2060 (6G)   

速度： **5.5**-**6.5** TPS (tokens per second)

{: .highlight}
> 使用 Intel CPU 推理速度会有提升, 测试数据证明哪怕是低端设备也能运行 LLM 。



