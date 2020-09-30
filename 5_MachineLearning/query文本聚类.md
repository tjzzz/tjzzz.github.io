# query文本聚类

* [ ] 是不是cache问题tf-idf
* [ ] 添加下降维的步骤
* [ ] 稀疏矩阵
* [ ] 数据切分更小li'du
* [ ] Mini Batch KMeans http://www.dataivy.cn/blog/%E9%80%82%E5%90%88%E5%A4%A7%E6%95%B0%E6%8D%AE%E7%9A%84%E8%81%9A%E7%B1%BB%E7%AE%97%E6%B3%95mini-batch-k-means/


实验全量的
http://yq01-tianqi-spark-yarn00.yq01.baidu.com:8388/proxy/application_1511855101950_42074/

-------




刚哥的代码：https://github.com/honestOrg/gxdgroup/blob/master/src/main/scala/cn/com/gxdgroup/dataplatform/avm/utils/AVMUtils.scala






## 全量






前期构造词频矩阵：
## 1.生成原始的词频矩阵

* http://spark.apache.org/docs/latest/ml-features.html#countvectorizer
* `examples/src/main/python/sql/basic.py`

输入数据：每行是切分好的term

```
spark = SparkSession.builder.appName("CountVectorizerExample").getOrCreate()
sc = spark.sparkContext
# $example on$
# Input data: Each row is a bag of words with a ID.

lines = sc.textFile("/user/ubs/kce/zhenzhen/spark/test_data/corpus_title2")
parts = lines.map(lambda l: l.split('#'))   # convert all the term to a list
termRDD = parts.map(lambda p: Row(tid=p[0], words=p[1].split(' ')))

df = spark.createDataFrame(termRDD)
# fit a CountVectorizerModel from the corpus.
cv = CountVectorizer(inputCol="words", outputCol="features")
#, vocabSize=3, minDF=2.0)

model = cv.fit(df)

result = model.transform(df)
```

## 2.tf-idf
* http://spark.apache.org/docs/latest/mllib-feature-extraction.html#tf-idf
* http://spark.apache.org/docs/latest/ml-features.html#feature-extractors
ml中的函数比mllib中的多
examples/src/main/python/mllib/tf_idf_example.py

```
~/zhenzhen/spark_study/spark/examples/src/main/python/mllib $  pyspark zzz_tf_idf_example.py
```

## 3.降维

## 4.直接聚类

 ```
 # pyspark这个默认是启动的集群任务，之前测试的本地数据会出错，脚本中需把输入目录改成集群路径
  ~/zhenzhen/spark_study $  pyspark kmeans.py  > log.test
 ```

## 六神合体


* 词频矩阵+tfidf


http://www.zengyilun.com/spark-similarity/



上述所有步骤(tfidf，降维,聚类)合并在一起

 ```
 # pyspark这个默认是启动的集群任务，之前测试的本地数据会出错，脚本中需把输入目录改成集群路径
  ~/zhenzhen/spark_study $  pyspark tfidf_kmeans.py  > log.test
  这个测试ok，但是中心点都是0，应该是数据问题
 ```




