# optical flow 光流

[概念](https://zhuanlan.zhihu.com/p/44859953)
光流的概念是Gibson在1950年首先提出来的。它是空间运动物体在观察成像平面上的像素运动的**瞬时速度**，是利用图像序列中像素在时间域上的变化以及相邻帧之间的相关性来找到上一帧跟当前帧之间存在的对应关系，从而计算出相邻帧之间物体的运动信息的一种方法。一般而言，光流是由于场景中前景目标本身的移动、相机的运动，或者两者的共同运动所产生的。
简言之：就是有相对运动带来的空间物体在成像平面的瞬时速度。

对于一个图片序列，每张图像中每个像素的运动速度和运动方向找出来就是**光流场**。

**光流的测定方法**

基本原理就是找到时间间隔△t内，物体的移动坐标(x1, y1), (x2, y2). 假设位于(x,y,t)的体素的亮度是I(x,y,t), 则有:
I(x,y,t) = I(x+△x, y+△y, t+△t)
根据泰勒定理展开即有$\partial I/\partial x△x +\partial I/\partial y△y + \partial I/\partial t△t = 0$


具体实现方法: opencv的API中有几种不同的实现方案
* Lucas–Kanade method: calcOpticalFlowPyrLK
* The Gunnar-Farneback optical flow: calcOpticalFlowFarneback
* block matching method: CalcOpticalFlowBM

https://github.com/yjxiong/dense_flow