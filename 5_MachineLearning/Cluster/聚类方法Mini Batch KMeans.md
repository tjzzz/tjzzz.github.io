# 聚类方法Mini Batch KMeans

kmeans在数据量大的时候聚类时间会很久。Mini Batch KMeans使用了一个种叫做Mini Batch（分批处理）的方法对数据点之间的距离进行计算。Mini Batch的好处是计算过程中不必使用所有的数据样本，而是从不同类别的样本中抽取一部分样本来代表各自类型进行计算。由于计算样本量少，所以会相应的减少运行时间，但另一方面抽样也必然会带来准确度的下降


## 迭代步骤：
1：从数据集中随机抽取一些数据形成小批量，把他们分配给最近的质心
2：更新质心
与K均值算法相比，数据的更新是在每一个小的样本集上。对于每一个小批量，通过计算平均值得到更新质心，并把小批量里的数据分配给该质心，随着迭代次数的增加，这些质心的变化是逐渐减小的，直到质心稳定或者达到指定的迭代次数，停止计算

## 训练方法

和一般的Kmeans一样

```
from sklearn.cluster import MiniBatchKMeans

clf = MiniBatchKMeans(n_clusters = 3)
clf.fit(X)
pre_clu = clf.labels_
```


【参考资料】
http://www.dataivy.cn/blog/%E9%80%82%E5%90%88%E5%A4%A7%E6%95%B0%E6%8D%AE%E7%9A%84%E8%81%9A%E7%B1%BB%E7%AE%97%E6%B3%95mini-batch-k-means/



