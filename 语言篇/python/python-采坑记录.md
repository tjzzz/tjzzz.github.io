# 采坑记录

计算余弦函数的反函数

```
RuntimeWarning: invalid value encountered in arccos
angles.append(np.arccos(value))
```
这里value的值必须是[-1, 1] 因为计算精度问题，可能实际数值是0.9999但是搞成了1.000002这样的



