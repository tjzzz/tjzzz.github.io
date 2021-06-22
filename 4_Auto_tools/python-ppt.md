# python-pptx

https://python-pptx.readthedocs.io/en/latest/user/quickstart.html


结构
![-w862](/media/16069778348269.jpg)



[[自动化分析平台#pycaret]]


ppt中有9种基本版式
0,Title (presentation title slide)
1,Title and Content
2,Section Header (sometimes called Segue)
Two Content (side by side bullet textboxes)
Comparison (same but additional title for each side by side content box)
Title Only
Blank
Content with Caption
Picture with Caption
对应的是 prs.slide_layouts[0] through prs.slide_layouts[8].

---
**shapes:**  `shapes = slide.shapes`
As for real-life shapes, there are these nine types:
shape shapes – auto shapes with fill and an outline
text boxes – auto shapes with no fill and no outline
placeholders – auto shapes that can appear on a slide layout or master and be inherited on slides that use that layout, allowing content to be added that takes on the formatting of the placeholder
line/connector – as described above
picture – as described above
table – that row and column thing
chart – pie chart, line chart, etc.
smart art – not supported yet, although preserved if present
media clip – video or audio

placeholders,是shapes的一个合集，就是幻灯片中的一些固定格式


> https://zhuanlan.zhihu.com/p/342573671
> https://zhuanlan.zhihu.com/p/291729098


## 1 PPT结构说明：
每一张幻灯片叫做：slide幻灯片页；
每一页中的每一个方框，叫做一个shape；
每一个方框中的每一段内容，叫做Paragraph段落。
块儿run：属于每个段落中的概念

```
prs = Presentation()  # 创建一个新的
prs = Presentation('my.pptx')   # 打开一个原有的
##
slide = prs.slides[0]

```

---


**shapes**
shapes相当于是一张ppt页面中所有的元素，具体会有不同的类型，比如文本框
- auto shapes 文本框
- picture




**placehoulders**
shapes的格式集合，相当于是预定义好了的一些格式模版


---


https://blog.csdn.net/AI_LINNGLONG/article/details/104358105




### superset中的绘图
https://www.pianshen.com/article/71901076300/