# Interleaving


这里收集整理下interleaving这种实验机制的评估方法


## 0.ab与interleaving实验机制
参考博客

## 1.如何评估检索系统 related work


* 人工/专家打分，然后利用ndcg或者AP等metric进行测度
* 基于用户行为的
	* absolute metrics，比如基于点击，停留时间给这次search一个绝对打分。 pv满意度，session满意度这种
	* pairwise preference，只关注两个排序结果的相对差值。比如interleaving这种

interleaving方法分为balanced[Joachims [2002, 2003]和teamdraft[Radlinski et al. 2008]两种。

balanced interleaving其merge方式如下
![](media/15318899654075/15318934108487.jpg)






## 2.interleaving 算法介绍

先略


## 3.实验验证


作者这里在bing，yahoo搜索上进行了验证。
统计验证方法：







参考

![](media/15318899654075/15318924259128.jpg)


http://www.shuang0420.com/2016/09/20/Search%20Engines%E7%AC%94%E8%AE%B0%20-%20Evaluating%20Search%20Effectiveness/

