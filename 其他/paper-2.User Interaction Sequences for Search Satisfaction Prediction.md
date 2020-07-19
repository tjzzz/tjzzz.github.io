# 2.User Interaction Sequences for Search Satisfaction Prediction


这篇文章做的内容主要是：

*  建立action sequence 
*  提取最具有代表性的子序列


是和(1)同一批人写的，所提取的特征种类：

* viewport timeline
* cursor timeline
* keybord timeline

具体特征也基本一致

## 1. 基本序列特征分析

* 序列长度分布
* 特征分次序的占比分析
* 特征序列的多样性分析-熵

## 2.提取informative subsequences

从label的标注数据中，反过来去寻找一些有信号的特征

* 方法一：频繁项集

设置序列窗宽(1-4)，计算频繁项集。

* 方法二：Discriminative Subsequences

直观上讲，有信息的序列应该是有区分度的，即能将label好坏区分开，如果没有区分度，这个序列也没什么用

作者这里从统计假设减压的角度，运用了卡方检验的办法，具体如下

H0: there is no detectable difference between two classes
H1: there is a detectable difference between the two classes.


对于某个子序列，可以将所有序列分为包含该子序列和不包含该子序列，另一方面label也对应不同的等级。所以是是否包含-label等级这两个因素之间进行卡方检验(me),要是label是数的话直接t检验也可以了吧

![](media/15223232323724/15223276046651.jpg)


* 方法三: interleaved subsequences

上面两个方法有一个缺点，就是提取的序列是相邻的
![](media/15223232323724/15223980489567.jpg)

方法三主要的就是序列不一定是连续的，有点结合1和2的意思。其中
$\phi(S)$是2中的区分度score
supp(S)是序列S的支持度
分子是表示子序列S 在每一个序列i中出现的次数

# 3.time
前文讲到的sequence，只是把用户的动作时刻的序列给刻画出来了，但是并没有考虑该动作的时长(或者只是简单的定义为longclick，shortclick)，将其作为一个action处理

这里是用了一个A Multivariate Hawkes process，最终将两两action之间的类似"转移概率"的数算出来，取平均值作为一个特征。


## 6. 模型预测
最后根据提取的子序列，每一个子序列作为一个feature，用gbdt做学习预测

![](media/15223232323724/15294749835320.jpg)


## reference

[8] Jaroslav Fowkes and Charles Su on. 2016. A Subsequence Interleaving Model
for Sequential Pa ern Mining. arXiv preprint arXiv:1602.05012 (2016).

[31] Yiqun Liu, Ye Chen, Jinhui Tang, Jiashen Sun, Min Zhang, Shaoping Ma, and
Xuan Zhu. Di erent users, di erent opinions: Predicting search satisfaction
with mouse movement information. In SIGIR 2015.

