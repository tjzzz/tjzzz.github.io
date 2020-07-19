# hadoop 安装第三方python库


https://blog.csdn.net/wh357589873/article/details/70049088

在写MR任务的时候经常会加载一些python包，比如sklearn，numpy，集群默认环境并没有，需要自己上传。这里有个简单的办法： 创建一个虚拟的python环境，安装自己所需，然后打包上传


```
pip install virtualenv

# 新建虚拟环境
virtualenv myvp
virtualenv --relocatable myvp
# 激活虚拟环境
source myvp/bin/activate
```

然后开始安装各种包吧

```
pip install XXX
```
退出虚拟环境命令 `deactivate`

压缩环境包  `tar -czf myvp.tar.gz myvp`,上传至hdfs上，然后就可以用



迁移到新的机器上，可以使用如下命令激活：

```
## 拷贝迁移至其他服务器下进行解压： 
进入./venv/bin/下修改activate文件中参数：

VIRTUAL_ENV="/home/venv"
export VIRTUAL_ENV
将上述VIRTUAL_ENV修改为当前venv文件夹正确的路径，然后执行:

source activate


```




## 进阶版
QQ:

启动hadoop任务时候，报错`./myvp/bin/python: error while loading shared libraries: libpython2.7.so.1.0: cannot open shared object file: `. 需要在安装python的时候就进行编译， 而virtualenv是直接copy了一个编译好的python环境过来的，所以需要重新下载编译一个python



1. 安装编译 python
https://blog.csdn.net/huangshaoyan1982/article/details/8456052

2. 创建虚拟环境

```
virtualenv -p python-zhenzhen/bin/python my_env

```

创建完成后一直提示没法pip install东西。。。


3. 就不用虚拟环境了，直接基于新下载的包，pip安装到这个python下

pip install -t /home/work/zhenzhen/python2.7/lib/python2.7/site-packages BeautifulSoup4

