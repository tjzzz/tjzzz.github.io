# 基于python

## 1. streamlit
streamlit的特点: 上手非常快，API非常简洁，搭建的界面只能是左侧边栏、右侧展现的结构

地址: https://streamlit.io/

https://www.jiqizhixin.com/articles/2019-10-31-4

awesome-examples:  https://github.com/MarcSkovMadsen/awesome-streamlit

* 安装


```
pip install streamlit
streamlit hello
```
当写完自己的app脚本后，运行方法 ` streamlit run first_app.py`
同时也支持 ` streamlit run https://raw.githubusercontent.com/streamlit/demo-uber-nyc-pickups/master/app.py`


example1: 添加video
```python
video_dir = 'my.mp4'
video_file = open(video_dir, 'rb')
video_bytes = video_file.read()
st.video(video_bytes)
```


采坑:
点击button或者筛选后，整个页面都更新了
https://discuss.streamlit.io/t/the-button-inside-a-button-seems-to-reset-the-whole-app-why/1051/3


一个案例 
https://zhuanlan.zhihu.com/p/216832236


其他高级布局
https://blog.streamlit.io/introducing-submit-button-and-forms/


streamlit更新记录
https://share.streamlit.io/streamlit/release-demos/0.81/0.81/streamlit_app.py?page=forms_demo
不同颜色 https://github.com/tvst/st-annotated-text


通过markdown方式设置颜色:

```python
st.markdown('<font color=red size=6 face=“黑体”>字体颜色</font>', unsafe_allow_html=True)
```


相关配置

streamlit config show

### 发布
- streamlit for teams
- github 公开版
- https://blog.csdn.net/m0_47467356/article/details/108708113


官方论坛上的部署方案
https://discuss.streamlit.io/t/streamlit-deployment-guide-wiki/5099

案例：
阿里云上部署 https://zhuanlan.zhihu.com/p/245294921
https://github.com/gwrun/tutorials/tree/main/streamlit/docker-compose
hosted on Heroku: https://github.com/Taxuspt/heroku_streamlit_nginx 


nativefier: 能将网页打包成成应用。
https://github.com/nativefier/nativefier


## 2.dash
使用教程: https://dash.plotly.com/installation
Python Dash Gallery: https://dash-gallery.plotly.host/Portal/
其对应的案例 code在 https://github.com/plotly/dash-sample-apps/tree/master/apps/


github上找的一些案例:
https://github.com/christianwbsn/ml-pipelining

## 2.shiny数据可视化

查看下python中是否有类似R shiny功能的package，具体的还没有开始摸底使用
https://pbpython.com/wine_visualization.html

https://github.com/bokeh

https://www.youtube.com/watch?v=4L568emKOvs

https://medium.com/@plotlygraphs/introducing-dash-5ecf7191b503


dash: https://www.jianshu.com/p/0aaafaa33bb1
bokeh
pyxley



使用指南

`pip install bokeh --user
Collecting bokeh
`


