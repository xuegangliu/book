## 命令帮助
>> 命令的简要说明 whatis command | info command | man command
>> 命令路径 which command

## 显示历史命令
使用 HISTTIMEFORMAT 显示时间戳
```
# export HISTTIMEFORMAT='%F %T '
# history | more
1 2018-05-02 19:02:39 service network restart
2 2018-05-02 19:02:39 exit
3 2018-05-02 19:02:39 id
4 2018-05-02 19:02:39 cat /etc/redhat-release
```



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