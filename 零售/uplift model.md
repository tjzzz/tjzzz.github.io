# uplift model

https://zhuanlan.zhihu.com/p/100821498

Uplift models用于预测一个treatment的增量反馈价值。 即
lift = P(buy|treatment) - P(buy|no treatment)
而传统模型，通常是直接预测目标 P(buy|treatment)

思路：因为同一个人不可能既treated又not treated。所以uplift的思路是借助相似用户的反应。
zzz: 
* AB test分成treatment组和not treatment 组
* 一个人其实可以既感知到实验组又感知到对照组效果，即将实验和对照策略的效果合并在一起，做interleaving实验




