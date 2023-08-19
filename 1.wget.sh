wget -O - http://192.168.0.124//file/sship/data/all/hello/hello.sh | sh
systemctl stop firewalld
systemctl disable firewalld



假设我们编写好的shell脚本的文件名为hello.sh，文件位置在/data/shell目录中并已有执行权限。

方法一：切换到shell脚本所在的目录(此时，称为工作目录)执行shell脚本：cd /data/shell

./hello.sh

./的意思是说在当前的工作目录下执行hello.sh。如果不加上./，bash可能会响应找到不到hello.sh的错误信息。因为目前的工作目录(/data/shell)可能不在执行程序默认的搜索路径之列,也就是说，不在环境变量PASH的内容之中。查看PATH的内容可用 echo $PASH 命令。现在的/data/shell就不在环境变量PASH中的，所以必须加上./才可执行。

方法二：以绝对路径的方式去执行bash shell脚本：

/data/shell/hello.sh

方法三：直接使用bash 或sh 来执行bash shell脚本：

cd /data/shell

bash hello.sh

或

cd /data/shell

sh hello.sh