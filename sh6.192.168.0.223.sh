#!/bin/bash
# cd /d S:\zero\box\aa201
# vagrant ssh
# su root
# yum install -y wget
# wget --version
# wget -O - http://192.168.0.231/file/ipssh/data/a/s/etc/ipsshxsc/hello.sh | sh
# wget -O - http://192.168.0.231/file/ipssh/data/a/s/etc/ipsshxsc/sh1.192.168.0.223.sh | sh
# 在使用前要先安装dos2unix 
# yum install -y dos2unix
# dos2unix -n windows win2unix
echo "HelloWorld.2"
sleep 1 && echo "sleep 1/2" 
sleep 1 && echo "sleep 2/2"
echo "--uname -m    x86_64 输出“x86_64”则是64位"
echo "uname -m" 
uname -m
#
if [ -f "/data/a/c/file/go/go1.20.7.linux-amd64.tar.gz" ];then
 echo "110,file exist yes,文件存在,/data/a/c/file/go/go1.20.7.linux-amd64.tar.gz"
else
 echo "115,file exist not,文件不存在,/data/a/c/file/go/go1.20.7.linux-amd64.tar.gz" 
fi
#
if [ -d "/data/a/c/file/go" ];then
 echo "120,path exist yes,目录存在,/data/a/c/file/go"
else
 echo "125,path exist not,目录不存在,/data/a/c/file/go"
fi

if  !  [ -d "/data/a/c/etc" ]; then
 echo "mkdir -p /data/a/c/file/go" 
 mkdir -p /data/a/c/file/go
 mkdir -p /data/a/c/code/go
 # 创建用户访问目录
 mkdir -p /data/a/c/
 mkdir -p /data/a/s/
 mkdir -p /data/a/syncxmin/
 mkdir -p /data/a/c/zbak/
 mkdir -p /data/a/c/etc/
 chmod a-w /data/
 chmod 777 /data/a/
 chmod 777 /data/a/c/
 chmod 777 /data/a/s/
 chmod 777 /data/a/syncxmin/
 chmod 777 "/etc/selinux/config"
 chmod 777 "/etc/sysconfig/network-scripts/ifcfg-eth0"
 chmod 777 "/etc/ssh/sshd_config"
fi

if  !  [ -f "/data/a/c/zbak/zbak.1.config.old" ];then
  # ls
  # cat /data/a/c/zbak/zbak.1.ifcfg-eth0.old
 cp /etc/selinux/config /data/a/c/zbak/zbak.1.config.old
 cp /etc/sysconfig/network-scripts/ifcfg-eth0 /data/a/c/zbak/zbak.1.ifcfg-eth0.old
 cp /etc/ssh/sshd_config /data/a/c/zbak/zbak.1.sshd_config.old
 # cd /data/a/c/zbak/
fi

if  !  [ -f "/data/a/c/file/go/go1.20.7.linux-amd64.tar.gz" ];then
 cd /data/a/c/file/go
 echo "wget http://192.168.0.231/file/go/go1.20.7.linux-amd64.tar.gz"
 wget http://192.168.0.231/file/go/go1.20.7.linux-amd64.tar.gz
fi

if [ -d "/usr/local/go" ];then
 echo "155,path exist yes,/usr/local/go"
else
 echo "156,path exist not,/usr/local/go"
  # 解压到系统目录下
 # sudo: /etc/sudoers is world writable
 # sudo: no valid sudoers sources found, quitting
 # sudo: unable to initialize policy plugin
 # 这个是linux为保证系统安全所做的限制，解决方法运行如下两条命令：
 echo "220,pkexec chmod 555 /etc/sudoers"
 pkexec chmod 555 /etc/sudoers
 echo "250,sudo tar -C /usr/local -xzf /data/a/c/file/go/go1.20.7.linux-amd64.tar.gz"
 sudo tar -C /usr/local -xzf /data/a/c/file/go/go1.20.7.linux-amd64.tar.gz
 cd /usr/local
 ls
fi

