# Basic data manupulation

dplyr

dplyr包主要是对数据进行处理(过滤，切分，聚合，join等操作\)的一个非常强大的包。

* 基于c++编写的，处理速度快
[https://cran.rstudio.com/web/packages/dplyr/vignettes/introduction.html](https://cran.rstudio.com/web/packages/dplyr/vignettes/introduction.html)

## 基本函数

* filter: 过滤观测
* select：过滤变量
  * 选择符合条件的子集合
  * 同时支持 starts_with(),ends_with(),contains(), matches(), num_range(), one_of(), everything()
  * 可以对变量进行重命名
* arrange
* mutate
数据扩展，增加新的变量

* summarise


tbl_df将数据框转变为tbl对象, 主要是可以将一个sql对象转变为dplyr可以处理的tbl.`dplyr`可以处理data frame格式，但是如果你的数据比较大，建议还是讲其转变为`tbl_df`格式

 例子
 
```
library('dplyr')
class(iris)
tbl<-tbl_df(iris)
class(tbl)
tbl

# filter
filter(tbl, Species=='virginica' & Sepal.Length >6 )

select(tbl, -Species)
select(tbl, starts_with('Pe'))  #选取以Pe开头的变量

# arrange: order
arrange(tbl,Species,Sepal.Width)  #同时按照多个

# mutate
mutate(tbl, new_length = 2*Petal.Length)
transmute(tbl, new_length = 2*Petal.Length)   # 只保留新的变量，删掉原来的

# summarise
summarise(tbl, total=sum(Sepal.Width)) #汇总
summarise(tbl, total=sum(Sepal.Width), MAX_VALUE = max(Sepal.Width)) #汇总
# 汇总函数必须是 vector转为一个数, min, mean, median,n, first, last


```



## 高级函数
* join
left_join, right_join, inner_join

* group_by

* 管道函数
`%>%`
* do
* colwise:对每一列调用函数,类似apply, 是plyr中函数
`colwise(function)(df)`


```
# join
# group_by
group_tbl = group_by(tbl, Species)  # 先分组
summarise(group_tbl, sum(Sepal.Width), count = n(),length(Sepal.Width))
# 管道函数
new_tbl=mutate(tbl, new_len=2*Petal.Length)
group_new_tbl=group_by(new_tbl, Species) 
summarise(group_new_tbl, LEN=sum(new_len))
# 等价于
tbl %>% mutate(new_len=2*Petal.Length) %>% group_by(Species) %>% summarise(LEN=sum(new_len))

# do(data, fun())

# colwise
# library('plyr')
# colwise(round)(iris[,1:4])
```





