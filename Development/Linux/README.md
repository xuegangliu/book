## 命令帮助
>> 命令的简要说明 whatis command | info command | man command
>> 命令路径 which command

## 目录
```
创建：mkdir
删除：rm
删除非空目录：rm -rf file目录
删除日志 rm *log (等价: $find ./ -name "*log" -exec rm {} \;)
移动：mv
复制：cp (复制目录：cp -r )
查看当前目录下文件个数:$find ./ | wc -l
复制目录:$cp -r source_dir  dest_dir
目录切换
找到文件/目录位置：cd
切换到上一个工作目录： cd -
切换到home目录： cd or cd ~
显示当前路径: pwd
更改当前工作路径为path: $cd path
列出目录项
显示当前目录下的文件 ls
按时间排序，以列表的方式显示目录项 ls -lrt
查找目录及文件 find/locate
搜寻文件或目录::
$find ./ -name "core*" | xargs file
查找目标文件夹中是否有obj文件::
$find ./ -name '*.o'
递归当前目录及子目录删除所有.o文件::
$find ./ -name "*.o" -exec rm {} \;
find是实时查找，如果需要更快的查询，可试试locate；locate会为文件系统建立索引数据库，如果有文件更新，需要定期执行更新命令来更新索引库::
$locate string
寻找包含有string的路径::
$updatedb
与find不同，locate并不是实时查找。你需要更新数据库，以获得最新的文件索引信息。
查看文件内容
查看文件：cat vi head tail more

文件与目录权限修改
改变文件的拥有者 chown
改变文件读、写、执行等属性 chmod
递归子目录修改： chown -R tuxapp source/
增加脚本可执行权限： chmod a+x myscript

给文件增加别名
创建符号链接/硬链接::
ln cc ccAgain :硬连接；删除一个，将仍能找到；
ln -s cc ccTo :符号链接(软链接)；删除源，另一个无法使用；（后面一个ccTo 为新建的文件）

管道和重定向
批处理命令连接执行，使用 |
串联: 使用分号 ;
前面成功，则执行后面一条，否则，不执行:&&
前面失败，则后一条执行: ||

综合应用
查找record.log中包含AAA，但不包含BBB的记录的总数::
cat -v record.log | grep AAA | grep -v BBB | wc -l
```

---------
## 程序构建
### 1.配置 -> 2.编译 -> 3.安装
1. 配置做的工作主要是检查当前环境是否满足要安装软件的依赖关系，以及设置程序安装所需要的初始化信息，比如安装路径，需要安装哪些组件；配置完成，会生成makefile文件供第二步make使用；
2. 编译是对源文件进行编译链接生成可执行程序；
3. 安装做的工作就简单多了，就是将生成的可执行文件拷贝到配置时设置的初始路径下；

```
    ./configure --help
    ./configure --prefix=/usr/local/snmp
    make -f myMakefile
    make install
```

---------
## 程序调试
### gdb 程序交互调试
## 性能优化
### 系统
```
    top
    free
    vmstat
```
进入交互模式后:
输入M，进程列表按内存使用大小降序排序，便于我们观察最大内存使用者使用有问题（检测内存泄漏问题）;
输入P，进程列表按CPU使用大小降序排序，便于我们观察最耗CPU资源的使用者是否有问题；
top第三行显示当前系统的，其中有两个值很关键:
%id：空闲CPU时间百分比，如果这个值过低，表明系统CPU存在瓶颈；
%wa：等待I/O的CPU时间百分比，如果这个值过高，表明IO存在瓶颈；

### 程序
如果IO存在性能瓶颈，top工具中的%wa会偏高；
进一步分析使用iostat工具
如果%iowait的值过高，表示硬盘存在I/O瓶颈。
如果 %util 接近 100%，说明产生的I/O请求太多，I/O系统已经满负荷，该磁盘可能存在瓶颈。
如果 svctm 比较接近 await，说明 I/O 几乎没有等待时间；
如果 await 远大于 svctm，说明I/O 队列太长，io响应太慢，则需要进行必要优化。
如果avgqu-sz比较大，也表示有大量io在等待。

### 分析进程调用
- pstack用来跟踪进程栈
    > pstack [pid]
- strace用来跟踪进程中的系统调用

-------
## 常用工具

### gdb 调试利器

### ldd 查看程序依赖库

### lsof 一切皆文件

### ps 进程查看器

### pstack 跟踪进程栈

### strace 跟踪进程中的系统调用

### ipcs 查询进程间通信状态

### top linux下的任务管理器

### free 查询可用内存

### vmstat 监视内存使用情况

### iostat 监视I/O子系统

### sar 找出系统瓶颈的利器

### readelf elf文件格式分析

### objdump 二进制文件分析

### nm 目标文件格式分析

### size 查看程序内存映像大小

### wget 文件下载

### scp 跨机远程拷贝

### crontab 定时任务