echo "HISTSIZE="
HISTSIZE=`sed '/^HISTSIZE=/!d;s/.*=//' /etc/profile`  
echo $HISTSIZE 

echo "GOROOT="
GOROOT=`sed '/^export GOROOT=/!d;s/.*=//' /etc/profile`  
echo $GOROOT 

echo "INSTALLGO="
INSTALLGO=`sed '/^INSTALLGO=/!d;s/.*=//' /etc/profile`  
echo $INSTALLGO 

# vi /etc/profile
# export GOROOT=/usr/local/go         // Go 的安装目录。也就是刚才解压缩指定的路径
# export GOPATH=/data/a/c/code/go   // 本机配置的 Go 代码目录
# export GOBIN=$GOROOT/bin           // Go 代码编译后的可执行文件存放目录
# export PATH=$PATH:$GOPATH:$GOBIN:$GOROOT/bin    // 将 Go 安装目录添加进操作系统 PATH 路径

if ! [[ $GOROOT == *go* ]]; then
echo "! GOROOT is go, # vi /etc/profile" 
echo "export GOROOT=/usr/local/go" >> /etc/profile
echo "export GOPATH=/data/a/c/code/go" >> /etc/profile
echo "export GOBIN=$GOROOT/bin" >> /etc/profile
echo "export PATH=/usr/local/go/bin:$PATH" >> /etc/profile
echo "INSTALLGO=1" >> /etc/profile
fi

if ! [[ $GOROOT == *go* ]]; then
  # 保存退出文件，并重启配置文件
 echo "source /etc/profile,保存退出文件，并重启配置文件"
 source /etc/profile
 echo "/usr/local/go/bin/go version # 安装好后，需要检查 Golang 是否安装成功："
 /usr/local/go/bin/go version
 echo "go version # 安装好后，需要检查 Golang 是否安装成功："
 go version
 cd /data/a/c/code/go
 wget http://192.168.0.231/file/ipssh/data/a/s/code/go/test123.go.txt
 # 将main1.c重命名为main.c：
 # [root@linux265 ~]# rename main1.c main.c main1.c
 rename test123.go.txt test123.go test123.go.txt
 echo "go run /data/a/c/code/go/test123.go"
 go run /data/a/c/code/go/test123.go
fi

