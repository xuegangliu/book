# python3基础认识 

```练习代码->``` [code](https://github.com/xuegangliu/python)

* 规定 缩进规定、多行语句(+\)
* 指定源码编码
`# -*- coding: utf-8 -*-` `#coding=utf8  `

## 注释
```
    # 方法1
    
    '''
    注释方法2
    '''
    
    """
    注释方法3
    """
```

# 标准数据类型
- Number 数字(int、bool、float、complex) ,不可变 
- String 字符串, 不可变, 序列
    - '''aa''' """bbb"""  \转义字符 r不转义 索引从0开始，从-1倒序
- List 列表, `[]` ,序列, 有序
- Tuple 元组 ,不可变 ,`()`, 序列
- Set 集合 `{xx}` 或者 `set()`
- Dictionary 字典, 无序, `{key:value}`

## 类型判断注意
- tpye() 不会认为子类是一种父类类型
- isinstance()会认为子类是一种父类类型
* is 用于判断两个变量引用对象是否为同一个， == 用于判断引用变量的值是否相等。

# 模块
- 模块导入 `import` 与 `from xx import a,b,c`

# 面向对象
- 类属性与方法
  - __private_attrs：两个下划线开头，声明该属性为私有
  - 类的方法 第一个参数必须为self
  - __private_method：两个下划线开头，私有方法
- 类的专有方法：
  - __init__ : 构造函数，在生成对象时调用
  - __del__ : 析构函数，释放对象时使用
  - __repr__ : 打印，转换
  - __setitem__ : 按照索引赋值
  - __getitem__: 按照索引获取值
  - __len__: 获得长度
  - __cmp__: 比较运算
  - __call__: 函数调用
  - __add__: 加运算
  - __sub__: 减运算
  - __mul__: 乘运算
  - __div__: 除运算
  - __mod__: 求余运算
  - __pow__: 乘方

# 错误异常
```
 try:
    
    break
 except ValueError:
    //
```