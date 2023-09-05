# 时间消耗分析，exec zsh后zprof
zmodload zsh/zprof

# 使用P10K主题的Instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# -------------------------------------------------------------------------------------
# Zinit插件管理器
# -------------------------------------------------------------------------------------
# 安装Zinit
# bash -c "$(curl --fail --show-error --silent --location \
# https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
# 上述命令会将Zinit安装到 ~/.localshare/zinit/zinit.git

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"

# 加载OMZ库文件
zinit snippet OMZL::history.zsh             # history格式化及alias
zinit snippet OMZL::clipboard.zsh
zinit snippet OMZL::completion.zsh
zinit snippet OMZL::functions.zsh           # take等函数
zinit snippet OMZL::git.zsh
zinit snippet OMZL::key-bindings.zsh
zinit snippet OMZL::theme-and-appearance.zsh

# 加载OMZ插件
#zinit snippet OMZP::colorize               # 彩色的ccat和cless
zinit snippet OMZP::colored-man-pages
#zinit snippet OMZP::command-not-found      # 如果命令不存在，会提醒可能缺失的依赖
zinit snippet OMZP::extract                 # x解压缩
zinit snippet OMZP::git                     # git alias
zinit snippet OMZP::sudo                    # 按两下ESC，sudo执行上一条命令 

#autoload -Uz compinit; compinit
zinit light Aloxaf/fzf-tab

# 快速目录跳转
zinit ice lucid wait='1'
zinit light skywind3000/z.lua

# 语法高亮
zinit ice lucid wait='0' atinit='zpcompinit'
zinit light zdharma/fast-syntax-highlighting

# 命令自动建议
zinit ice lucid wait='0' atload='_zsh_autosuggest_start'
zinit light zsh-users/zsh-autosuggestions

# 补全
zinit ice lucid wait='0'
zinit light zsh-users/zsh-completions

# 主题
zinit ice depth=1
zinit light romkatv/powerlevel10k

# Alias提示
#zinit light djui/alias-tips

### End of Zinit's installer chunk

# -------------------------------------------------------------------------------------
# 常规设置
# -------------------------------------------------------------------------------------

# 如果tmux没有运行，设置默认终端
[[ $TMUX = "" ]] && export TERM="xterm-256color"

# 设置命令别名
# alias ls="ls --color=auto"
# alias ll="ls -lh --time-style=long-iso --color=auto"
# alias la="ls -lah --time-style=long-iso --color=auto"
alias ls="exa"      # 同ls
alias la="exa -a"   # 列出隐藏文件
alias ll="exa -lhg --time-style=long-iso"       # 同ls -l
alias lla="exa -lhga --time-style=long-iso"     # 同ls -al
alias lal="exa -lhgabHiS --time-style=long-iso" # 最丰富的信息

alias md='mkdir -p'
alias zshconfig="vim ~/.zshrc"
alias vimconfig="vim ~/.vimrc"
alias ansibleconfig="vim ~/.ansible/ansible.cfg"
alias grep='grep --color=auto'
alias sapp='apt search'
alias install='sudo apt install -y'
alias c='clear'
alias date='date "+%Y-%m-%d %H:%M:%S"' 

# python版本切换
alias swpy='sudo update-alternatives --config python'
# 删除Vundle之外的Vim插件
alias rmvp='ls -d .vim/bundle/* | grep -v Vundle | xargs rm -rf'

# 为编译安装的程序和用户程序目录设置环境变量
export PATH=/home/debian/git/script/release:/home/debian/git/script/debug:/usr/local/bin/vim/bin:$PATH

# 启用autojump
#. /usr/share/autojump/autojump.sh                  # 用z.lua替代

# -------------------------------------------------------------------------------------
# Powerlevel10k主题设置
# -------------------------------------------------------------------------------------

# 设置提示符
POWERLEVEL9K_PROMPT_ON_NEWLINE=true                 # 在第二行显示提示符
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=$'\n'    # 第一行提示符前缀
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="\uF460%F{073}\uF460%F{109}\uF460%f "     # 第二行提示符前缀
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR='\uE0C0'        # 设置左提示符分段符号
POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR='\uE0C0'     # 二级分段符号
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR='\uE0C2'       # 设置右提示符分段符号
POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR='\uE0C2'    # 二级分段符号
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir dir_writable vcs virtualenv)     # 设置左提示符
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs command_execution_time time)     # 设置右提示符
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3                   # 显示3个文件夹名称，其余省略
POWERLEVEL9K_SHORTEN_DELIMITER='..'                 # 指定省略符号

POWERLEVEL9K_MODE='nerdfont-complete'

# -------------------------------------------------------------------------------------
# ohmyzsh配置
# -------------------------------------------------------------------------------------

# 加载ohmyzsh配置文件
# source /home/pi/.omzrc

#自动rehash
zstyle ':completion:*' rehash true

#使用powerline
#. /home/pi/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh


# -------------------------------------------------------------------------------------
# 其他配置
# -------------------------------------------------------------------------------------

export GOPATH="$HOME/workspace"

# 设置代理
#set proxy
#export http_proxy="http://127.0.0.1:7890"
#export https_proxy="http://127.0.0.1:7890"

# 设置编码
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# 变量代替Github的PAT，格式为export PAT=''
# source ~/.Github_PAT-SuperMicro

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# 自定义mc，退出的时候更改并跳转目录
#. /usr/lib/mc/mc.sh
### End of Zinit's installer chunk

# -------------------------------------------------------------------------------------
# Fast and simple Node.js version manager, built in Rust
# https://github.com/Schniz/fnm
# -------------------------------------------------------------------------------------
export PATH=/home/debian/.fnm:$PATH
eval "`fnm env`"
### End of Zinit's installer chunk




# Scaleway CLI autocomplete initialization.
eval "$(scw autocomplete script shell=zsh)"

# Source common.sh from Github
#source <(wget -qO- https://raw.githubusercontent.com/whiterabbit-monster/scripts/main/lib/common.sh)
