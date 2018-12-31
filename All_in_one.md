## 系统配置

 sudo sh -c "echo fastestmirror=true >> /etc/dnf/dnf.conf"
 sudo sh -c "echo keepcache=true >> /etc/dnf/dnf.conf"


sudo dnf install binutils compat-libstdc++-33 compat-libstdc++-33.i686 elfutils-libelf elfutils-libelf-devel gcc gcc-c++ glibc glibc.i686 glibc-common glibc-devel glibc-devel.i686 glibc-headers ksh libaio libaio.i686 libaio-devel libaio-devel.i686 libgcc libgcc.i686 libstdc++ libstdc++.i686 libstdc++-devel libXi libXtst make sysstat unixODBC unixODBC-devel

sudo dnf install git gcc-c++ patch openssl-devel libjpeg-devel libxslt-devel make which python-devel mysql-devel -y

sudo dnf install readline-devel wv poppler-utils -y

sudo dnf install binutils gcc gcc-c++ gcc-gfortran make m4 perl tar git perl-ExtUtils-MakeMaker
sudo dnf install texlive
sudo dnf install openssl openssl-devel

## 源代码


## 安装
virtualenv --no-site-packages --no-setuptools venv
