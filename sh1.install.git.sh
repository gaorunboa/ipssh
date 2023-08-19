#!/bin/bash
# sh1.install.git.sh
# vagrant ssh
# ping baidu.com
# ping 192.168.0.231
# su root，也可以执行 sudo -i 直接切换到 root 用户。root 用户没有默认密码，可能不能直接登录。
# 卸载wget 命令 yum remove wget
# yum install -y wget
# sudo yum install -y wget
# wget --version
# wget -O - http://192.168.0.231/hello.sh | sh
# wget -O - --ftp-user=admin --ftp-password=1 ftp://192.168.0.231/a/hello.sh | sh

# wget -O - http://192.168.0.231/acs/a/s/gituser/ipssh/hello.sh | sh
# wget -O - http://192.168.0.231/acs/a/s/gituser/ipssh/sh1.install.git.sh | sh

# wget -O - --ftp-user=admin --ftp-password=1 ftp://192.168.0.231/a/mnt/s/a/ai/ais/i/home/going/workspace/am/website/aw/iisxa/acs/a/s/gituser/ipssh/hello.sh | sh

# wget -O - --ftp-user=admin --ftp-password=1 ftp://192.168.0.231/a/mnt/s/a/ai/ais/i/home/going/workspace/am/website/aw/iisxa/acs/a/s/gituser/ipssh/sh1.install.git.sh | sh

echo "HelloWorld.sh1.install.git.sh"
sleep 1 && echo "sleep 1/2" 
sleep 1 && echo "sleep 2/2"
echo "--uname -m    x86_64 输出“x86_64”则是64位"
echo "uname -m" 
uname -m

# 第一步，安装依赖。虽然有些 CentOS 8.2 系统已经默认安装这些依赖了，但是为了确保它们都能被安装，我仍然会尝试安装一遍。
# 如果系统提示 Package xxx is already installed.，说明已经安装好了，你直接忽略即可。
sudo yum -y install make autoconf automake cmake perl-CPAN libcurl-devel libtool gcc gcc-c++ glibc-headers zlib-devel git-lfs telnet ctags lrzsz jq

# 第二步，安装 Git。
if  !  [ -f "/tmp/git-2.30.2.tar.gz" ];then
 cd /tmp
 wget https://mirrors.edge.kernel.org/pub/software/scm/git/git-2.30.2.tar.gz
 tar -xvzf git-2.30.2.tar.gz
 cd git-2.30.2/
 ./configure
 make
 sudo make install
fi

git --version          # 输出 git 版本号，说明安装成功

# 注意啦，按照上面的步骤安装好之后，我们要把 Git 的二进制目录添加到 PATH 路径中，不然 Git 可能会因为找不到一些命令而报错。
# 你可以通过执行以下命令添加目录：
tee -a $HOME/.bashrc <<'EOF'
# Configure for git
export PATH=/usr/local/libexec/git-core:$PATH
EOF

# 第三步，配置 Git。我们直接执行如下命令配置 Git：
git config --global user.name "gaorunbo"                      # 用户名改成自己的
git config --global user.email "1975880301@qq.com"   # 邮箱改成自己的
git config --global credential.helper store                       # 设置 Git，保存用户名和密码
git config --global core.longpaths true                           # 解决 Git 中 'Filename too long' 的错误

# 除了按照上述步骤配置 Git 之外，我们还有几点需要注意。
# 首先，在 Git 中，我们会把非 ASCII 字符叫做 Unusual 字符。
# 这类字符在 Git 输出到终端的时候默认是用 8 进制转义字符输出的（以防乱码），
# 但现在的终端多数都支持直接显示非 ASCII 字符，所以我们可以关闭掉这个特性，具体的命令如下：
git config --global core.quotepath off

# 其次，如果你觉得访问 github.com 太慢，可以通过国内 GitHub 镜像网站来访问，配置方法如下：
# 这里你要注意，通过镜像网站访问仅对 HTTPS 协议生效，对 SSH 协议不生效，并且 github.com.cnpmjs.org 的同步时间间隔为 1 天。
# git config --global url."https://github.com.cnpmjs.org/".insteadOf "https://github.com/"

# 最后，GitHub 限制最大只能克隆 100M 的仓库，为了能够克隆容量大于 100M 的仓库，我们还需要安装 Git Large File Storage，安装方式如下：
git lfs install --skip-repo

#好啦，现在我们就完成了依赖的安装和配置。
# end
