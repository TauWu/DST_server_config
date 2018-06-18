#!/bin/bash
# 安装脚本

REPO_PATH=`pwd`

echo "开始安装 Don't Starve Together 独立服务器..."
echo "                                        "
echo "***************  食用说明  ***************"
echo "                                        "
echo "本安装方法为 steam 快速的安装方法，适合开箱即玩"
echo "                                        "
echo "*****************************************"
echo "                                        "

echo "请输入您的token!"
read TOKEN
# echo "请输入您的服务器名称!"
# read SERVER_NAME
# echo "请输入您的服务器密码!"
# read SERVER_PWD

# 创建必要的目录
echo "开始创建必要的目录..."
cd ~
if [ ! -d "dst_data" ]; then
    mkdir dst_data
else
    echo "项目根目录已经存在，跳过..."
fi

cd dst_data
if [ ! -d "steam_cmd" ]; then
    mkdir steam_cmd
else
    echo "steam_cmd 目录已经存在，跳过..."
fi

if [ ! -d "dst_server" ]; then
    mkdir dst_server
else
    echo "dst_server 目录已经存在，跳过..."
fi

sleep 1
# 使用 steam_cmd 安装游戏
echo "开始使用 steam_cmd 安装游戏..."
STAEM_CMD_PATH=~/dst_data/steam_cmd/
DST_SERVER_PATH=~/dst_data/dst_server/
CLUSTER_PATH=~/.klei/DoNotStarveTogether/Cluster_1/

cp $REPO_PATH/data/steamcmd_linux.tar.gz $STAEM_CMD_PATH
cd $STAEM_CMD_PATH
tar -xvzf steamcmd_linux.tar.gz
./steamcmd.sh +login anonymous +force_install_dir $DST_SERVER_PATH +app_update 343050 validate +quit

# 配置 .klei
apt-get install libcurl4-gnutls-dev:i386
cp -r $REPO_PATH/data/.klei ~/
echo $TOKEN > $CLUSTER_PATH/cluster_token.txt

# 配置 mods
cp -r $REPO_PATH/data/mods $DST_SERVER_PATH
