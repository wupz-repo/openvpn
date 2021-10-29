## OPENVPN 使用说明
### 一、服务端部署
#### 1、Docker安装
1.1 卸载历史版本
```shell
yum remove docker \
docker-client \
docker-client-latest \
docker-common \
docker-latest \
docker-latest-logrotate \
docker-logrotate \
docker-engine
```
1.2  添加Yum仓库

```shell
curl -L https://download.docker.com/linux/centos/docker-ce.repo -o /etc/yum.repos.d/docker-ce.repo 
```
1.3  安装Docker-ce

```shell
yum install docker-ce docker-ce-cli containerd.io
```

#### 2、Docker-Compose安装
2.1 下载Docker-Compose
```shell
curl -L https://github.com/docker/compose/releases/download/1.29.2/docker-compose-Linux-x86_64 -o /usr/local/bin/docker-compose
```
2.2 赋予执行权限

```shell
chmod +x /usr/local/bin/docker-compose
```
#### 3、Docker服务配置及启动

```shell
mkdir /etc/docker && touch /etc/docker/daemon.json
cat > /etc/docker/daemon.json << EOF
{
  "log-level": "warn",
  "log-driver": "json-file",
  "log-opts": {
     "max-size": "500m",
     "max-file": "3"
   },
   "data-root":"/opt/docker"
}
EOF
systemctl enable docker 
systemctl start docker
```

#### 4、部署OpenVPN项目
```shell
apps#> cd /opt/apps && git clone git@gitee.com:wupz/openvpn.git
openvpn#> bash initialize.sh
openvpn#> docker-compose up -d 
```
#### 5、维护OpenVPN
##### 5.1 添加用户
```shell
openvpn># bash op_client_create.sh
```
##### 5.2 删除用户
```shell
openvpn># bash op_client_destroy.sh
```

### 二、客户端下载
#### 1、Windows下载

https://openvpn.net/downloads/openvpn-connect-v3-windows.msi

#### 2、MacOs下载

https://openvpn.net/downloads/openvpn-connect-v3-macos.dmg

#### 3、Linux下载

https://community.openvpn.net/openvpn/wiki/OpenVPN3Linux

#### 4、Android下载

https://play.google.com/store/apps/details?id=net.openvpn.openvpn

#### 5、IOS下载

https://apps.apple.com/us/app/openvpn-connect/id590379981

### 三、常见问题
#### 1.如何连接到 OpenVPN？

为了连接到 VPN 服务器或服务，您需要获取一个包含连接所需细节的文件。这样的配置文件称为配置文件，文件扩展名为 .ovpn。

如果您的企业正在使用 Access Server 或 OpenVPN Cloud，并且您的 IT 部门为您提供了 URL，则您可以通过输入 URL 直接导入配置文件。

![](https://openvpn.net/wp-content/themes/openvpn/assets/images/client-import-url@2x.jpg)

但是，如果您已从 IT 部门或其他 OpenVPN 兼容服务处以文件形式收到配置文件，则可以通过选择文件来导入配置文件。

![](https://openvpn.net/wp-content/themes/openvpn/assets/images/client-import-file@2x.jpg)
