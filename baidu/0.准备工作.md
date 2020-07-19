# 0.准备工作



首先是下载安装spark http://spark.apache.org/downloads.html

这里附上mac上的简单安装步骤https://www.jianshu.com/p/e9345328a817



## 1.安装
* 客户端拉取地址：

     wget ftp://cp01-ubskce25.epc.baidu.com/home/work/spark-client-tianqi-2.1.tar.gz  

* 百度spark wiki地址
    http://wiki.baidu.com/display/SPRK/Baidu+Spark
* 提交任务命令示例
   /home/work/spark-client-tianqi-2.1/bin/spark-submit --master yarn --deploy-mode client --queue spark-ubs-kce ./test.py
* 任务进度查看页面
http://yq01-tianqi-normandy.dmop.baidu.com:8033/queue.html?queue=spark-ubs-kce&physical=tianqi-yarn_phy


@华东26机器上安装的
ssh work@cp01-ubskce26.epc.baidu.com
/home/work/spark-client-tianqi-2.1

一个demo /home/work/spark-starter2/python





## 2.测试 wordcount
home/work/spark-client-tianqi-2.1/bin/spark-submit --master yarn --deploy-mode client --queue spark-ubs-kce WordCount.py


## 3. 文档教程doc
* 中文翻译 http://spark.apachecn.org/docs/cn/2.2.0/sql-programming-guide.html

* 官方文档示例
	* http://spark.apache.org/docs/latest/ml-clustering.html#k-means
	* http://spark.apache.org/docs/latest/mllib-clustering.html
* **【推荐】github 有demo代码，还有测试数据**
   https://github.com/apache/spark/blob/master/examples/src/main/python/ml/kmeans_example.py
   
   ```
   https://tracholar.github.io/wiki/#tools
   ```
   
   
   
   spark上有ml和mllib两个库，每个对应的应用方法不太一样。 ML的API是面向Dataset的（Dataframe是Dataset的子集，也就是Dataset[Row]）， mllib是面对RDD的。
   
## 4. 学习
脚本地址：18机器   git clone https://github.com/apache/spark.git

![](media/15113301027700/15113617493859.jpg)



**命令行方式**

![](media/15113301027700/15124588805508.jpg)




 Demo1： 测试word count，数据存在集群上的
 
```
~/zhenzhen/spark_study $  pyspark WordCount.py
```

 Demo2： 测试mllib下的kmeans方法
 
 ```
 # pyspark这个默认是启动的集群任务，之前测试的本地数据会出错，脚本中需把输入目录改成集群路径
  ~/zhenzhen/spark_study $  pyspark kmeans.py  > log.test
 ```

