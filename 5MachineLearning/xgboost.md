# xgboost
http://xgboost.readthedocs.io/en/latest/python/python_intro.html





xgb中计算特征重要性的有以下几种不同的方式。默认是使用weight的方式
```python
 xgboost.plot_importance(model, importance_type=xxx)
```

* 'weight': the number of times a feature is used to split the data across all trees.在所有树中一个特征被用来分裂数据的次数
* 'gain': the average gain across all splits the feature is used in.
* 'cover': the average coverage across all splits the feature is used in.
* 'total_gain': the total gain across all splits the feature is used in.
* 'total_cover': the total coverage across all splits the feature is used in.


