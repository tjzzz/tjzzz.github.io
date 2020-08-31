## 1.Deep Sequential Models for Task Satisfaction Prediction

本文主要是对搜索满意度satisfication这个问题进行研究

* query级别的满意度 => 序列模式
* 除了本身的序列，还考虑其他的特征。 **序列 + 其他用户行为信号**
* query的满意度 => tasks级别的，这里主要是采用了一些不同的组合函数


## 2.related work

关于搜索满意度的相关工作主要有：

**满意度**
首先，满意度这个概念是一个主观概念，现有的一些方法主要是

* 通过用户反馈[10][5]
* 通过外包人工评估
* 一些已经有过研究的行为模式：换q，点击后长留


## 4.特征提取——提取用户交互数据

作者参考[34],(同一批人)提取大概从以下三个维度中进行：

* viewport timeline
* cursor timeline
* keybord timeline
例如：
![](media/15217823138886/15217831868274.jpg)
具体使用的特征
![](media/15217823138886/15217834133419.jpg)
大致包括：
* 点击（位置，图片，文字）
* 停留时长dewelltime(进行了离散化处理)
* 鼠标移动（像素距离，时间）
* 滑动,停留，resize


## 5 模型方法

目标
$$y=arg max_{y\in 0,1}p(y|query,SRP,A,I;\theta)$$
A: user action sequence
I: implicit signals observed

因为是用sequence来做预测，所以可以用RNN模型来做分类。利用LSTM(RNN)网络做序列分类模型，主要包括下面两步：
### 5.1 序列模型

* Action embedding

类似语料库的term，其数学定量表示方法主要有
1) one hot 方法
2) embedding方法将每一个action 利用skip-gram model转为一个向量。

* lstm


## 5.2 merge一些静态统计特征
虽然采用序列模型的方法对于判断用户满意度有一定的效果，其他的一些静态的统计特征对于模型预测也很重要。本文是想对于这两类特征做一个融合

![](media/15217823138886/15217887184123.jpg)


将两个merge在一起 CNN-LSTM

![](media/15217823138886/15217894576824.jpg)

## 6 task satisfaction
这一部分不是作者重点工作，所以这里只是简单的介绍了几个将query级别merge成task级别满意度的方法。

![](media/15217823138886/15217911429110.jpg)


基于query level的进行aggregate

* max，average, weight, min


## 7 实验验证


* 数据采集

（1）人工标注
（2）自定义：换q不满意，点击后>30s并且无换q是满意(也没具体说其他情况。。)



* 实验对比

(1) 非序列模型
(2) 序列模型：对比Generative probabilistic model、CRF-models

query满意度表现：

![](media/15217823138886/15294615819238.jpg)

task满意度表现

![](media/15217823138886/15294617726959.jpg)


## References



[10] Qi Guo, Dmitry Lagun, and Eugene Agichtein. Predicting web search success with fine-grained interaction data. In CIKM 2012.

[32] Rishabh Mehrotra, Prasanta Bha acharya, and Emine Yilmaz. 2016. Deconstructing Complex Tasks. In Proceedings of NAACL

**[34]** Rishabh Mehrotra, Imed Zitouni, Ahmed Hassan, Ahmed Kholy, and Madian Khabsa. 2017. User Interaction Sequences for Search Satisfaction Prediction. In Proceedings SIGIR 2017. ACM.

* 阅读lstm
https://www.jianshu.com/p/9dc9f41f0b29


