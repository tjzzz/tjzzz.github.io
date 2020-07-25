# pandas-dataframe



## 常用的操作

* dataframe的行数和列数

`df.shape[0], df.shape[1]`

* 筛选满足指定条件的行的数据




* 筛选指定的列


* 随机抽样 `df.sample(n=xx, replace=False)`

* 按照行合并

```
df_list = [data, d1, d2]
df = pd.concat(df_list)
```



## dataframe输出中文乱码
df.to_csv(file_name2,encoding="utf_8_sig")



## list转dataframe

```
from pandas.core.frame import DataFrame
a=[[1,2,3,4],[5,6,7,8]]#包含两个不同的子列表[1,2,3,4]和[5,6,7,8]
data=DataFrame(a)#这时候是以行为标准写入的
```

## 修改列名

```
# 1、修改列名a，b为A、B。
df.columns = ['A','B']

# 2、只修改列名a为A
df.rename(columns={'a':'A'})
```


