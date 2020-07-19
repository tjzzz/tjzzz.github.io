# list

leetcode 


@gitbook
https://xidianwlc.gitbooks.io/python-data-structrue-and-algrothms/content/


github
https://github.com/qiyuangong/leetcode/tree/master/python




1.二叉树的层次遍历

```
# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None

class Solution(object):
    def levelOrder(self, root):
        """
        :type root: TreeNode
        :rtype: List[List[int]]
        """
        res = []
        if root is None:
            return res
        tmp_q = []
        tmp_q.append(root)
        
        while len(tmp_q) != 0:
            next_q = []
            n = len(tmp_q)
            tmp_value = []
            for i in range(n):
                r = tmp_q[i]
                if r.left is not None:
                    next_q.append(r.left)
                if r.right is not None:
                    next_q.append(r.right)
                tmp_value.append(r.val)
            res.append(tmp_value)
            tmp_q = next_q
        return res
                    
```


2，树的最长路径 

```
# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None

class Solution(object):
    def maxDepth(self, root):
        """
        :type root: TreeNode
        :rtype: int
        """
        if root == None:
            return 0
        else:
            left_depth = self.maxDepth(root.left)
            right_depth = self.maxDepth(root.right)
            return max(left_depth, right_depth) + 1
        
```




3，两个数的和为0 

```
class Solution(object):
    def twoSum(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: List[int]
        """
        # for i in range(len(nums)):
        #     for j in range(i+1, len(nums)):
        #         if nums[i] + nums[j] == target:
        #             return i,j
        # return 0,0
        #
        num_dict = {}
        for i in range(len(nums)):
            num_dict[nums[i]] = i
        #
        for i in range(len(nums)):
            other = target - nums[i]
            if other in num_dict and num_dict[other]!= i:
                return i, num_dict[other]
        return 'error, no result'
            
        
```

4，三个数的和为0 

```
    def threeSum(self, nums):
        n = len(nums)
        nums.sort()
        for k in range(n):
            if nums[k] > 0:
                return 'input error'

            i = k + 1
            j = n - 1 

            while i < j:
                ss = nums[k] + nums[i] + nums[j]
                if ss > 0:
                    j -= 1
                else:
                    if ss < 0:
                        i += 1
                    else:
                        return [nums[k], nums[i], nums[j]]
        return []

```

5，四个数的和为0 

```
    def FourSum(self, nums):
        n = len(nums)
        nums.sort()
        for i in range(n):
            for j in range(i+1, n):
                if nums[i] + nums[j] > 0:
                    return []

                k = j + 1
                m = n - 1 

                while k < m:
                    ss = nums[i] + nums[j] + nums[k] + nums[m]
                    if ss > 0:
                        m -= 1
                    else:
                        if ss < 0:
                            k += 1
                        else:
                            return [nums[i], nums[j], nums[k], nums[m]]
        return []
```


6，合并两个有序链表 


7，合并n个有序的链表 





8，树的根到叶子路径数字的和的最大值

```
### zzz
    def sumpath(self, root):
        """
        :type root: TreeNode
        :rtype: int
        """
        if root == None:
            return 0
        if root.left ==None and root.right == None:
            return root.val
        else:
            sum_left = sumpath(root.left)
            sum_right = sumpath(root.right)
            return max(sum_left, sum_right) + root.val
```


9，leetcode排列组合问题permutation 

```
class Solution(object): 
    def permute(self, nums):  
        res = []  #res 用于记录并返回所有排列组合。  
        self.excute(nums,[],res)  
        return res  
          
    def excute(self,nums,path,res): #path用于存放经过的元素  
        if not nums:  
            res.append(path)  
        for i in xrange(len(nums)):  
            self.excute(nums[:i]+nums[i+1:],path+[nums[i]],res) #每经过一个元素，将其从nums中取出，放入path，当nums为空时，就完成一个排列组合。  
                    


```

10，回文字符串马拉车

```
    #Python
    def manacher(self, s):
        #预处理
        s='#'+'#'.join(s)+'#'
        print s

        RL=[0]*len(s)
        MaxRight=0
        pos=0
        MaxLen=0
        for i in range(len(s)):
            if i<MaxRight:
                RL[i]=min(RL[2*pos-i], MaxRight-i)
            else:
                RL[i]=1
            #尝试扩展，注意处理边界
            while i-RL[i]>=0 and i+RL[i]<len(s) and s[i-RL[i]]==s[i+RL[i]]:
                RL[i]+=1
            #更新MaxRight,pos
            if RL[i]+i-1>MaxRight:
                MaxRight=RL[i]+i-1
                pos=i
            #更新最长回文串的长度
            MaxLen=max(MaxLen, RL[i])
        return MaxLen-1
```

11，leetcode 32 有效的括号串 

