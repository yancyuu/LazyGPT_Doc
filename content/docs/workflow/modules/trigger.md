---
title: "触发器"
description: "LazyGPT 触发器模块介绍"
icon: "work_history"
draft: false
toc: true
weight: 360
---

细心的同学可以发现，在每个功能模块里都会有一个叫【触发器】的外部输入，并且是 any 类型。

它的**核心作用**就是控制模块的执行时机，以下图两个知识库搜索中的【AI 对话】模块为例子：

| 图 1                         | 图 2                         |
| ---------------------------- | ---------------------------- |
| ![](/imgs/trigger1.png) | ![](/imgs/trigger2.png) |

【知识库搜索】模块中，由于**引用内容**始终会有输出，会导致【AI 对话】模块的**引用内容**输入无论有没有搜到内容都会被赋值。如果此时不连接触发器（图 2），在搜索结束后必定会执行【AI 对话】模块。

有时候，你可能希望空搜索时候进行额外处理，例如：回复固定内容、调用其他提示词的 GPT、发送一个 HTTP 请求…… 此时就需要用到触发器，需要将 **搜索结果不为空** 和 **触发器** 连接起来。

当搜索结果为空时，【知识库搜索】模块不会输出 **搜索结果不为空** 的结果，因此 【AI 对话】 模块的触发器始终为空，便不会执行。

总之，记住模块执行的逻辑就可以灵活的使用触发器：**外部输入字段（有连接的才有效）全部被赋值时才会被执行**。
