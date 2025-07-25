---
title: '知识库搜索'
description: 'LazyGPT AI 知识库搜索模块介绍'
icon: 'chat'
draft: false
toc: true
weight: 357
---

## 特点

- 可重复添加（复杂编排时防止线太乱，可以更美观）
- 有外部输入
- 有静态配置
- 触发执行
- 核心模块

![](/imgs/flow-kbsearch1.png)

## 参数说明

### 输入 - 关联的知识库

可以选择一个或多个**相同向量模型**的知识库，用于向量搜索。

### 输入 - 相似度

学名称为距离，两个向量之间距离，可以认为是两个向量的相似度，又可以映射成文本之间的相似度。

需要注意的是，不同的向量模型之间的相似度是不能比较的，因为他们的距离值计算出来差距很大。例如，openai 的 embedding 模型，通常 0.8 以上的才是较为准确的内容，而 M3E 模型则是 0.35。

### 输入 - 单次搜索上限

每次触发搜索模块时，最多取 n 条作为最终引用，又称 topN。需要注意的是，取了 n 条引用不代表对话模型都可以使用，还会受对话模型最大 Tokens 的影响。

### 输出 - 搜索结果

输出部分给了两个 boolean 类型的搜索结果，以便根据搜索结果进行不同的处理，通常会有下方两个处理方式：

| 直接回复特定内容              | 对接普通的 gpt                |
| ----------------------------- | ----------------------------- |
| ![](/imgs/flow-kbsearch2.png) | ![](/imgs/flow-kbsearch3.png) |

当然，你也可以连接到 HTTP 模块，从而实现无法从知识搜索到内容时，去进行联网搜索或者维基百科搜索。

### 输出 - 引用内容

以数组格式输出引用，长度可以为 0。意味着，即使没有搜索到内容，这个输出链路也会走通。
