在安装package之前，首先要安装的就是包管理器。`pip`主要是针对python包进行管理的工具

## 1.pip

安装pip `sudo easy_install pip`

通过pip安装python包  `pip install xxx`

**常见问题**

```
# 当前版本
pip --version
# 版本升级(有些包安装需要依赖高级版本)
pip install --upgrade pip

## 升级某些包
pip install --upgrade SomePackage

# 安装包时候报错`time out`
pip --default-timeout=100 install xxx

## 指定安装目录，比如机器上有多个版本Python，想指定到特定的版本上
pip install -t 目标目录 xxx
pip install -t /home/work/zhenzhen/python2.7/lib/python2.7/site-packages BeautifulSoup4
```

更新pip给出一个最简单的办法就是通过pip uninstall pip卸载pip，再用easy_install pip安装pip,这样安装的就是最新版本的pip了。


> 权限

在mac上安装包的时候，因为系统限制不让写到内容到系统目录里去。解决方法

* 重新安装一个自己版本的python，比如可以用ancoda安装
* pip安装的时候加入参数`pip install xxx --user`，安装到当前用户目录下。


安装完成后还需要将该目录加到环境变量里才能使用

```
export export PATH=/Users/$your_name/Library/Python/2.7/bin/:$PATH
```


> 更新某个包时候报错

`Cannot uninstall 'six'. It is a distutils installed project and thus we cannot accurately determine which files belong to it which would lead to only a partial uninstall.`

解决办法：

`pip install six --upgrade --ignore-installed six`


## 加速

pip install xxx -i https://pypi.tuna.tsinghua.edu.cn/simple/

或者是更改pip的配置 `~/.pip/pip.conf`
```
[global]
index-url = http://pypi.douban.com/simple  #豆瓣源，可以换成其他的源
extra-index-url = https://pypi.tuna.tsinghua.edu.cn/simple
trusted-host =
    pypi.douban.com            #添加豆瓣源为可信主机，要不然可能报错
    pypi.tuna.tsinghua         #清华
timeout = 120
```
