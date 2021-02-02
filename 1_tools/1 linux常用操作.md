[TOC]


# 1.常用操作系统
在实际工作中应用较多的应该主要是centos，Ubuntu

(1) Ubuntu
安装package命令
```shell
apt update  ## 更新下
apt-get install xxx
```

# 2.linux常用操作命令






## 清除 deleted但是进程还在占用的任务

lsof |grep delete | grep -v grep | awk '{print $2}' | xargs kill -9

## 删除文件恢复


`grep -a -B 1 -A 200 '文件里的关键字' /dev/vdb > error`
最终会在error文件里有记录



## 文件操作


* 删除指定日期之前的

```
# 删除当前目录下，92天之前的文件
find ./ -mtime +92 -type f | xargs rm -f
```

* 删除指定文件大小的，比如空文件

```
find . -name "*" -type f -size 0c | xargs -n 1 rm -f
```


## 文件类操作

实际工作中经常用到两个文件数据求交集、差集、并集等的操作。这里主要是借助了`uniq`函数。（可以通过`man uniq`详细查看uniq功能)。需要注意的是：**uniq比较的是相邻的两行之间的数据，所以在操作的时候一定得先对原始文件进行sort**。



```
>> man uniq

DESCRIPTION
The uniq utility reads the specified input_file comparing adjacent lines, and writes a copy of each unique input line to the output_file.
     If input_file is a single dash (`-') or absent, the standard input is read.  If output_file is absent, standard output is used for out-
     put.  The second and succeeding copies of identical adjacent input lines are not written.  Repeated lines in the input will not be
     detected if they are not adjacent, so it may be necessary to sort the files first.

The following options are available:

-c     # count 数据每个line + 出现频次
-d     # 只输出重复的line 
-u     # 只输出不重复的line
```

**交集**
sort a.txt b.txt | uniq -d
**并集**
sort a.txt b.txt | uniq
**差集**
a.txt-b.txt:
sort a.txt b.txt b.txt | uniq -u
b.txt - a.txt:
sort b.txt a.txt a.txt | uniq -u



## 文件get

* wget



* scp



* send email

发送带附件的邮件
echo "this is content" | mutt -s "this is subject" zhengzhenzhen@baidu.com -a readme.md
（需要先安装mutt）



## 压缩&解压



ln -s 源目录 目标快捷方式
查看当前文件夹下大小  du -sh *
tar -czf my.tar.gz *.jpg
tar -xzvf file.tar.gz

压缩

```
tar –cvf jpg.tar *.jpg //将目录里所有jpg文件打包成tar.jpg
tar - czf jpg.tar.gz *.jpg   //将目录里所有jpg文件打包成jpg.tar后，并且将其用gzip压缩，生成一个gzip压缩过的包，命名为jpg.tar.gz
tar –cjf jpg.tar.bz2 *.jpg //将目录里所有jpg文件打包成jpg.tar后，并且将其用bzip2压缩，生成一个bzip2压缩过的包，命名为jpg.tar.bz2
tar –cZf jpg.tar.Z *.jpg   //将目录里所有jpg文件打包成jpg.tar后，并且将其用compress压缩，生成一个umcompress压缩过的包，命名为jpg.tar.Z
rar a jpg.rar *.jpg //rar格式的压缩，需要先下载rar for linux
zip jpg.zip *.jpg //zip格式的压缩，需要先下载zip for linux
```

解压

```
##.gz 
gunzip FileName.gz 
gzip -d FileName.gz 
　　
#
tar –xvf file.tar //解压 tar包
tar -xzvf file.tar.gz //解压tar.gz
tar -xjvf file.tar.bz2   //解压 tar.bz2
tar –xZvf file.tar.Z   //解压tar.Z
unrar e file.rar //解压rar
unzip file.zip //解压zip
```



替换；

　：s/str1/str2/g 用字符串 str2 替换行中所有出现的字符串 str1 

perl -p -i -e "s/G/awin/g" $file_name 文件中指定字符进行替换
（把G替换为awin）


## 编码

改变文件的编码

```
iconv  -f gbk -t utf-8 old_file > new_file
```

## 排序

sort -n -k2 file.txt

## 删除前几行
sed -i '1,nd' filename

```
/home/work/zhenzhen/algorithm_analysis/query_classifier/5_final_all
```



## 判断文件或目录是否存在

```
import os
# 判断文件夹或文件是否存在
os.path.exists('d:/assist')
os.path.exists('d:/assist/getTeacherList.py')
#
os.path.isfile('d:/assist/getTeacherList.py')
# list目录下的所有文件
file_list = os.listdir('/home/work/zhenzhen/time_factor/')
```



## tab自动联想history命令

在.bashrc中添加bind '"\e[A": history-search-backward'
