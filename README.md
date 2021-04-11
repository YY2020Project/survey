# survey
サーベイ検証用＆環境構築とか試す用のリポジトリ

今回はあくまでも検証用のリポジトリになります．
環境はUbuntu18.04上で動くことを想定しています．
先にNVIDIAのcuda 11.0をインストール（既に入っている場合はスルーしていただいて大丈夫です．）

## ファイル構成

## Docker上の環境
- OS : Ubuntu 18.04

## インストール手順
以下の手順で順番通りにインストールをしてください．
1. cuda(11.0)のインストール
env/cuda_toolkitから以下のスクリプトをuser権限で実行してください．
```
bash install_cuda.sh
```

2. Dockerのインストール
env/dockerで以下のスクリプトをuser権限で実行してください
```
bash install.sh
```
3. NVIDIA-Dockerのインストール
env/NVIDIA_Dockerで以下のスクリプトをuser権限で実行してください
```
bash install.sh
```

NVIDIA-Dockerまでインストール出来たら，一度Dockerを再起動してください．

```
sudo service docker restart
```

## Tensorflowの動作確認
まず，Tensorflowの動作確認を行います．ここではDockerを作成したのち，実行も一気に行って動作が問題ないかを確認します．
```
docker run --shm-size=1g --ulimit memlock=-1 --ulimit stack=67108864 --gpus all --rm -it nvcr.io/nvidia/tensorflow:20.12-tf2-py3
```

## Dockerイメージの作成．サンプルの実行
ここまで順調にいけば後はDockerのサンプルイメージを実行するのみです．
まずはDockerのイメージ作成を行ってください．

```
sudo docker build -t pytorch_GPU_test
```

イメージが作成できれば，コンテナの中に入ります．次のコマンドで作成したイメージ（仮想環境）に入り，Linux同様仮想環境内をコマンドで自由に動かすことが出来ます．
```
sudo docker run -it --gpus all  pytorch_GPU_test /bin/bash
```

コンテナに入れたらカレントディレクトリ上に「train.py」というソースがあるかと思います．

```
python3 train.py
```
で実行して無事動作したら環境構築としては問題ないです．上記の環境は今後の研究でも用いる環境のベースになるかと考えられるのでDocker build，Docker runの手順は頭に入れて頂けたら幸いです．
引用 https://qiita.com/conankonnako/items/787b69cd8cbfe7d7cb88
