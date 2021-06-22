# leetcode



## 数组


```
# 有效的数独
class Solution(object):
    
   def isValidSudoku(self, board):
        """
        :type board: List[List[str]]
        :rtype: bool
        """
        """
        把每一个9格子都拿出来，9+9+9=27个，比较麻烦；
        直接扫描每一个点，看其是否在所在的行、列、单元格
        """
        '''
        #### 这种写法是错误的，row_list[4].append(5),结果所有的都append(5)了
        row_list = 9 * [[]]
        col_list = 9 * [[]]
        area_list = 9 * [[]]
        '''
        row_list = [[] for i in range(9)]
        col_list = [[] for i in range(9)]
        area_list = [[] for i in range(9)]
        
        for i in range(9):
            for j in range(9):
                area_id = i/3*3 + j/3
                item = board[i][j]
                if item != '.':
                    if item in row_list[i] or item in col_list[j] or item in area_list[area_id]:
                        return False
                    else:
                        row_list[i].append(item)
                        col_list[j].append(item)
                        area_list[area_id].append(item)
        return True
                
        
        
```

## 字符

Q1:
尝试修改string的值（导致“ TypeError: ‘str’ object does not support item assignment”）

**string是一种不可变的数据类型**，该错误发生在如下代码中：

```
spam = 'I have a pet cat.'
spam[13] = 'r'
print(spam)
```
而你实际想要这样做：

```
spam = 'I have a pet cat.'
spam = spam[:13] + 'r' + spam[14:]
print(spam)
```

Q1:字符反转

```
def string_reverse1(string):  
    return string[::-1]  
  
def string_reverse2(string):  
    t = list(string)  
    l = len(t)  
    for i,j in zip(range(l-1, 0, -1), range(l//2)):  
        t[i], t[j] = t[j], t[i]  
    return "".join(t)  
  
def string_reverse3(string):  
    if len(string) <= 1:  
        return string  
    return string_reverse3(string[1:]) + string[0]
      
 ```
 


str为字符串 
str.isalnum() 所有字符都是数字或者字母 
str.isalpha() 所有字符都是字母 
str.isdigit() 所有字符都是数字 
str.islower() 所有字符都是小写 
str.isupper() 所有字符都是大写 
str.istitle() 所有单词都是首字母大写，像标题 
str.isspace() 所有字符都是空白字符、\t、\n、\r

