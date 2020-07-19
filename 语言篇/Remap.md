# Remap

随着互联网时代的数据形式的多样化，空间数据的分析也越来越受到重视。基于用户、出租车的轨迹的交通优化，调度问题也越来越多的出现在一些大数据竞赛中，通过这种众包的形式，这类社会化问题逐渐得到一定程度的解决。


REmap是一个基于Echarts(http://echarts.baidu.com/echarts2/doc/doc.html)的R pacakge，主要是提供一个渐变的可交互的地图可视化展现.
https://github.com/lchiffon/REmap

其处理逻辑：

* 使用R处理传入的数据
* 写出Javascript脚本(Echarts)
* 保存在临时的html文件中
* 调用浏览器展示

## 获取经纬度

```{r,eval=F}
#library(devtools)
#install_github('lchiffon/REmap')

library(REmap)
get_city_coord("Shanghai")   # 获取城市的经纬度  使用了baiduMapApi
get_geo_position (c("北京","Shanghai","广州") )   #获取城市向量的经纬度
```

## 迁移地图
通过remap函数绘制地图，生成一个html文件，保存在电脑里，并通过浏览器打开

```
library(REmap)
origin = rep("北京",10)
destination = c('上海','广州','大连','南宁','南昌',
                '拉萨','长春','包头','重庆','常州')
dat = data.frame(origin,destination)
out = remap(dat,title = "REmap实例数据",subtitle = "theme:Dark")
plot(out)
```

同时可以通过`get_theme`函数来进行颜色样式的调整

```
get_theme(theme = "Dark", lineColor = "Random",
  backgroundColor = "#1b1b1b", titleColor = "#fff",
  borderColor = "rgba(100,149,237,1)", regionColor = "#1b1b1b")
```
```
remap(dat,title = "REmap实例数据",subtitle = "theme:Bright",
            theme = get_theme("Bright",lineColor = "orange"))
```
  

## 分级图
数据两列data.frame(x=地区名字,y=value)
`rempC(data, maptype=c('china', 'world','省名字'), color=, theme=)`

```
library(REmap)
remapC(chinaIphone, maptype='china',color = 'orange')
remapC(chinaIphone, color = c('orange','red'))
``` 

`mapNames()`可以得到某个地图下的子图信息。

```
data = data.frame(country = mapNames('西藏'), value = 50*sample(7)+200)
head(data)
remapC(data,maptype = '西藏',color = 'skyblue')
```

## remapB
remapB是用于创建一个以百度地图为底图的recharts效果,可以添加一些点或者线的动态效果

```
remapB(center=, zoom=5, markLineData， markPointData)
center： 地图的中心，可以通过get_city_coord获取
zoom: 5代表国家级的地图,15代表市级的地图
markLineData 出发地，目的地
```

### 标线
markLine相关的参数

* markLineData 标线使用的数据,第一列为出发地,第二列为目的地
* markLineTheme 控制标线颜色,形状等,由markLineControl来控制
* geoData 标中各个点的经纬度坐标,如果没有,会使用BaiduAPI自动查找,用以储存markLine和markPoint的地理位置信息.具体的格式与get_city_coord返回相同:

subway数据

```
remapB(center=get_city_coord('shanghai'), zoom=10, markLineData = subway[[2]], geoData = subway[[1]])

```

### 标点


## remapH()
热力图

```
heatmap = sampleData()
remapH(heatmap,minAlpha = 0.1,title = "Heat Map from REmap")
# minAlpha 将小于minAlpha的值都设置为minAlpha以防止太小的值也能看到

```

【参考资料】
郎大为的博客  http://langdawei.com/REmap/






