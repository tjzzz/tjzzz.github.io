# tool-多元数据-Pyod

Pyod是一款专门做异常检测的python工具箱

github:   https://github.com/yzhao062/pyod
文档说明: https://pyod.readthedocs.io/en/latest/index.html

<!-- more -->

**基本API：**
```python
BaseDetector.fit(X, y)    # y可有可无
BaseDetector.decision_function()    # 原始的异常得分
BaseDetector.predict()
BaseDetector.predict_proba()    # 给出是异常点的概率
```
其属性
```
BaseDetector.decision_scores_      # 异常得分，score越大越异常
BaseDetector.labels_               # 1 代表异常
```


**与sklearn区分**
借鉴了sklearn的API形式，但是注意两者不通用


**例子**

（1） one model

```python
# train the KNN detector
from pyod.models.knn import KNN
from pyod.utils.data import generate_data
from pyod.models.combination import aom, moa, average, maximization

## ! 输入的X必须是array [n_samples, n_features]
X, y = generate_data(train_only=True)  # load data
X.shape

clf = KNN()
clf.fit(X)

# get the prediction labels and outlier scores of the training data
y_train_pred = clf.labels_  # binary labels (0: inliers, 1: outliers)
y_train_scores = clf.decision_scores_  # raw outlier scores

# get the prediction on the test data
y_pred = clf.predict(X)  # outlier labels (0 or 1)
y_scores = clf.decision_function(X) 
```

(2) 有时候单个model结果不一定可信，可以将多个model的结果进行combine
合并的方式主要有：
- average
- maximization
- average of maximization (AOM), 将所有的detector分成不同的组，每组先max， 然后对不同组再就mean
- maximization of average(MOA), 将所有的detector分成不同的组，每组先average， 然后对不同组取max

```python
# initialize 20 base detectors for combination
import numpy as np
k_list = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120, 130, 140,
            150, 160, 170, 180, 190, 200]
n_clf = 10

train_scores = np.zeros([X.shape[0], n_clf])

for i in range(n_clf):
    k = k_list[i]
    clf = KNN(n_neighbors=k, method='largest')
    clf.fit(X)
    train_scores[:, i] = clf.decision_scores_
#
from pyod.utils.utility import standardizer
# scores have to be normalized before combination, 0均值，1 standard error
scores_norm = standardizer(train_scores)
## 不同的组合方法
comb_by_average = average(scores_norm)
comb_by_maximization = maximization(scores_norm)
comb_by_aom = aom(scores_norm, 5) # 5 groups
comb_by_moa = moa(scores_norm, 5) # 5 groups
```
