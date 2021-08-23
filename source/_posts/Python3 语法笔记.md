---
title: 'Python3 语法笔记'
date: 2020-12-05 11:19:27
tags: [编程,Python]
published: true
hideInList: false
feature: 
isTop: false
---
# 运算
基本算法都支持，即加减乘除，括号。
除法结果一定为浮点数类型。
## 整数除
5 // 3  => 1
结果为向下取整，取更小整数。
-5 // 3  => -2

## 模除
7 ％ ３  ＝> １

## 次方
2 ** 4  => 16

----

# 保留字
|and|as|assert|break|class|continue|def|
|----|----|----|----|----|----|----|
|if|elif|else|except|finally|for|from|
|import|in|is|lambda|not|or|pass|
|raise|return|try|while|with|yield|del|
|global|nonlocal|True|False|None| | |

## True False 布尔值（注意大小写）
True
False

None，0，空字符串，空列表，空字典都算是False
所有其他值都是True

## not 取非
`not` True  => False
`not` False  => True

## and or 逻辑运算
True `and` False  =>False
False `or` True  => True

## 逻辑判断
### 双等号 == 判断相等
1 == 1  =>True
1 == 2  =>False

### != 判断不等
1 != 1  =>False
1 != 2  =>True

### 比较大小
1 < 10   => True
1 > 10   => False
2 <= 2   => True    小于等于
2 >= 2   => True    大于等于
1 < 2 < 3  => True
2 < 3 < 2  => False

## None 对象
`None`是个对象，与它比较使用`is`
"etc" is None  => False
None is None  => True

## is 比较指向
is是用来比较两个变量是否指向同一个对象。

## print 打印输出
print()

## del 删除
del 列表[元素序号]
del 字典[键]

## in 判断包含
元素 in 列表
元素 in 元组
键 in 字典
元素 in 集合
=> Ture/False

## if elif else 条件
不要忘记条件判断语句后面的冒号 `:`
```PYTHON
if 条件1:
    执行语句
elif 条件2:
    执行语句
elif 条件x:
    执行语句
else 最后条件:
    执行语句
```

## 循环
### for 循环
```PYTHON
for 条件:
    执行语句
```
### while 循环
```PYTHON
while 条件:
    执行语句
```

## 异常
### 异常处理
```PYTHON
try:
    需要判断运行的执行代码
except KeyError:    #指定错误类型
    出现异常时执行的代码
excep (KeyError,TypeError):    #可指定多种错误
    pass    # 无操作
except KeyError as err:    #储存错误信息到 err
    print(err)
else:
    没有出现异常执行的代码
finally:
    不管有无异常都执行的代码 
```
### raise 触发异常
raise 错误名(错误信息)
```PYTHON
raise NameError('error')
```
=>NameError:error

## yield 迭代生成
yield会暂停并保存当前所有运行信息，返回yield的值
```PYTHON
def fibonacci(n): # 生成器函数 - 斐波那契
    a, b, counter = 0, 1, 0
    while True:
        if (counter > n): 
            return
        yield a #返回a的值
        a, b = b, a + b
        counter += 1
f = fibonacci(10) # f 是一个迭代器，由生成器返回生成，a的值存于f并迭代
```

## def 定义函数
```PYTHON
def 函数名(参数):  #参数带有一个*为元组类型导入，**为字典类型导入
    函数语句
    return #返回值
```
### 调用
函数名(参数)

## lambda 匿名函数
函数名 = lambda 参数:执行语句
```PYTHON
sum = lambda arg1, arg2: arg1 + arg2
print ("相加后的值为 : ", sum( 10, 20 ))
print ("相加后的值为 : ", sum( 20, 20 ))
```
=> 相加后的值为 :  30
=> 相加后的值为 :  40
----

# 数据类型
## 字符串
### 形式
单双引号都可
"这是个字符串"
'这也是个字符串'
### 链接
"Hello" + "world!"   => "Helloworld!"
### 作为列表
"This is a string"[0]  => 'T'
### 格式化
"{} can be {}".format("strings", "interpolated")  
=> strings can be interpolated

