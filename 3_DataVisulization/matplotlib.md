# matplotlib


matplotlib是python绘图的一个基础包，其用法和matlab语法有些相似。
大量第三方包扩展并构建了Matplotlib功能，包括几个较高级别的绘图接口(seaborn、holoviews、ggplot 等)，以及两个投影和绘图工具包(basemap和cartopy)
这里总结一些基本用法

## 1.matplotlib.pylab

## 2.matplotlib.pyplot

![](/media/15686309605233/15686322692816.png)


```python
import matplotlib.pyplot as plt
plt.plot(x, y, 其他属性)
```

pyplot是matplotlib中最常用的模块，

<!-- more -->

### 常用的图形参数设置


| 命令 | 功能 |
| --- | --- |
| axis([xmin, xmax, ymin, ymax]) | 设置坐标轴范围 |
| plot(x, y1,属性, y2, 属性) | 绘制线图 |
| title |  |
| xlabel, ylabel | 横纵坐标轴的标签 |
| text(x, y, 文字) | 添加文字描述 |
| annotate('注释', xy=(2, 1), xytext=(3, 1.5) | 添加箭头注释 |
| plt.yscale('linear’)   # linear, log, logit | 更换坐标轴刻度 |


**subplot 绘制子图**

```python
plt.figure()
plt.subplot(2, 3, 1)   #n行m列的子图
plt.plot(x1, y1)

plt.subplot(2, 3, 2)   #n行m列的子图
plt.plot(x2, y2)
```

```python
data = np.random.randn(2, 100)
fig, axs = plt.subplots(2, 2, figsize=(5, 5))
axs[0, 0].hist(data[0])
axs[1, 0].scatter(data[0], data[1])
axs[0, 1].plot(data[0], data[1])
axs[1, 1].hist2d(data[0], data[1])

plt.show()
```

**显示图像，读取图片**

需要先安装`pillow`包

```python
im = plt.imread('cat.jpg')  #将图像读取为数组
ax.imshow(im)                  # imshow将数组显示为图像
```
plt.colorbar()      #  可以添加颜色条

**3d绘图**

mplot3d


**多条曲线设置不同颜色**

正常情况下，matplot是自动变更绘制的颜色的

```python
import matplotlib.pyplot as plt
import numpy as np
x = np.linspace(0, 1, 10)
for i in range(1, 6):
    plt.plot(x, i * x + i, label='$y = {i}x + {i}$'.format(i=i))
plt.legend(loc='best')
plt.show()
```
如果需要自己指定颜色，可以通过设置color=xxx来设置。
如果数据中有标签分组，希望分组设置相同的颜色，但是组数比较多，不太好事先指定好颜色，则可以通过如下的方法

```python
import matplotlib.pyplot as plt
import numpy as np

x = np.linspace(0, 1, 10)
number = 5
cmap = plt.get_cmap('gnuplot')
colors = [cmap(i) for i in np.linspace(0, 1, number)]    # 挑选number种颜色

for i, color in enumerate(colors, start=1):
    plt.plot(x, i * x + i, color=color, label='$y = {i}x + {i}$'.format(i=i))
plt.legend(loc='best')
plt.show()
```


**绘制次坐标轴图**

```python
fig = plt.figure()
ax1 = fig.add_subplot(111)
ax1.plot(x, y1)
ax1.set_ylabel('Y1')

ax2 = ax1.twinx()  # this is the important function
ax2.plot(x, y2, 'r')
ax2.set_ylabel('Y2')
plt.show()
```


## 3. 绘制案例

常用的图像类型  https://www.matplotlib.org.cn/tutorials/introductory/sample_plots.html




### 1 绘制随时间动态变化的散点图

想要得到动画效果的图像，就是让多幅图连续播放，所以需要不断修改图中曲线的属性。首先需要了解下面像对象编程，在matplotlib中我们调用的任何函数，都会返回一个对象的实例。所以可以通过修改其相应的属性来改变曲线。比如常见的设置title，xlim等
`plt.plot(x, y); plt.title('plot title')`


主要用到的函数
`FuncAnimation(fig, func, frames=None,fargs=None)`
FuncAnimation的参数比较多，这里只列举出最重要的四个。

* fig: 指得是目前曲线所在在的figure。
* func: 这个函数主要是修改lines的属性，并返回。
* frames: 这是func参数中，跟每一帧相关的参数，靠它曲线才会发生变化。动画长度，一次循环包含的帧数
* fargs： 对应func中其他参数。
* interval 更新频率，以ms记
* blit: 选择更新所有点，还是仅更新产生变化的点。
* 可选参数 repeat，指定是否循环动画


官网的一个案例 
https://matplotlib.org/gallery/animation/simple_anim.html

模仿写的一个小例子  https://www.smslit.top/2018/11/12/matplotlib-animation/

```python
import numpy as np
import matplotlib.pyplot as plt
from matplotlib import animation

def plot_trace_animation(x, y):

	fig, ax = plt.subplots()
	plt.xlim(min(x), max(x))
	plt.ylim(min(y), max(y))
	line, = ax.plot(x[0], y[0])

	def init():  # only required for blitting to give a clean slate.
	    line.set_ydata([np.nan] * len(x))
	    return line,

	def update(i):
	    print(i)
	    line.set_xdata(x[:i])
	    line.set_ydata(y[:i])
	    #scat.set_data(x[:i], y[:i])
	    return line,

	anim = animation.FuncAnimation(fig, update, init_func=init,frames=10, interval=100)
	plt.show()

	#anim.to_html5_video()
	#anim.to_jshtml()
	anim.save('out.mp4')   # 需要先安装ffmpeg

x = range(1, 11)
y = range(5, 15)

plot_trace_animation(x, y)
```

保存

anim.save('out.mp4')   # 需要先安装ffmpeg
anim.save的 save 方法可以指定 writer ，这里要保存 gif 默认选择的 writer 为 pillow ，所以需要安装 pillow 库：

$ pip3 install pillow
按照如下调用方法即可保存动画为 gif，这里保存动画的帧数是受 animation.FuncAnimation 的 frames 和 save_count 影响的：

ani.save('animation.gif', writer='pillow')

### 




## 4. 问题

Q1: RuntimeWarning: More than 20 figures have been opened. Figures created through the pyplot interface (`matplotlib.pyplot.figure`) are retained until explicitly closed and may consume too much memory.

很多时候绘图的时候数量会比较多，一般是写个循环然后绘图。这时候定义的绘图函数就会执行很多次的`plt.subplot()` 即创建很多新的。可以在一开始或者初始化的时候就直接创建一张，然后后续的图都基于此改就好了，这样可以提升运行速度。



## 中文乱码
https://www.jianshu.com/p/dea646dab85c

下载中文字体 simhei.ttf。
搜索 matplotlib 的字体安装位置：locate -b '\mpl-data'。由于我创建了虚拟环境，得到的路径为：
/home/yilonghao/ml/venv/lib/python3.5/site-packages/matplotlib/mpl-data
切换到目标路径下（注意命令末尾的/fonts/ttf）：
cd /home/yilonghao/ml/venv/lib/python3.5/site-packages/matplotlib/mpl-data/fonts/ttf
将下载的字体拷贝到该路径下。
删除当前用户的 matplotlib 缓存。
cd ~/.cache/matplotlib
rm -rf *.*

作者：衣介书生
链接：https://www.jianshu.com/p/dea646dab85c
来源：简书
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。


## 参考

https://www.matplotlib.org.cn/home.html




# seaborn

时序类，转变下格式

```python
import numpy as np
import pandas as pd;
import matplotlib.pyplot as plt
# 构建 时间序列数据 从2000-1-31开始，以月份为间隔，构建100条记录
index = pd.date_range("1 1 2000", periods=100,freq="m", name="date")
data = np.random.randn(100, 4).cumsum(axis=0)

# 构建5列数据，列名分别为data a b c d
wide_df = pd.DataFrame(data, index, ["a", "b", "c", "d"])
"""
案例7：绘制时间序列数据
"""
sns.lineplot(data=wide_df)
plt.show()
```


背景设置 https://blog.csdn.net/dongzixian/article/details/102480875
https://zhuanlan.zhihu.com/p/27435863