echo "anon_root="
anon_root=`sed '/^anon_root=/!d;s/.*=//' /etc/vsftpd/vsftpd.conf`  
echo $anon_root 
if ! [[ $anon_root == */* ]]; then
 #ftp,yum install vsftpd -y,yum install ftp -y
 yum install vsftpd -y
 yum install ftp -y
 # systemctl restart vsftpd 重启vsftpd服务
 # 添加用户,设置密码
 useradd ftpuser
 echo 1|passwd --stdin ftpuser
 # useradd admin
 useradd admin -b /data
 echo 1|passwd --stdin admin
 # 修改匿名用户的属主和属组
 chmod -R admin:admin /data/a
 cat >/etc/vsftpd/vsftpd.conf <<EOF
anonymous_enable=YES
local_enable=YES
write_enable=YES
local_umask=022
dirmessage_enable=YES
xferlog_enable=YES
connect_from_port_20=YES
xferlog_std_format=YES
listen=NO
listen_ipv6=YES
pam_service_name=vsftpd
userlist_enable=YES
tcp_wrappers=YES
local_root=/data
# 共享目录的基目录是/data
chroot_local_user=YES
anon_root=/data/a
# 匿名用户访问的目录
EOF
echo "cat /etc/vsftpd/vsftpd.conf # 显示单个文件内容"
cat /etc/vsftpd/vsftpd.conf
 systemctl restart vsftpd
 # systemctl enable vsftpd 设置开机自启动 
 systemctl enable vsftpd
 # systemctl status vsftpd.service,最后看一下自己的vsftp开启状态：
 systemctl status vsftpd.service
 #  rename 's/example/new_example/' example
 # mv oldfile newfile
 # mv /data/a/c/ /data/c/all.bak
# /data/a/c/
# ping baidu.com
 # ftp localhost, admin,1,exit
# ftp://1@192.168.0.223:21/a/
# ftp://1@192.168.0.223:21 
# ftp://1@192.168.0.231:21 
fi
# exit 0

echo "systemctl stop firewalld" 
systemctl stop firewalld
echo "systemctl disable firewalld" 
systemctl disable firewalld
 # 通过命令"sestatus"来查看seLinux是否开启,暂时禁用 SELinux,Current mode模式从target改为permissive,命令：sudo setenforce 0
 # sudo setenforce 0
 # sestatus
 #永久禁用SELinux,sudo vi /etc/sysconfig/selinux,将SELINUX=enforcing指令更改为SELINUX=disabled,命令重启系统时生效,sudo shutdown -r now
 sudo setenforce 0
 sestatus

rm -rf /data/a/c/etc/config
cp /etc/selinux/config /data/a/c/etc/config
# cd /data/a/c/etc/
# cd /etc/selinux/
# cat /etc/selinux/config

rm -rf /data/a/c/etc/ifcfg-eth0
cp /etc/sysconfig/network-scripts/ifcfg-eth0 /data/a/c/etc/ifcfg-eth0

rm -rf /data/a/c/etc/sshd_config
cp /etc/ssh/sshd_config /data/a/c/etc/sshd_config

# 假设要将文件file.txt中所有的字符串"old"替换成"new"，可以使用以下命令：
echo "sed /data/a/c/etc/config" 
#sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /data/a/c/etc/config
sed -i 's/enforcing/disabled/g' /data/a/c/etc/config
cat /data/a/c/etc/config
# sed -i 's/disabled/enforcing/g' /data/a/c/etc/config
# cat /data/a/c/etc/config

# 假设要将文件file.txt中所有的字符串"old"替换成"new"，可以使用以下命令：
echo "sed /data/a/c/etc/sshd_config" 
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /data/a/c/etc/sshd_config

# Name=test
# name=`sed '/^Name=/!d;s/.*=//' net.config`  
# echo $name 
echo "BOOTPROTO="
BOOTPROTO=`sed '/^BOOTPROTO=/!d;s/.*=//' /data/a/c/etc/ifcfg-eth0`  
echo $BOOTPROTO 
# 假设要将文件file.txt中所有的字符串"old"替换成"new"，可以使用以下命令：
echo "sed /data/a/c/etc/ifcfg-eth0" 
sed -i 's/BOOTPROTO="dhcp"/BOOTPROTO="static"/g' /data/a/c/etc/ifcfg-eth0
#
if [[ $BOOTPROTO == *dhcp* ]]; then
echo "ok BOOTPROTO is dhcp" 
echo "IPADDR=192.168.0.223" >> /data/a/c/etc/ifcfg-eth0
echo "NETMASK=255.255.255.0" >> /data/a/c/etc/ifcfg-eth0
echo "GATEWAY=192.168.0.1" >> /data/a/c/etc/ifcfg-eth0
echo "DNS1=192.168.0.1" >> /data/a/c/etc/ifcfg-eth0
fi
#
# 在Linux上，使用`chmod`命令可以授予或剥夺文件的权限。如果脚本没有执行权限，可以使用以下命令添加
echo "chmod +x /data/a/c/hello.sh" 
chmod +x /data/a/c/hello.sh
# 显示文件全文
echo "cat /data/a/c/hello.sh" 
cat /data/a/c/hello.sh
#
echo "cat /data/a/c/etc/ifcfg-eth0" 
cat /data/a/c/etc/ifcfg-eth0
#
echo "cat /data/a/c/etc/sshd_config" 
cat /data/a/c/etc/sshd_config
#

if  [ -f "/data/a/c/zbak/zbak.1.config.old" ];then
 echo "\cp -rf /data/a/c/etc/config /etc/selinux/config" 
 \cp -rf /data/a/c/etc/config /etc/selinux/config
 cat /etc/selinux/config
fi

if  [ -f "/data/a/c/zbak/zbak.1.ifcfg-eth0.old" ];then
 echo "\cp -rf /data/a/c/etc/ifcfg-eth0 /etc/sysconfig/network-scripts/ifcfg-eth0" 
 \cp -rf /data/a/c/etc/ifcfg-eth0 /etc/sysconfig/network-scripts/ifcfg-eth0
fi

if  [ -f "/data/a/c/zbak/zbak.1.sshd_config.old" ];then
 echo "\cp -rf /data/a/c/etc/sshd_config /etc/ssh/sshd_config" 
 \cp -rf /data/a/c/etc/sshd_config /etc/ssh/sshd_config
fi

# 修改成功之后需要重新启动ssh服务才生效,重启命令如下
echo "service sshd restart"
service sshd restart

# 重启网络服务之前,显示IP 地址,ip addr show eth0
echo "ip addr show eth0"
ip addr show eth0

echo "cat /etc/selinux/config"
cat /etc/selinux/config

# 重启网络服务,可以使用以下命令重启：
echo "systemctl restart network #重启网络服务"
systemctl restart network

# 重启网络服务之后,检查 IP 地址是否已经生效，可以使用以下命令检查：
echo "ip addr show eth0"
ip addr show eth0

sleep 1 && echo "sleep 1/3"
sleep 1 && echo "sleep 2/3"
sleep 1 && echo "sleep 3/3"

# vagrant up
# vagrant ssh
# ping baidu.com
# su root
# --安装--wget工具体积小但功能完善，它支持断点下载功能，同时支持FTP和HTTP下载方式，支持代理服务器和设置起来方便简单。
# --输入以下命令,wget --version,检查wget是否安装成功：
# yum install -y wget
# wget --version
# wget -O - http://192.168.0.231/file/ipssh/data/a/s/etc/ipsshxsc/hello.sh | sh
# wget -O - http://192.168.0.231/file/ipssh/data/a/s/etc/ipsshxsc/sh1.192.168.0.223.sh | sh
# systemctl restart network
# systemctl stop firewalld.service       关闭防火墙
# systemctl disable firewalld.service   禁止防火墙开机启动
# 可以通过命令"sestatus"来查看seLinux是否开启,暂时禁用 SELinux,将SELinux 模式从target改为permissive,请在终端中输入以下命令：sudo setenforce 0
# sudo setenforce 0
# 永久禁用 selinux
# 在关闭selinux之前，可以通过命令"sestatus"来查看seLinux是否开启
# sestatus
# 需要修改/etc/selinux/config 文件，将SELINUX=enforcing改为SELINUX=disabled 
# 保存并重启，之后看到的selinux就被关闭了。
# 修改ip参数
# cd /data/c/all
# bash hello.sh
# bash ipssh.sh
# sh hello.sh
# sh ipssh.sh
# sed '$a xxx' a.txt
# r  No such file or directory
# /data/a/c/code/go
# ping baidu.com
 #  rename 's/example/new_example/' example
 # mv oldfile newfile
 # mv /data/a/c/ /data/c/all.bak
# /data/a/c/
# ping baidu.com
# 本机测试,安装ftp客户端,ftp localhost command not found,yum install ftp -y
# yum install ftp -y
# ftp localhost command not found
# ftp localhost>admin>1>mkdir cy> exit
# ftp://1@192.168.0.223:21/a/
# ftp://1@192.168.0.223:21 
# ftp://1@192.168.0.231:21 
# 重启vsftpd服务并设置开机自启动
# systemctl restart vsftpd
# systemctl enable vsftpd
# 最后看一下自己的vsftp开启状态：
# systemctl status vsftpd.service
# 客户端
#[ root@localhost ~]# yum install -y lftp
#[ root@localhost ~]# lftp testuser1@127.0.0.1
#[ root@localhost ~]# lftp admin@127.0.0.1
# Password: 
# lftp testuser1@127.0.0.1:~> 

