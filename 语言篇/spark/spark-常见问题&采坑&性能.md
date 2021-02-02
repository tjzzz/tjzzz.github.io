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


## Spark - ERROR Executor: java.lang.OutOfMemoryError: unable to create new native thread

那么可能性非常大的原因是你当前通过spark-submit或spark-sql启动的程序中开启了过多的进程，以至超过了操作系统对当前用户所允许打开的进程数的上限。确定这个问题的方法是这样的：

首先，通过命令：
```
ulimit -u
```
来查看一下系统允许的当前用户能开启的进程数，默认值是1024。

然后，我们通过如下这样一条命令来持续追踪当前用户开启的进程数
```
while true;do ps -u your-user-name  -L | wc -l;sleep 1;done
```
接下就可以启动的我们Spark程序然后观察进程数量的变化了，如果发现进程数量持续上涨，并且在超过了进程上限之后抛出了OOM异常，那么就可以直接判定是用户的所能开启的进程数量收受限了。



## 
```
Traceback (most recent call last):
  File "/home/zzzheng/miniconda3/lib/python3.7/site-packages/py4j/java_gateway.py", line 1067, in start
    self.socket.connect((self.address, self.port))
ConnectionRefusedError: [Errno 111] Connection refused
ERROR:py4j.java_gateway:An error occurred while trying to connect to the Java server (127.0.0.1:10225)
Traceback (most recent call last):
  File "/home/zzzheng/miniconda3/lib/python3.7/site-packages/py4j/java_gateway.py", line 929, in _get_connection
    connection = self.deque.pop()
IndexError: pop from an empty deque
```