```

    def isValidParentheses(self, s):

        table = {'(':')', '[':']', '{':'}'}

        n = len(s)
        res = []
        for i in range(n):
            if s[i] not in ['(','[','{','}',']',')']:
                continue
            if len(res) > 0 and res[-1] in table and table[res[-1]] == s[i]:
                res = res[:-1]
            else:
                res.append(s[i])
        print res
        return len(res) == 0 


```



两个栈实现队列

```
class QueueWithTwoStacks(object):
    def __init__(self):
        self._stack1 = []
        self._stack2 = []

    def appendTail(self,x):
        self._stack1.append(x)

    def deleteHead(self):
         if self._stack2:
             return self._stack2.pop()
         else:
             if self._stack1:
                while self._stack1:
                    self._stack2.append(self._stack1.pop())
                return self._stack2.pop()
             else:
                 return None
```

合并两个有序list

```
    # 归并排序
    def merge(self, l1, l2):

        result = []
        i = 0
        j = 0
        while i < len(l1) and j < len(l2):
            if l1[i] <= l2[j]:
                result.append(l1[i])
                i += 1
            else:
                result.append(l2[j])
                j += 1
        #
        if i== len(l1):
            result += l2[j:]
        if j == len(l2):
            result += l1[i:]
        return result

    # 递归调用
    def merge_sort(self, l):

        if len(l) == 1:
            return l
        else:
            mid = len(l)/2
            left = l[:mid]
            right = l[mid:]
            l1 = self.merge_sort(left)
            l2 = self.merge_sort(right)

            return self.merge(l1, l2)
            
    def merge_k_list_sort(self, lists):
    		"""
    		多个有序序列的合并
    		"""
        if len(lists) == 1:
            return lists[0]
        else:
            n = len(lists)
            mid = n/2
            left = lists[:mid]
            right = lists[mid:]
            l1 = self.merge_k_list_sort(left)
            l2 = self.merge_k_list_sort(right)
            #print l1, l2

            return self.merge(l1, l2)
```


假设链表L有n个元素，如果这n个元素中每一个元素被访问的概率都为相同，则访问到第i个元素所前移的指针的平均次数为：

Average = （1+2+3+......+n）/n = n(1+n)/2/n = n/2 + 1/2

所以，访问第i个元素的平均时间为O(n)。相比起来，在数组L中访问第i个元素的平均时间为O(1)。


leetcode上练习

```
#encoding=utf8
class Solution(object):
    def plusOne(self, digits):
        """
        :type digits: List[int]
        :rtype: List[int]
        """
        out = []
        n = len(digits)
        num = 0
        for i in range(n):
            num += 10**(n-1-i) * int(digits[i])
        num_str = str(num + 1)
        print num_str
        return map(lambda i: int(num_str[i]), range(len(num_str)) )
        
    # 
    def moveZeroes(self, nums):
        """
        :type nums: List[int]
        :rtype: void Do not return anything, modify nums in-place instead.
        """
        k = 0
        for i in range(len(nums)):
            if nums[i] != 0:
                nums[k] = nums[i]
                k += 1
        for j in range(k, len(nums)):
            nums[j] = 0
        return nums

    def isValidSudoku(self, board):
        """
        :type board: List[List[str]]
        :rtype: bool
        """
        """
        把每一个9格子都拿出来，9+9+9=27个，比较麻烦；
        直接扫描每一个点，看其是否在所在的行、列、单元格
        """
        
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
                
    def rotate(self, matrix):
        """
        :type matrix: List[List[int]]
        :rtype: void Do not return anything, modify matrix in-place instead.
        """
        
        """
        # M1
        (x,y)关于原点顺时针90度是(y, -x). 所以可以有(x0,y0)为中心点坐标
        x2 = x0 -y0 + y1= y1
        y2 = x0 + y0 - x1 = n-1 - x1
        # M2：
        根据规律，按照辅对角线对称，然后上下颠倒即可
        """
        print matrix
        n = len(matrix)
        for i in range(n-1):
            for j in range(n-1-i):
                tmp = matrix[i][j]
                matrix[i][j] = matrix[n-1-j][n-1-i]
                matrix[n-1-j][n-1-i] = tmp
        #
        print matrix
        for i in range(n/2):
            for j in range(n):
                tmp = matrix[i][j]
                matrix[i][j] = matrix[n-1-i][j]
                matrix[n-1-i][j] = tmp
        print matrix
        
    def reverseString(self, s):
        """
        :type s: str
        :rtype: str
        """
        print s[0]
        n = len(s)
        for i in range(n/2):
            tmp = s[i]
            print i, n-1-i
            s[i] = s[n-1-i]
            s[n-1-i] = tmp
        return s
        
    def reverse(self, x):
        """
        :type x: int
        :rtype: int
        """

        if x < 0:
            x1 = str(-1 * x)
            res = -1 * int(x1[::-1])
        else:
            x1 = str(x)
            res = int(x1[::-1])
        if res > 2**31-1 or res < -1 * 2**31:
            return 0
        return res


    def ThreeSum(self, nums):
        n = len(nums)
        nums.sort()
        for k in range(n):
            if nums[k] > 0:
                return 'input error'

            i = k + 1
            j = n - 1 

            while i < j:
                ss = nums[k] + nums[i] + nums[j]
                if ss > 0:
                    j -= 1
                else:
                    if ss < 0:
                        i += 1
                    else:
                        return [nums[k], nums[i], nums[j]]
        return []


    def FourSum(self, nums):
        n = len(nums)
        nums.sort()
        for i in range(n):
            for j in range(i+1, n):
                if nums[i] + nums[j] > 0:
                    return []

                k = j + 1
                m = n - 1 

                while k < m:
                    ss = nums[i] + nums[j] + nums[k] + nums[m]
                    if ss > 0:
                        m -= 1
                    else:
                        if ss < 0:
                            k += 1
                        else:
                            return [nums[i], nums[j], nums[k], nums[m]]
        return []

    def sumpath(self, root):
        """
        :type root: TreeNode
        :rtype: int
        """
        if root == None:
            return 0
        if root.left ==None and root.right == None:
            return root.val
        else:
            sum_left = sumpath(root.left)
            sum_right = sumpath(root.right)
            return max(sum_left, sum_right) + root.val


    # 
    def permute(self, nums):  
        res = []  #res 用于记录并返回所有排列组合。  
        self.excute(nums,[],res)  
        return res  
          
    def excute(self,nums,path,res): #path用于存放经过的元素  
        if not nums:  
            res.append(path)  
        for i in xrange(len(nums)):  
            self.excute(nums[:i]+nums[i+1:],path+[nums[i]],res) #每经过一个元素，将其从nums中取出，放入path，当nums为空时，就完成一个排列组合。  
                    
```



