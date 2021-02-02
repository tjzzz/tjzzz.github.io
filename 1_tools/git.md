# git

git 是一个版本管理的工具，能够非常方便的对项目进行版本控制。

## 1建立自己的代码库

假设你的用户名是zzz
（1）生成公钥
ssh-keygen -t rsa -f ~/.ssh/id_rsa.zzz
cat ~/.ssh/id_rsa.zzz.pub 保存到icode或者是自己的github上
（2）clone

```
git clone  xxxxx代码库             # 将代码库克隆到本地
## 如果机器是多个人使用的话用--local,如果是自己一个人的话可以设置成--global
git config --local user.email zzz邮箱
git config --local user.name zzz用户名
git push origin master:refs/for/master
```

## 2 基本操作

当我们新增或者更新了一个文件后，如何上传到代码库
```
git add xxx
git commit -m '注释'
git push origin HEAD:refs/for/master
```
从代码库将新代码下载到本地，更新本地库

```
git pull
```
## 3.常用操作

(1) 还原文件到之前的某个版本。

当发现新提交的版本有问题，想回退到之前的某个版本的之后，可以进行如下操作。`git long`
比如我想修改自己写的这个`utils.py` 代码

```
git log utils.py
## 可以看到一共提交了3次，假设喔想回退到9.25提交的那个版本
git checkout 742bf4a53e473b2536b53cb3ad56072ae236a1c3 utils.py 
git commit -m "revert to previous version"
```
![](media/15637037678160/15699932802240.jpg)




我不知道”undo”是什么意思。您可以删除core.excludesfile设置，如下所示：
git config --global --unset core.excludesfile
当然你也可以简单地编辑配置文件：
git config --global --edit
…然后手动删除设置。

git config --global --edit



git log
git reset --hard xxxxx


查看本地与云端的diff

git rm —cache  删除已经提交的内容


（2）repo中含有子模块的
```
git pull --recurse-submodules
```

(3) git分支
新建分支
```
git checkout -b v1
```
删除分支
Git-命令行-删除本地和远程分支
切换到要操作的项目文件夹命令行: $ cd <ProjectPath>
查看项目的分支们(包括本地和远程) ...
删除本地分支命令行: $ git branch -d <BranchName>
删除远程分支命令行: $ git push origin --delete <BranchName>

