---
layout: default
nav_order: 20
title: CUDA 加速
parent: 大语言模型（LLM）
---

# CUDA 加速

支持使用 CUDA 加速 LLM 推理，相较于与 CPU 推理，使用 CUDA 可以获得数倍的加速效果。

---   

## 系统要求

要使用 CUDA 加速，你必须使用 **Nvidia** GPU, 同时，需要安装 CUDA Tookit:

- CUDA Toolkit 11.x (M4U 使用 CUDA 11.6 编译)
- 显卡驱动符合 CUDA 11.x 要求, 建议使用最新显卡驱动
  - Windows 显卡驱动 511.23 +
  - Linux 显卡驱动 510.39.01 + （M4U 暂不支持 linux）
- 足够大的显存(VRAM)：显存要求请继续阅读此文档后续的章节。

{: .highlight}
> 关于显卡驱动和 CUDA 版本对应关系，请看[这里](https://docs.nvidia.com/cuda/cuda-toolkit-release-notes/index.html#cuda-toolkit-major-component-versions)。
>
> CUDA Toolkit 下载地址：    
> https://developer.nvidia.com/cuda-toolkit-archive 

--- 

## 启用 LLM CUDA 加速   

### 开启 LLM CUDA 推理后端   
当你满足 CUDA 环境后，你可以通过如下步骤起开 CUDA 加速：   

1. 可以点击 `编辑（Edit）`>>`项目设置（Project Settings）`。   
2. 在`项目（Project Settings）设置`页面左侧找到`插件(Plugins)`>>`MediaPipe4U LLM` 并点击。    
3. 在插件配置页中将 `InferenceBackend` 设置为 CUDA。   
4. 重启 UE Editor.

[![Open Cuda](./images/llm_settings_cuda.jpg "Open Cuda")](./images/llm_settings_cuda.jpg)

### 配置模型

通过上面的设置，LLM 将会使用 CUDA 作为矩阵运算，这并不足以获得良好的加速效果，还需要将模型加载到 VRAM 中。   

{: .warning}
> 如果你没有足够大的显存，你不应该使用 CUDA 加速，相反，这可能会导致负优化（速度甚至不如 CPU 推理）。
>
> 因为如果模型在内存中加载，需要和 VRAM 频繁交换数据，内存带宽将成为瓶颈。    
> 如果不能让模型在显存中运行，这甚至不如 CPU ，CPU 计算无需交换内存。

对于 CUDA 加速来说，最重要的模型参数是：   
- **n-gpu-layers**

{: .important}
> 关于模型参数的配置，请阅读[使用LLM-配置模型](./usage.md#配置模型)一节内容。


`n-gpu-layers` 属性表示模型的层(Layer)放入 VRAM, 下面举例：
```
--n-gpu-layers=10
```

这表示将模型的 10 层放入显存 (VRAM)，如果模型层数超过 10， 这依然会造成内存和显存的数据交换，因此，我们建议将模型的所有层都放入 VRAM 以获得最佳性能。 

{: .highlight}
> 如果你的 GPU 空闲显存足够大，一个简单的方法是将 n-gpu-layers 设置为 100，这样无论任何尺寸的模型都将全部放入显存。 

M4U LLM 目前支持的 **LLaMA** 模型层数如下：

|LLaMA/LLaMA2 模型规格|层数|
|:----------|-------:|
|   7B      |   32   |
|   13B     |  	40   |
|   33B     |   52   |
|   65B     |   64   |
|   7B      |   32   |

---   

## 内存/内存占用

模型的层(Layer)越多需要越多的显存，一个简单的的方法了解模型的层和需要的内存是以 CPU 推理方式启动 LLM，在启动日志中观察日志输出：

```shell
llama_model_load_internal: format     = ggjt v3 (latest)
llama_model_load_internal: n_vocab    = 55296
llama_model_load_internal: n_ctx      = 2048
llama_model_load_internal: n_embd     = 4096
llama_model_load_internal: n_mult     = 5504
llama_model_load_internal: n_head     = 32
llama_model_load_internal: n_head_kv  = 32
llama_model_load_internal: n_layer    = 32
llama_model_load_internal: n_rot      = 128
llama_model_load_internal: n_gqa      = 1
llama_model_load_internal: rnorm_eps  = 5.0e-06
llama_model_load_internal: n_ff       = 11008
llama_model_load_internal: freq_base  = 10000.0
llama_model_load_internal: freq_scale = 1
llama_model_load_internal: ftype      = 2 (mostly Q4_0)
llama_model_load_internal: model size = 7B
llama_model_load_internal: ggml ctx size =    0.08 MB
llama_model_load_internal: mem required  = 3773.79 MB
```
如上日志中 `n_layer` 表示模型层数，`mem required` 表示需要的内存大小，当使用 CUDA 加速时，这也是需要的显存（VRAM）大小。

### 量化后模型大小

| Model | Measure      | F16    | Q4_0   | Q4_1   | Q5_0   | Q5_1   | Q8_0   |
|------:|--------------|-------:|-------:|-------:|-------:|-------:|-------:|
|    7B | file size    |  13.0G |   3.5G |   3.9G |   4.3G |   4.7G |   6.7G |
|   13B | file size    |  25.0G |   6.8G |   7.6G |   8.3G |   9.1G |    13G |

{: .important}
装载模型所需的内存（显存）大小基本和模型在磁盘上的文件大小相当（略大）。

---   
## 实测加速效果

测试环境：   

CPU: AMD 3600   
GPU: 2060 （6G）   
RAM：32G   
模型: LLaMA2-7b (Q4_0 量化)   


`CPU 推理`: ~6 tokens/s      
`CUDA 加速后`: ~35 tokens/s   
> （--n-gpu-layers=32）   



