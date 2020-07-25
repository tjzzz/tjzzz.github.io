# 基于python

## 1. streamlit

地址: https://streamlit.io/

https://www.jiqizhixin.com/articles/2019-10-31-4

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

## 2.shiny数据可视化

查看下python中是否有类似R shiny功能的package，具体的还没有开始摸底使用
https://pbpython.com/wine_visualization.html

https://github.com/bokeh

https://www.youtube.com/watch?v=4L568emKOvs

https://medium.com/@plotlygraphs/introducing-dash-5ecf7191b503


dash
bokeh
pyxley



使用指南

`pip install bokeh --user
Collecting bokeh
`


