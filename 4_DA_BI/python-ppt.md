# python-pptx

https://python-pptx.readthedocs.io/en/latest/user/quickstart.html


结构
![-w862](/media/16069778348269.jpg)


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





### superset中的绘图
https://www.pianshen.com/article/71901076300/