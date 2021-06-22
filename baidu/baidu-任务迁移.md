# 任务迁移


http://wiki.baidu.com/pages/viewpage.action?pageId=496903743

http://wiki.baidu.com/display/SPRK/Tutorial+for+Spark-baidu


## 庆城


17年的spark资源已经到位，kce组2台机器，1095核，216549M内存，存储51.2T，队列为spark-ubs-kce, 客户端拉取地址：
wget ftp://cp01-ubskce25.epc.baidu.com/home/work/spark-client-tianqi-2.1.tar.gz  
百度spark wiki地址：http://wiki.baidu.com/display/SPRK/Baidu+Spark
提交任务命令示例：./spark-client-tianqi-2.1/bin/spark-submit --master yarn --deploy-mode client --queue spark-ubs-kce ./test.py
任务进度查看页面：http://yq01-tianqi-normandy.dmop.baidu.com:8033/queue.html?queue=spark-ubs-kce&physical=tianqi-yarn_phy
欢迎各位试用，谢谢！




## 1.pyspark 读取udw表


```{python}
spark = SparkSession.builder.appName("video_test_" + day).getOrCreate()
video_session_sql = "select event_time, event_cookie, event_urlparams, event_query,  event_others, wisepsdisplay_qid, wisepsdisplay_pn,  wisepsdisplay_tn, " + \
        " wisepsdisplay_displayresult, wisepsdisplay_sampletags, clk_detail, media_time, event_browser, event_os, " + \
        " event_os_version, event_pd, event_cuid, anti_spam, event_day " + \
        " from ud_ml_sf_merge_data where event_day= " + day + " limit 100"

video_session = spark.sql(video_session_sql)
```
video_session是一个dataframe，可以直接取出里面的相关字段做特征提取




## 2.特征提取

通过map函数对每条记录进行特征提取

```
def parser_record(row):
    # do something
    
    # 返回key，value形式
    return (key, value)
    
    
video_session.rdd.map(parser_record)
```


## 合并汇总

假设map输出格式是 (key, [1,2,3]), 下面对相同的key的list中的指标值进行累加

```
video_session.rdd.map(simple_test).reduceByKey(lambda x,y : x + y)   # 单个值的累加
video_session.rdd.map(simple_test).reduceByKey(lambda x,y : [x[i] + y[i] for i in range(len(x))])
```


