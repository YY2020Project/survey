#!/bin/sh
# 必要パッケージのインストール
apt update
apt install apt-transport-https ca-certificates curl software-properties-common
 
# 公式DockerリポジトリのGPGキーを追加
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"

# Docker本体のインストール
apt update
apt-cache policy docker-ce