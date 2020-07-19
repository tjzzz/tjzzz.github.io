# Attention Mechanism

attention是一种基于提升RNN的encoder + decoder效果的机制。 attention机制可以对输入X的每个部分赋予不同的权重，抽取出更加重要的信息和特征。

(1)attention机制解决的主要问题

以rnn机器翻译为例
* 不管多长的句子，都会最终被压缩到一个固定长度的隐向量，这样会有信息损失、
* 序列场景下，每个item的权重都是一样的；类似的，图像场景下，每个像素的权重也是一样的。注意力机制其实和人识别东西有些类似，人会先看到物体的关键部分特征，然后整合成整体。


seq2seq结构




## 常见的一些attention模型

按照涉及的序列个数分类：
(1) self-attention

序列=> 类别，文本分类

(2) distinctive attention

序列 => 序列， 机器翻译

(3) co-attention
多于2个序列，比如给定一张图片和一个问题，需要生成响应的答案

按encoder序列参与计算attention的位置分
(1) soft attention
(2) hard attention


参考资料：
* https://zhuanlan.zhihu.com/p/73357761
* https://zhuanlan.zhihu.com/p/31547842
* https://zhuanlan.zhihu.com/p/43493999