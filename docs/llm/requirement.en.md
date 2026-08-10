---
layout: default
nav_order: 1
title: System Requirements
parent: Large Language Model (LLM)
---

# System Requirements

---
## Memory Requirements

Different model sizes require different amounts of physical memory. Larger models infer more slowly.

{: .important}
> Because only CPU inference is currently supported, do not use models larger than 7B. Models quantized with **Q4_0** are recommended for the best inference speed.

**Memory Requirements**   

| Model | Original size |         Q4 size        |
|------:|--------------:|-----------------------:|
|    7B |         13 GB |                 3.9 GB |
|   13B |         24 GB |                 7.8 GB |
|   30B |         60 GB |                19.5 GB |
|   65B |        120 GB |                38.5 GB |

{: .highlight}
> The inference engine loads the entire model into memory, so the memory requirement is approximately (and slightly greater than) the size of the model on disk because additional content must be cached.
>
> Q4 denotes 4-bit quantization. You can infer the sizes of other quantization formats from the Q4 size.

---   

## Model Support   

MediaPipe4ULLM currently uses [llama.cpp](https://github.com/ggerganov/llama.cpp) as its inference backend, so supported models match llama.cpp:

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
- [X] [Baichuan-7B](https://huggingface.co/baichuan-inc/baichuan-7B) and its derivatives (such as [baichuan-7b-sft](https://huggingface.co/hiyouga/baichuan-7b-sft))
- [X] [Aquila-7B](https://huggingface.co/BAAI/Aquila-7B) / [AquilaChat-7B](https://huggingface.co/BAAI/AquilaChat-7B)

---   

## Performance Reference

CPU performance can affect results. The following data was measured on a very low-end system:

CPU: AMD3600   
RAM: 32G   
GPU: NVIDIA GTX 2060 (6G)   

Speed: **5.5**-**6.5** TPS (tokens per second)

{: .highlight}
> Intel CPUs can provide faster inference. Test data shows that LLMs can run even on low-end hardware.




