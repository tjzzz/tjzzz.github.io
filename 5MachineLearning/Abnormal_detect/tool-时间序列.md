# tool-时间序列-工具使用

时间序列工具 
https://github.com/chickenbestlover/RNN-Time-series-Anomaly-Detection
https://github.com/rob-med/awesome-TS-anomaly-detection

<!-- more -->

## 2. ADTK
github: https://github.com/arundo/adtk. 
adtk主要是 unsupervised / rule-based time series anomaly detection.

教程 https://arundo-adtk.readthedocs-hosted.com/en/stable/userguide.html。

adtk提供了很多检测的方法，但是不会自动选择，得需要自己指定具体用哪个。
```
"ThresholdAD",
"QuantileAD",
"InterQuartileRangeAD",
"GeneralizedESDTestAD",
"PersistAD",
"LevelShiftAD",
"VolatilityShiftAD",
"AutoregressionAD",
"SeasonalAD",
"CustomizedDetector1D",
"MinClusterDetector",
"OutlierDetector",
"RegressionAD",
"PcaAD",
```
其中季节性，趋势性分解，用的是`statsmodels.tsa.seasonal`
![-w533](media/15869348134936/15871046874575.jpg)


例子  https://arundo-adtk.readthedocs-hosted.com/en/latest/notebooks/demo.html#PersistAD
```python

```

## 1. banpei SSA: 奇异谱分析
banpei 是进行异常检测的一个python 包。其`banpei/banpei/`中主要包含了两种模型
* Outlier detection (Hotelling's theory) 均值+方差
*  Change point detection （sst奇异谱转换）

python package `fastsst`
https://github.com/statefb/singular-spectrum-transformation
这里详细介绍下sst，SSA是一种研究非线性时间拿序列的方法，他根据观测到的序列构造出一个轨迹矩阵，然后通过对轨迹矩阵分解、重构，从而提取出能代表原始时间序列不同成分的信号。具体地，主要包括如下几步:
（1）嵌入
假设原始的时间序列是 $Y(T) = (y_1, y_2,... y_T)$,选择一个窗口m，根据原始序列构造如下的轨迹矩阵。m的选择不宜过大，可以是本身数据周期的整数倍。
![](media/15869348134936/15869444913257.jpg)

(2)svd分解

$$X = U\Sigma V^T$$

(3)分组
选择贡献率达到一定阈值的top r个
(4)重构
矩阵重构 $$X_{mxn}  \approx U_{m*r}\Sigma_{r*r} V^T_{r*n}$$
原序列重构, 通过对角平均法的方式
![](media/15869348134936/15869481299057.jpg)
![](media/15869348134936/15869481699594.jpg)


m 窗口的选择，较小m反应短期趋势，较大的就是长期趋势。
变点发现


![](media/15869348134936/15869498566967.jpg)



