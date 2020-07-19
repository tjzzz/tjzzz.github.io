# 序列 Unsupervised Clickstream Clustering for User Behavior Analysis

clickstream analysis related work

* markov chains
* 聚类方法
* 作者的


作者是用的基于similarity graph的聚类方法。每个人是一个节点，节点和节点之间的联系是相似度。

**序列离散化**

![](media/15723556746605/15851321593806.jpg)

对于时间，是将其离散化，事件变成了
act1, g1, act2, g2, act3, g3......



**1 相似度的定义**
对于每个人的序列S，指定一个数k，可以生成所有k-gram的子串 （其中si可能是act也可能是时间间隔）
$$T_k(S) = {(s_js_{j+1}...s_{j+k-1}| j \in [1, n+1-k])}$$

对于任意的两个序列S1, S2。可以找到其并集$T=T_k(S_1)\cup T_k(S_2)$
T是两个子序列集合的并集，以这个并集里的每个序列作为一个基，然后建立one_hot的向量,作为原始序列的度量。

这样，每个序列pair (S1, S2)都可以转换成对应的两个向量c1,c2。基于向量的相似度就可以建立起序列的相似度。

**2 聚类**
 Divisive Hierarchical Clustering (自上而下层次聚类)

**3 类别解读**

对于类别解读，因为是使用的层次聚类，因此只要找到每一次分层的时候的主要特征作为解释变量即可。作者这里使用的是卡方统计量的方法: 对于给定的一个聚类划分C1 和not C1, 依次计算每个特征带来的卡方score，筛选top的作为有区分度的解释变量。

对于某个子序列，可以将所有序列分为包含该子序列和不包含该子序列，另一方面label也对应着不同的类别。所以是是否包含-label等级这两个因素之间进行卡方检验。



