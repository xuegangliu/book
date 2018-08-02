## Docker

### 基本命令
- 容器生命周期管理   
    `docker [run|start|stop|restart|kill|rm|pause|unpause]`
- 容器操作运维   
    `docker [ps|inspect|top|attach|events|logs|wait|export|port]`
- 容器rootfs命令   
    `docker [commit|cp|diff]`
- 镜像仓库   
    `docker [login|pull|push|search]`
- 本地镜像管理   
    `docker [images|rmi|tag|build|history|save|import]`
- 其他命令  
    `docker [info|version]`
    
![逻辑图](img/docker.png)


- service docker start 
- systemctl start docker
- systemctl enable docker

## Docker 中国官方镜像加速可通过 registry.docker-cn.com 
`docker --registry-mirror=https://registry.docker-cn.com daemon`
- 为了永久性保留更改，您可以修改 /etc/docker/daemon.json 文件并添加上 registry-mirrors 键值。

```
{
  "registry-mirrors": ["https://registry.docker-cn.com"]
}
docker --registry-mirror=https://registry.docker-cn.com daemon

docker run --name some-mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mysql:tag
```

## mysql
- ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY '你的密码';
 FLUSH PRIVILEGES;

## mongo
- docker pull  mongo 
- docker run  --name some-mongo   -p 27017:27017   -d mongo   --auth     //这里的--name 放在前面并映射端口
- docker    exec  -it  容器ID   /bin/bash     //进入容器
- mongo  
- use admin
- db.createUser({user:"root",pwd:"root",roles:[{role:'root',db:'admin'}]})   //创建用户,此用户创建成功,则后续操作都需要用户认证
- exit  

## ftp

```
docker pull docker.io/fauria/vsftpd
docker run -d -v /home/vsftpd:/home/vsftpd -p 20:20 -p 21:21 -p 21100-21110:21100-21110 -e FTP_USER=test -e FTP_PASS=test --name vsftpd fauria/vsftpd
```
- 会以登录用户名 (test) 创建一个目录 (/home/vsftpd/test) 作为 ftp 根目录
- 测试时发现不加 -p 20:20 依然可以正常操作

## sftp
- 使用命令sudo docker pull luzifer/sftp-share
- 构建docker run -d -p 2022:22 -e USER=myuser -e PASS=myverysecretpassword luzifer/sftp-share

### 资料链接
[docker](https://blog.csdn.net/permike/article/details/51879578)
 
