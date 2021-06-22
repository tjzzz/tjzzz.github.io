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


## lightgbm

https://bacterous.github.io/2018/09/13/LightGBM%E4%BD%BF%E7%94%A8/


处理类别特征:https://blog.csdn.net/u013385018/article/details/104167969
在使用python API时(参考官方文档)
1.可以使用pd.DataFrame存放特征X, 每一列表示1个特征, 将类别特征设置为X[cat_cols].astype('category'). 这样模型在fit时会自动识别类别特征.
2.在模型的fit方法中传入参数categorical_feature, 指明哪些列是类别特征.
3.类别特征的值必须是从0开始的连续整数, 比如0,1,2,..., 不能是负数.


官方文档：
https://lightgbm.readthedocs.io/en/latest/Parameters.html#categorical_feature

