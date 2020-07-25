# 【工具篇】deepCTR


## 1.deepCTR

![](media/15637037720747/15934854392778.jpg)

github:https://github.com/shenweichen/DeepCTR
测试数据: https://github.com/shenweichen/DeepCTR/blob/master/examples/criteo_sample.txt

```
deepctr/models/  实现了各种models
```

demo
```python
import pandas as pd
from sklearn.metrics import log_loss, roc_auc_score
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import LabelEncoder, MinMaxScaler
from deepctr.models import DeepFM
from deepctr.feature_column import  SparseFeat, DenseFeat, get_feature_names
#
data = pd.read_csv('criteo_sample.txt')
sparse_features = ['C' + str(i) for i in range(1, 27)]
dense_features = ['I' + str(i) for i in range(1, 14)]

data[sparse_features] = data[sparse_features].fillna('-1', )
data[dense_features] = data[dense_features].fillna(0, )
target = ['label']

# 1.Label Encoding for sparse features,and do simple Transformation for dense features
for feat in sparse_features:
    lbe = LabelEncoder()
    data[feat] = lbe.fit_transform(data[feat])
mms = MinMaxScaler(feature_range=(0, 1))
data[dense_features] = mms.fit_transform(data[dense_features])

# 2.count #unique features for each sparse field,and record dense feature field name

fixlen_feature_columns = [SparseFeat(feat, vocabulary_size=data[feat].nunique(),embedding_dim=4)
                       for i,feat in enumerate(sparse_features)] + [DenseFeat(feat, 1,)
                      for feat in dense_features]

dnn_feature_columns = fixlen_feature_columns
linear_feature_columns = fixlen_feature_columns

feature_names = get_feature_names(linear_feature_columns + dnn_feature_columns)
# 3.generate input data for model

train, test = train_test_split(data, test_size=0.2)
train_model_input = {name:train[name] for name in feature_names}
test_model_input = {name:test[name] for name in feature_names}

# 4.Define Model,train,predict and evaluate
#model = DeepFM(linear_feature_columns, dnn_feature_columns, task='binary')
model = NFFM(linear_feature_columns, dnn_feature_columns, task='binary')
model.compile("adam", "binary_crossentropy",
              metrics=['binary_crossentropy'], )

history = model.fit(train_model_input, train[target].values,
                    batch_size=256, epochs=10, verbose=2, validation_split=0.2, )
pred_ans = model.predict(test_model_input, batch_size=256)
print("test LogLoss", round(log_loss(test[target].values, pred_ans), 4))
print("test AUC", round(roc_auc_score(test[target].values, pred_ans), 4))
```



## 2.其他常用的工具

在deepctr之前有很多其他的工具，这里简单罗列如下:

1. LibFM:  http://www.libfm.org/
2. libFFM: github https://github.com/srendle/libfm
3. xLearn
4. tffm: https://github.com/geffy/tffm
tffm是FM方法的tensorflow版本，他支持：
(1) dense or sparse输出
(2) order >= 2

学习地址 https://github.com/babakx/fm_tensorflow












