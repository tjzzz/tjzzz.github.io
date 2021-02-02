# spring boot
Spring Boot不是一门新技术，所以不用紧张。从本质上来说，Spring Boot就是Spring,它做了那些没有它你也会去做的Spring Bean配置。它使用“习惯优于配置”（项目中存在大量的配置，此外还内置了一个习惯)。
Spring将很多魔法带入了Spring应用程序的开发之中，其中最重要的是以下四个核心。

- 自动配置：针对很多Spring应用程序常见的应用功能，Spring Boot能自动提供相关配置
- 起步依赖：告诉Spring Boot需要什么功能，它就能引入需要的库。
- 命令行界面：这是Spring Boot的可选特性，借此你只需写代码就能完成完整的应用程序，无需传统项目构建。
- Actuator：让你能够深入运行中的Spring Boot应用程序，一探究竟。

spring boot与spring的区别 https://www.jianshu.com/p/ffe5ebe17c3a


## 1 目录结构

（1）Spring Boot 的基础结构共三个文件夹:
```
src/main/java：程序开发文件夹，我们的在这里写程序代码。
src/main/resources：配置文件
src/test/java：测试程序
```
（2）src/main/java下的DemoApplication.java

主要作用就是主程序的入口，相当于main函数。

（3）src/main/resources下的static

里面保存了一些配置资源，比如图片等等。

（4）src/main/resources下的application.proties

它是全局配置文件，在这里定义一些接口的端口号等等各种信息。

（5）pom文件

这个文件极其重要，他定义了一些项目的依赖信息，

（6）mvnw和mvnw.cmd

一个是在linux下的shell执行脚本，一个定义了在windows下的bat执行脚本

![](media/15940355196534/15942128420193.jpg)

大体的目录结构类似于
![](media/15940355196534/15942131137436.jpg)

* **entity**

持久化，与数据库对应；实体bean，一般是用于ORM对象关系映射，一个实体映射成一张表，一般无业务逻辑代码。
负责将数据库中的表记录映射为内存中的Entity对象，事实上，创建一个EntityBean对象相当于创建一条记录，删除一个EntityBean对象会同时从数据库中删除对应记录，修改一个Entity Bean时，容器会自动将Entity Bean的状态和数据库同步

* **DTO**

数据传输对象（Data Transfer Object）
dto是做表示层（展示给用户）的，而实体是数据对象（表）。表示层dto的是由多个实体构成，或一个实体的一个部分，或多个实体的各个部分的结合体？如果你认为dto没有必要，难道你做数据库的时候，表与页面的展示是一摸一样的吗？不太现实吧。

dto是面向对象的，实体是面向关系数据库。


* **repository**
repository 处于业务层和数据层之间，在他的的内部封装了数据查询和存储的逻辑。
repository有三种接口可以方便开发者操作数据库.
https://segmentfault.com/a/1190000012346333

* CrudRepository 执行基本的CRUD操作
* PagingAndSorting 增加了分页和排序功能
* JpaRepository则在上面的基础上又扩展了一些功能：查询列表，批量删除，强制同步，example查询

![](media/15940355196534/15942638610109.jpg)






## 2.环境配置

推荐使用IntelliJ IDEA
vscode配置
- 安装spring boost extension pack


## 3.入门

入手资源
https://zhuanlan.zhihu.com/p/150513285

demo案例 https://zhuanlan.zhihu.com/p/75144914

(1) spring-boot-demo
https://github.com/xkcoding/spring-boot-demo

(2)SpringBoot-Labs 

https://github.com/YunaiV/SpringBoot-Labs


**lombok**

@Data
提供所有属性的get和set方法
@Log4j
为类提供一个 属性名为 log 的 log4j 日志对象，提供默认构造方法。
@Value
这个注解用在 类 上，会生成含所有参数的构造方法，get 方法，此外还提供了equals、hashCode、toString 方法。




## 4.学习

官网: https://spring.io/projects/spring-boot

（1）example1: hello world
开始案例:https://start.spring.io/

启动方式M1:
```
# 在项目目录下
./mvnw spring-boot:run
```

（2）例子2： https://github.com/xkcoding/spring-boot-demo

(3)recbee


```
aop   # 对于我们开发中最常见的可能就是日志记录，事务处理，异常处理等等。
controller # https://www.jianshu.com/p/ea512f634fd6
```

模块层次:

@注解: https://zhuanlan.zhihu.com/p/135987318

读取配置信息
使用 @Value("${property}") 读取比较简单的配置信息
@ConfigurationProperties读取配置信息并与 bean 绑定
JPA相关
@Entity声明一个类对应一个数据库实体。
@Table 设置表名
@Id ：声明一个字段为主键。
@Column 声明字段

导入配置文件
@PropertySource注解
@ImportResource导入xml配置文件
@Import 导入额外的配置信息