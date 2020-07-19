# 日期类函数

python中常用的两个时间转换的函数是`datetime`, 'time'


## python-datetime

利用datetime将时间戳、字符转为datetime类

```
# 1. 时间戳 => datetime
>>> time_stamp = '1522050612'
>>> tmp = datetime.datetime.fromtimestamp(float(time_stamp))
datetime.datetime(2018, 3, 26, 15, 50, 12)
>>> tmp.strftime('%Y%m%d')
'20180326'
```

strftime 与strptime的区别

* `strftime`是将一个tm结构格式化为一个字符串
* `strptime`是将一个字符串转为日期格式

```
# 2. 字符 《=》 日期
>>> time_str = '20190420'
>>> dt = datetime.datetime.strptime(time_str, '%Y%m%d')
datetime.datetime(2019, 4, 20, 0, 0)

>>> dt.strftime('%Y%m%d')
'20190420'
```


```
# 3. 日期、字符 =>  时间戳
time_str = '20190420'
d = datetime.datetime.strptime(time_str, '%Y%m%d')

t = d.timetuple()   # 转成time的格式
time_stamp = int(time.mktime(t))
```

format格式说明



给定开始和结束日期，循环出日期的list

```python
import sys
import datetime

def get_days(day0, day1):
    """
    get multi days
    """
    day_list = []
    delta = datetime.timedelta(days=1)
    d1 = datetime.datetime.strptime(day0,'%Y-%m-%d').date()
    d2 = datetime.datetime.strptime(day1,'%Y-%m-%d').date()
    tmp = d1
    while tmp <= d2:
        day = tmp.strftime("%Y-%m-%d")
        day_list.append(day)
        tmp += delta
    return day_list
```


## python-time

```python
def transtime(timestamp):
    """
    时间戳转换
    """
    #转换成localtime
    time_local = time.localtime(float(timestamp))
    dt = time.strftime("%Y-%m-%d %H:%M:%S",time_local)

    return dt
    ```

