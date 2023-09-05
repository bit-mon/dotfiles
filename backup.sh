#!/bin/bash
#脚本所在目录
script_path=$(cd $(dirname ${BASH_SOURCE[0]}); pwd)

#当前时间
time=$(date "+%Y-%m-%d.%H:%M:%S")

#需要备份的主目录文件
array=( .tmux.conf  \
    .zshrc      \
    .gitconfig
    .vimrc      )

#菜单
clear
echo "
请选择：
0. 退出
1. 备份用户目录下的dotfiles
2. 上传备份文件到git仓库
3. 建立备份文件到用户目录的软连接
4. 安装常用软件
5. 更改清华大学源
"
read -p "请选择 >"

case "$REPLY" in
    0)  echo "Bye."
        exit
        ;;
    1)  for element in ${array[@]}
        do
            cp -rf $HOME/$element $script_path 
        done
        ;;
    2)  git add --all
        git commit -m "backup at $time"
        git push
        ;;
    3)  for element in ${array[@]}
        do
            ln -s $script_path/$element $HOME
        done
        ;;
    4)  sudo apt-get install git zsh tmux weechat
        #安装tmux插件管理器
        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
        bash ~/.tmux/plugins/tpm/bin/install_plugins
        ;;
    5)  sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak.$time
        sudo cp $script_path/sources.list /etc/apt/sources.list
        ;;
    *)  echo "Bye." >&2
        exit 1
        ;;
esac