"{0} be nimble, {0} be quick, {0} jump over the {1}".format("Jack", "candle stick")  
=> "Jack be nimble, Jack be quick, Jack jump over the candle stick"

"{name} wants to eat {food}".format(name="Bob", food="lasagna")   
=> "Bob wants to eat lasagna"

兼容Python2的格式化
"%s can be %s the %s way" % ("strings", "interpolated", "old")
=> "strings can be interpolated the old way"

## 列表
列表名 = [值]
li = [v1,v2,v3]
### .append 在列表最后添加元素
列表名.append(值)
li.append(v4)
=> li = [v1,v2,v3,v4]

### .pop 去除列表最后的元素
列表名.pop()
li.pop()
=> li = [v1,v2,v3]

### 切割
列表名[开始序号:终止序号:步伐]
步伐，即脚步跨度，间隔多少取一次。
开始序号、终止序号、步伐都可省略，默认值分别为0,-1,1，即默认从头开始，到尾结束，步伐为1。

### 相加列表，保留重复
otherli = [s1,s2,s3]
li + otherli
=> [v1,v2,v3,s1,s2,s3]

li + [q1,q2,q3]
=> [v1,v2,v3,s1,s2,s3,q1,q2,q3]

### .extend 拼接列表，保留重复
li = [v1,v2,v3]
otherli = [s1,s2,s3]
li.extend(otherli)
=>[v1,v2,v3,s1,s2,s3]

## 元组
元组名 = (值)
列表所允许的操作元组大都可以。

### 元组赋值变量
A,B,C = (Q,W,E) 
=>A=Q;B=W;C=E
括号可以省略
E,F,G = Z,X,C
=>E=Z;F=X;G=C
#### 交换变量
O = 1
P = 2
O,P = P,O
=>O=2;P=1

## 字典
### 赋值
字典名 = {键:值}
dict = {'1':A,'2':B}
### .update 赋值
dict.update({'3':C})
=>{'1':A,'2':B,'3':C}

### 使用键取值
dict['1']
=>A

### .keys 取出字典所有的键
list(dict.keys())
=>['1','2','3']

### .values 取出字典所有的值
list(dict.values())
=>[A,B,C]

###KeyError 错误
访问不存在的值出现该错误
dict['4']
=>KeyError

#### 避免KeyError错误
使用`.get`避免
dict.get('d')
=>None

### 默认值
#### 访问错误的键时，返回默认值
字典名.get(键,默认值)
dict.get('4',404)
=>404

#### 设置键的默认值
字典名.setdefault(键,默认值)

个人理解为类似 .upadte ，不过 .update 是直接覆盖， .setdefault 如果键有值则保留不变，没有则添加。

## 集合
集合名 = set()

### 赋值 与字典类似
aset = {1,1,2,2,3}   **会合并重复项**
=>{1,2,3}

### 添加元素
aset.add(4)
=>{1,2,3,4}

### 交集
bset = {3,4,5,6}
aset & bset 
=>{3,4}

### 并集
aset | bset 
=>{1,2,3,4,5,6}

### 补集
{1,2,3,4} - {2,3,5}
=>{1,4}
aset - bset
=>{1,2}


# 序号
## 排序
正向排序从 0 开始，逆向排序从 -1 开始。
|-6|-5|-4|-3|-2|-1|
|----|----|----|----|----|----|
|这|是|个|例|子|。|
|0|1|2|3|4|5|

#迭代
从第一个元素开始，只能向前，不能使用序号访问
##创建
iter()
next()
## 错误
StopIteration  迭代完成
## 取用
遍历，list，.__next__()
# 其余
## bool()  判断布尔值
bool(0)
=>False

## range(起始值,最后值后一位)  
从0到输入值（不包括输入值），起始值可省略，默认为0
range(3)
=>0,1,2

