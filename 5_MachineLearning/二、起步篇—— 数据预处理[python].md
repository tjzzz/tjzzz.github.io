# 二、起步篇—— 数据预处理[python]

> 一方面可以多查些官方说明
> 多去看些kaggle，tianchi等的比赛案例，他们数据预处理做的很全面到位
> 实践一些工作中的项目，将代码规范化



## 1.缺失表示
python中缺失是nan，如果本身数据中缺失是用其他方式表示的，可以先转换一下
`df.replace('-',np.nan)`


```python

import numpy as np
import pandas as pd
from io import StringIO
import sys

df = pd.read_table('zz')
df = df.replace('-',np.nan).head()
df.head()
```




## 2.缺失的简单处理办法

### 暴力删除

`isnull()`   判断是否缺失

`dropna( axis = 0 /1 )` 参数axis表示轴选择，axis=0 代表行，axis=1 代表列

`dropna(subset=[''])`   删除指定列中有空值的一行数据


### 默认值填充

`df.fillna(value)`
或者对不同列填不同的值


### 统计/算法填充


```python
from sklearn.preprocessing import Imputer
# strategy 有mean,median, most_frequent 方式
# axis 默认是0，列向， axis=1行向
dff = df.loc[:, ['comment_time']]
imr = Imputer(missing_values = 'NaN', strategy = 'mean', axis = 0 )
imr = imr.fit(dff.values)
imputed_data = imr.transform(dff.values)
```


```python
## 3.分类数据处理
from sklearn.preprocessing import LabelEncoder
class_le = LabelEncoder()
y = class_le.fit_transform(df['nid'].values)

```


```python
## 数据标准化
from sklearn.preprocessing import MinMaxScaler
mms = MinMaxScaler()
X_train_norm = mms.fit_transform(imputed_data)
X_test_norm = mms.transform(imputed_data)
```

## 参考资料
https://blog.csdn.net/Amy_mm/article/details/79799629
https://www.cnblogs.com/charlotte77/p/5622325.html

https://www.kaggle.com/pmarcelino/comprehensive-data-exploration-with-python



