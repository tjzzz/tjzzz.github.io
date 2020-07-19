# 建立连接 sparkSession
spark的入口方式。



spark建立连接的方式一般有如下两种

```
from pyspark.sql import SparkSession

spark = SparkSession.builder.appName("CountVectorizerExample").getOrCreate()
sc = spark.sparkContext

```
```
from pyspark import SparkContext
sc = SparkContext(appName="Word2VecExample")
```

 在Spark的早期版本，sparkContext是进入Spark的切入点。我们都知道RDD是Spark中重要的API，然而它的创建和操作得使用sparkContext提供的API；对于RDD之外的其他东西，我们需要使用其他的Context。比如对于流处理来说，我们得使用StreamingContext；对于SQL得使用sqlContext；而对于hive得使用HiveContext。然而DataSet和Dataframe提供的API逐渐称为新的标准API，我们需要一个切入点来构建它们，所以在 Spark 2.0中我们引入了一个新的切入点(entry point)：SparkSession

SparkSession实质上是SQLContext和HiveContext的组合（未来可能还会加上StreamingContext），所以在SQLContext和HiveContext上可用的API在SparkSession上同样是可以使用的。SparkSession内部封装了sparkContext，所以计算实际上是由sparkContext完成的
　　
　　

# 2.矩阵相关
http://rdc.hundsun.com/portal/article/691.html




## 缓存
能够把数据缓存在集群的内存里。这通过调用RDD的cache函数来实现：`rddFromTextFile.cache()`


## sc.textFile()
## sparksession

将文本数据读入data.frame
examples/src/main/python/ml/dataframe_example.py:    newDF = spark.read.parquet(tempdir)



dataframe

```
df.printSchema()    #打印出列的名称和类型
df.show()   # 查看数据
* show(num，是否截断)
df..select("studentName", "email")
```

当一个字典不能被提前定义 (例如,记录的结构是在一个字符串中, 抑或一个文本中解析, 被不同的用户所属), 一个 DataFrame 可以通过以下3步来创建.

RDD从原始的RDD穿件一个RDD的toples或者一个列表;
Step 1 被创建后, 创建 Schema 表示一个 StructType 匹配 RDD 中的结构.
通过 SparkSession 提供的 createDataFrame 方法应用 Schema 到 RDD .

```
#For example:

# Import data types
from pyspark.sql.types import *

sc = spark.sparkContext

# Load a text file and convert each line to a Row.
lines = sc.textFile("examples/src/main/resources/people.txt")
parts = lines.map(lambda l: l.split(","))
# Each line is converted to a tuple.
people = parts.map(lambda p: (p[0], p[1].strip()))

# The schema is encoded in a string.
schemaString = "name age"

fields = [StructField(field_name, StringType(), True) for field_name in schemaString.split()]
schema = StructType(fields)

# Apply the schema to the RDD.
schemaPeople = spark.createDataFrame(people, schema)

# Creates a temporary view using the DataFrame
schemaPeople.createOrReplaceTempView("people")

# SQL can be run over DataFrames that have been registered as a table.
results = spark.sql("SELECT name FROM people")

results.show()
# +-------+
# |   name|
# +-------+
# |Michael|
# |   Andy|
# | Justin|
# +-------+
```
Find full example code at "examples/src/main/python/sql/basic.py" in the Spark repo.

