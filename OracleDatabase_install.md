## 硬件要求
      RAM >2GB
      Swap > 1.5XRAM

## 软件版本
      Fedora22 4.0.4-301.fc22.x86_64
      linux.x64_11gR2_database

## 步骤
- 安装依赖
      dnf install binutils compat-libstdc++-33 compat-libstdc++-33.i686 elfutils-libelf elfutils-libelf-devel gcc gcc-c++ glibc glibc.i686 glibc-common glibc-devel glibc-devel.i686 glibc-headers ksh libaio libaio.i686 libaio-devel libaio-devel.i686 libgcc libgcc.i686 libstdc++ libstdc++.i686 libstdc++-devel libXi libXtst make sysstat unixODBC unixODBC-devel

- 设置swap
      dd if=/dev/zero of=/home/swapfile bs=1M count=2048
      mkswap /home/swapfile
      swapon /home/swapfile   #提示644权限不安全600
      vi /etc/fstab     加入/home/swapfile swap swap defaults 0 0 以便引导时启用交换文件

- 创建用户
      groupadd oinstall
      groupadd dba
      useradd -g oinstall -G dba oracle
      passwd oracle

- 修改内核参数
      vi /etc/sysctl.conf

      fs.aio-max-nr = 1048576
      fs.file-max = 6815744
      kernel.shmall = 2097152
      kernel.shmmax = 536870912
      kernel.shmmni = 4096
      kernel.sem = 250 32000 100 128
      net.ipv4.ip_local_port_range = 9000 65500
      net.core.rmem_default = 262144
      net.core.rmem_max = 4194304
      net.core.wmem_default = 262144
      net.core.wmem_max = 1048586

      sysctl -p #使修改生效
- 修改用户资源限制
      vi /etc/security/limits.conf

      oracle              soft    nproc  2047
      oracle              hard    nproc  16384
      oracle              soft    nofile  1024
      oracle              hard    nofile  65536
      oracle              soft    stack   10240

- 创建安装目录
      mkdir -p /usr/local/oracle /usr/local/oraInventory /usr/local/oradata/
      chown -R oracle:oinstall /usr/local/oracle /usr/local/oraInventory /usr/local/oradata/
      chmod -R 775 /usr/local/oracle /usr/local/oraInventory /usr/local/oradata/

- 创建oraInst.loc
      vi /etc/oraInst.loc
      #文件内加入以下内容
      inventory_loc=/usr/local/oraInventory
      inst_group=oinstall
      :wq
      chown oracle:oinstall /etc/oraInst.loc
      chmod 664 /etc/oraInst.loc

- 准备oracle安装应答模板文件db_install.rsp文件
      cp /home/database/response/* /usr/local/oracle/
      chown  oracle:oinstall /usr/local/oracle*.rsp
      chmod 755 /usr/local/oracle*.rsp
      vi /usr/local/oracle/db_install.rsp
      oracle.install.option=INSTALL_DB_SWONLY     　　　　　　　　//安装类型,只装数据库软件
      ORACLE_HOSTNAME=db             　　　　　　　　　　　　　　　 //主机名称（命令hostname查询）
      UNIX_GROUP_NAME=oinstall       　　　　　　　　　　　　　　　 // 安装组
      INVENTORY_LOCATION=/usr/local/oraInventory  　　　　　　　　//INVENTORY目录（不填就是默认值,本例此处需修改,因个人创建安装目录而定）
      SELECTED_LANGUAGES=en,zh_CN            　　　　　　　　 　　// 选择语言
      ORACLE_HOME=/usr/local/oracle/product/11.2.0/db_1  　　　　// oracle_home 路径根据目录情况注意修改 本例安装路径/usr/local/oracle
      ORACLE_BASE=/usr/local/oracle                       　　　 // oracle_base 注意修改
      oracle.install.db.InstallEdition=EE          　　　　　　　 // oracle版本
      oracle.install.db.isCustomInstall=false      　　　　　　　 //自定义安装，否，使用默认组件
      oracle.install.db.DBA_GROUP=dba              　　　　　　　 //dba用户组
      oracle.install.db.OPER_GROUP=oinstall        　　　　　　　 //oper用户组
      oracle.install.db.config.starterdb.type=GENERAL_PURPOSE   //数据库类型
      oracle.install.db.config.starterdb.globalDBName=orcl      //globalDBName
      oracle.install.db.config.starterdb.SID=orcl  　　　　　　　 //SID（此处注意与环境变量内配置SID一致）
      oracle.install.db.config.starterdb.memoryLimit=81920      //自动管理内存的内存(M)
      oracle.install.db.config.starterdb.password.ALL=oracle    //设定所有数据库用户使用同一个密码
      SECURITY_UPDATES_VIA_MYORACLESUPPORT=false       　　　　　 //（手动写了false）
      DECLINE_SECURITY_UPDATES=true　　　　　　　　　　　　　　　　　// 注意此参数 设定一定要为true

- 切换 Oracle用户
      su - oracle
- 配置环境变量
      vim .bash_profile
      #添加
      export ORACLE_BASE=/usr/local/oracle
      export ORACLE_HOME=$ORACLE_BASE/product/11.2.0/db_1
      export ORACLE_SID=orcl    
      export ORACLE_OWNER=oracle
      export PATH=$PATH:$ORACLE_HOME/bin:$HOME/bin
      export LD_LIBRARY_PATH=$ORACLE_HOME/lib:/lib:/usr/lib
      #运行source生效
      source .bash_profile

- 执行安装命令
      /home/database/./runInstaller -silent -force -ignorePrereq -responseFile /usr/local/oracle/db_install.rsp

      参数说明  
      /home/database是安装包解压后的路径，此处根据安装包解压所在位置做修改，因人而异。
      runInstaller 是主要安装脚本
      -silent 静默模式
      -force 强制安装
      -ignorePrereq忽略warning直接安装。
      -responseFile读取安装应答文件。