```
    # 归并排序
    def merge(self, l1, l2):

        result = []
        i = 0
        j = 0
        while i < len(l1) and j < len(l2):
            if l1[i] <= l2[j]:
                result.append(l1[i])
                i += 1
            else:
                result.append(l2[j])
                j += 1
        #
        if i== len(l1):
            result += l2[j:]
        if j == len(l2):
            result += l1[i:]
        return result

    # 递归调用
    def merge_sort(self, l):

        if len(l) == 1:
            return l
        else:
            mid = len(l)/2
            left = l[:mid]
            right = l[mid:]
            l1 = self.merge_sort(left)
            l2 = self.merge_sort(right)

            return self.merge(l1, l2)

```

合并俩有序链表

```
class Solution(object):
    def mergeTwoLists(self, l1, l2):
        """
        :type l1: ListNode
        :type l2: ListNode
        :rtype: ListNode
        """
        # 递归
        if l1 is None:
            return l2
        if l2 is None:
            return l1
        
        p = None
        if l1.val < l2.val:
            p = l1
            p.next = self.mergeTwoLists(l1.next, l2)
        else:
            p = l2
            p.next = self.mergeTwoLists(l1, l2.next)
        return p
```

快速排序

```

    def quicksort(self, nums, left, right):
        """
        """
        n = len(nums)
        if left > right:
            return 

        tmp = nums[left]
        i = left
        j = right
        while i != j:
            # 先从右往左，找到小于tmp的
            while nums[j] >= tmp and i < j:
                j -= 1
            # 从左往右找到大于tmp的
            while nums[i] <= tmp and i < j:
                i += 1
            # 交换位置
            if i < j:
                t = nums[i]
                nums[i] = nums[j]
                nums[j] = t
            # 变换base
            nums[left] = nums[i]
            nums[i] = tmp

            self.quicksort(nums, left, i-1)
            self.quicksort(nums, i+1, right)
        return nums
```


寻找无序数组中第k大，按照快速排序方法，每次数组切分两堆，
左边小于基数，右边大于基数

```
 def find_k_max(self, nums, left, right, k):
        """
        """
        n = len(nums)
        if left > right:
            return 

        tmp = nums[left]
        i = left
        j = right
        while i != j:
            # 先从右往左，找到小于tmp的
            while nums[j] >= tmp and i < j:
                j -= 1
            # 从左往右找到大于tmp的
            while nums[i] <= tmp and i < j:
                i += 1
            # 交换位置
            if i < j:
                t = nums[i]
                nums[i] = nums[j]
                nums[j] = t
            # 变换base
            nums[left] = nums[i]
            nums[i] = tmp

            # 判断
            if n -i == k:
                return nums[i]
            else:
                if n - i > k:
                    out = self.find_k_max(nums, i+1, right, k)
                else:
                    out = self.find_k_max(nums, left, i-1, k-(n-i))
            
        return out
```


