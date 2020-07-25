# scala

https://www.runoob.com/scala/scala-file-io.html

**注释**

* 单行注释 `//`
* 多行注释 /* xxxxx*/

**字符串**

scala中字符串向量是用双引号", 字符变量是用单引号'

```
# 多行字符串是用三个双引号
val foo = """菜鸟教程
www.runoob.com
www.w3cschool.cc
www.runnoob.com
以上三个地址都能访问"""
```

**字符串方法**

```scala
str.length()    //字符串长度
str1.concate(str2)   //字符串连接
str1 + str2  //字符串连接
```

**变量声明**

var 声明变量
val 声明常量

```scala
var myVar: String = "hello"
val myval:String="world"

# 也可以不指定类型
var myvar="hello"
val myval = "world"
```


**方法定义**

```scala
def functionName ([参数列表]) : [return type] = {
   function body
   return [expr]
}
## eg
def add(a:Int, b:Int): Int = {
	return a + b
}
println(add(1, 1))
```
如果该方法没有返回值，返回类型可以写成`Unit`



**数组**

```scala
# 数组声明
var z= new Array[String][3]      //长度为3的空数组
var z = Array("hello", "my", "world")
## 多维数组
import Array._
var myMatrix = ofDim[Int](3, 3)
```


**数据类型转换**

var.toDouble, toInt,

