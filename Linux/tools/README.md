# 常用工具

[Linux工具链接](https://linuxtools-rst.readthedocs.io/zh_CN/latest/tool/index.html)

## 检测远程端口是否打开

1. `telnet 110.101.101.101 80`方式测试远程主机端口是否打开

1. `nmap ip -p port` 测试端口
nmap ip 显示全部打开的端口
根据显示close/open确定端口是否打开

1. `nc -v host port`
端口未打开返回状态为非0

