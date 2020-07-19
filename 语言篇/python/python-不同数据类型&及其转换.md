# 不同数据类型&及其转换



list转dataframe. `DataFrame(list[list])`

```
from pandas import DataFrame, Series
_list = [[1,2,3,4],[5,6,7,8]]    #包含两个不同的子列表[1,2,3,4]和[5,6,7,8]
df = DataFrame(_list)      #这时候是以行为标准写入的
```

list 转Series

```
ser = Series(_list)
```

series 转numpy的ndarray。 

```
ser.as_matrix()
```

dataframe转numpy的ndarray  

```
df.as_matrix()
df.values
np.array(df)
```



