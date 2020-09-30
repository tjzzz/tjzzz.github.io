# 常见问题&采坑&性能


### QQ1:spark dataframe中有array无法直接保存问题

需要更改array为str类型，不然无法直接保存

```
sample_data = sample_data.withColumn(mm + '_2', sample_data[mm].cast('string')) \
.drop(mm).withColumnRenamed(mm + '_2', mm)
```
    


### QQ2 Spark SQL排序顺序不被GroupBy和Aggregation保留？


### QQ3:
有时候启动任务时候经常报如下的错:
`WARN TaskSetManager: Stage 1 contains a task of very large size (xxx KB). The maximum recommended task size is 100 KB.`

这种情况一般是由于spark partition的个数太少，导致每个任务的内存较大。可调整其partition数目。


一个Stage中包含的task过大，一般由于你的transform过程太长，因此driver给executor分发的task就会变的很大。
所以解决这个问题我们可以通过拆分stage解决。也就是在执行过程中调用cache.count缓存一些中间数据从而切断过长的stage。

```
df.rdd.getNumPartitions()           # 查看当前数据的partition数目
df_new = df_old.repartition(100)    # 重新repartition
```

