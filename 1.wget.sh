wget -O - http://192.168.0.124//file/sship/data/all/hello/hello.sh | sh
systemctl stop firewalld
systemctl disable firewalld



�������Ǳ�д�õ�shell�ű����ļ���Ϊhello.sh���ļ�λ����/data/shellĿ¼�в�����ִ��Ȩ�ޡ�

����һ���л���shell�ű����ڵ�Ŀ¼(��ʱ����Ϊ����Ŀ¼)ִ��shell�ű���cd /data/shell

./hello.sh

./����˼��˵�ڵ�ǰ�Ĺ���Ŀ¼��ִ��hello.sh�����������./��bash���ܻ���Ӧ�ҵ�����hello.sh�Ĵ�����Ϣ����ΪĿǰ�Ĺ���Ŀ¼(/data/shell)���ܲ���ִ�г���Ĭ�ϵ�����·��֮��,Ҳ����˵�����ڻ�������PASH������֮�С��鿴PATH�����ݿ��� echo $PASH ������ڵ�/data/shell�Ͳ��ڻ�������PASH�еģ����Ա������./�ſ�ִ�С�

���������Ծ���·���ķ�ʽȥִ��bash shell�ű���

/data/shell/hello.sh

��������ֱ��ʹ��bash ��sh ��ִ��bash shell�ű���

cd /data/shell

bash hello.sh

��

cd /data/shell

sh hello.sh