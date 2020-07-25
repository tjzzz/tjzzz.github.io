# face_recgnization

github
https://github.com/ageitgey/face_recognition





## 1. 安装

文档: https://zhuanlan.zhihu.com/p/28271869

```
pip install face_recognition
```
直接安装会报错，安装face_recognition这个之前需要先安装编译dlib

```
brew install boost
brew install boost-python --with-python3

# install dlib
git clone https://github.com/davisking/dlib.git
cd dlib
mkdir build; cd build; cmake .. -DDLIB_USE_CUDA=0 -DUSE_AVX_INSTRUCTIONS=1; cmake --build 

cd ..
python setup.py install --yes USE_AVX_INSTRUCTIONS --no DLIB_USE_CUDA
```
If there is no cmake on your mac, you can use  `brew install cmake`. After all these have been done, run

```
pip install face_recognition
```

## 2.usage
face_recognition有两种使用方式，命令行方式和python包方式

(1) 命令行方式





(2) python 包
https://face-recognition.readthedocs.io/en/latest/face_recognition.html#module-face_recognition.api








## 参考资料
https://zhuanlan.zhihu.com/p/28271869



https://medium.com/@ageitgey

-------

https://www.jianshu.com/p/281aa6a3823a

一个案例
https://www.jianshu.com/p/38ca6daf6b40
http://www.opencv.org.cn/opencvdoc/2.3.2/html/doc/tutorials/tutorials.html


tf案例
https://blog.csdn.net/u010016927/article/details/75722416

knn
https://www.leiphone.com/news/201707/gIbNsPtWk460m5vj.html

https://blog.csdn.net/Mbx8X9u/article/details/79124840

https://www.ctolib.com/topics-101544.html

https://www.oschina.net/code/snippet_2558914_54339


## new

https://www.leiphone.com/news/201704/rYdpAvh4SvgVPpRQ.html





