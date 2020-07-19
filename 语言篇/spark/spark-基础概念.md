# 2.1 spark入口建立连接 + 输入/输出

## 1.建立连接
spark的入口方式。

spark建立连接的方式一般有如下两种

（1）SparkContext 老的入口方式

在Spark的早期版本，sparkContext是进入Spark的切入点。我们都知道RDD是Spark中重要的API，然而它的创建和操作得使用sparkContext提供的API；对于RDD之外的其他东西，我们需要使用其他的Context。比如:

* 对于流处理来说，我们得使用StreamingContext；
* 对于SQL得使用sqlContext；
* 而对于hive得使用HiveContext。

```python
from pyspark import SparkContext
sc = SparkContext(appName="my_app")
```

(2) SparkSession

随着DataSet和Dataframe提供的API逐渐成为新的标准API，我们需要一个切入点来构建它们，所以在 Spark 2.0中我们引入了一个新的切入点(entry point)：SparkSession

SparkSession实质上是SQLContext和HiveContext的组合（未来可能还会加上StreamingContext），所以在SQLContext和HiveContext上可用的API在SparkSession上同样是可以使用的。SparkSession内部封装了sparkContext，所以计算实际上是由sparkContext完成的
　　
```python
# 新的统计入口
from pyspark.sql import SparkSession
spark = SparkSession.builder.appName("my_app").getOrCreate()
sc = spark.sparkContext

```


## 2.输入输出
　　
(1)读入数据文件

将文本数据读入data.frame
examples/src/main/python/ml/dataframe_example.py:    newDF = spark.read.parquet(tempdir)


pyspark.sql.DataFrameReader. 

```
spark.read.csv()
spark.read.json()
spark.read.format('json').load(in_file)
df=spark.read.table('表名')
## write
df.write.mode('append').csv(out_file)
```


（2）输出结果到文件　　
**pyspark.sql.DataFrameWriter(df)**

将spark的dataframe输出，`df.write()`
```
df.write.csv()
df.write.json()
df.write.orc()
df.write.parquet()
```

其重要的参数有：
* mode

指定当数据已经存在时候的操作，append, overwrite, ignore(如果有存在的忽略这步执行),error(如果有存在的报错)

* sep
* quote
* header
* emptyValue。可以指定空值显示，默认是""



spark默认的csv输出是part-xxx.csv的多个文件中，如何将其只输出到一个文件。

```
df.coalesce(1).write.option("header", "true").csv("sample_file.csv")
```






