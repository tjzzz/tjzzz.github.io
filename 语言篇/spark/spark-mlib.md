# 3. spark机器学习——ml/mllib相关的包


首先spark有两个关于机器学习的库ml和mllib.

 * mllib
mllib是面向RDD的.目前官网上处于维护模式。
> The MLlib RDD-based API is now in maintenance mode。The primary Machine Learning API for Spark is now the DataFrame-based API in the spark.ml package.


 
 * ml
 ml的API是面向dataset的(dataframe是dataset的一个特例)。dataset的底端是RDD， dataset对RDD进行了优化，是更进一步的抽象。
 	* DataFrames 的许多好处包括 Spark Datasources，SQL/DataFrame 查询，Tungsten 和 Catalyst 优化以及跨语言的统一 API 。
	* 用于 MLlib 的基于 DataFrame 的 API 为 ML algorithms （ML 算法）和跨多种语言提供了统一的 API 。
	* DataFrames 便于实际的 ML Pipelines （ML 管道），特别是 feature transformations （特征转换）。有关详细信息，请参阅 Pipelines 指南 。
 
关于两者的相似对比可以参看官方文档
http://spark.apache.org/docs/latest/ml-guide.html
http://spark.apachecn.org/docs/cn/2.2.0/ml-guide.html(中文)
 
 
 
 
参考资料：https://www.ibm.com/developerworks/cn/opensource/os-cn-spark-practice5/index.html

## 【ml】Pipeline

一个 Pipeline 在结构上会包含一个或多个 PipelineStage，每一个 PipelineStage 都会完成一个任务，如数据集处理转化，模型训练，参数设置或数据预测等，这样的 PipelineStage 在 ML 里按照处理问题类型的不同都有相应的定义和实现。首先需要了解几个主要的概念

* dataframe
* transformer
	* `transform()`方法
	* **转换器**，是一个 PipelineStage，实现上也是继承自 PipelineStage 类，主要是用来把 一个 DataFrame 转换成另一个 DataFrame，比如一个模型就是一个 Transformer，因为它可以把 一个不包含预测标签的测试数据集 DataFrame 打上标签转化成另一个包含预测标签的 DataFrame，显然这样的结果集可以被用来做分析结果的可视化。


* Estimator
	* .fit()
	* Estimator 中文可以被翻译成评估器或适配器，在 Pipeline 里通常是被用来操作 DataFrame 数据并生产一个 Transformer，如一个随机森林算法就是一个 Estimator，因为它可以通过训练特征数据而得到一个随机森林模型。实现上 Estimator 也是继承自 PipelineStage 类

* Parameter
	* Parameter 被用来设置 Transformer 或者 Estimator 的参数。

pipeline 就像是一个工作流


## 【mllib】- DataTypes

mllib支持读取libsvm格式的数据：

```
label index1:value1 index2:value2 ..
```




