"-------------------------------------------------------------------------------- 
" 安装Vundle插件管理器
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" 安装插件  :PluginInstall
" 删除插件  :PluginClean
" 帮助文档  :h vundle
"--------------------------------------------------------------------------------
set nocompatible        " be iMproved, required
filetype off            " required
" set rtp(runtime path) to include Vundle, "+=" means append, "-=" means
" substract the value from the option
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/plugged')
Plugin 'VundleVim/Vundle.vim'

Plugin 'sheerun/vim-polyglot'

" 开启NERDTree F2 或 :NERDTree
" 关闭NERDTree q 或 :NERDTreeClose
Plugin 'preservim/nerdtree'

" Ctrl + P设为开关
Plugin 'jiangmiao/auto-pairs'

" 需要安装ctags
" sudo apt-get install universal-ctags
Plugin 'preservim/tagbar'

" 需要安装ack
" sudo apt-get install ack
Plugin 'dyng/ctrlsf.vim'

Plugin 'derekwyatt/vim-fswitch'

Plugin 'derekwyatt/vim-protodef'

" YCM
" 需要安装 build-essential cmake python3-dev llvm mono-complete golang
" nodejs default-jdk npm
" python3 install.py --all
Plugin 'ycm-core/YouCompleteMe'

" 颜色主题们
Plugin 'cocopon/iceberg.vim'
Plugin 'arcticicestudio/nord-vim'
Plugin 'Badacadabra/vim-archery'
Plugin 'kristijanhusak/vim-hybrid-material'
Plugin 'scheakur/vim-scheakur'
Plugin 'lifepillar/vim-solarized8'
Plugin 'sjl/badwolf'

call vundle#end()
filetype plugin indent on   " required
" Vundle设置结束

"-------------------------------------------------------------------------------- 
" 常规设置
set nu                  " 显示行号
syntax on               " 语法高亮
set tabstop =4          " Tab(\t) key indents by 4 spaces.
set shiftwidth  =4         " >> indents by 4 spaces.
set expandtab              " Use spaces instead of tabs.

set incsearch              " Highlight while searching with / or ?.
set hlsearch               " Keep matches highlighted. use :noh hide highlighted

" 用 :term打开终端窗口，用 :vsplit分割窗口，可以用鼠标拖动
set termwinsize =12x0   " Set terminal size
set splitbelow          " Always split below
set mouse =a            " Enable mouse drag on window splits

" 查看所有主题 :colorscheme [space] [Ctrl+d]
set background =dark
colorscheme solarized8_flat 

"-------------------------------------------------------------------------------- 
" 以前的配置，暂时保留
set shiftround             " >> indents to next multiple of 'shiftwidth'.
set backspace   =indent,eol,start  " Make backspace work as you would expect.
set hidden                 " Switch between buffers without having to save first.
set laststatus  =2         " Always show statusline.
set display     =lastline  " Show as much as possible of the last line.
set showmode               " Show current mode in command-line.
set showcmd                " Show already typed keys when more are expected.
set ttyfast                " Faster redrawing.
set lazyredraw             " Only redraw when necessary.
set splitright             " Open new windows right of the current window.
set cursorline             " Find the current line quickly.
set wrapscan               " Searches wrap around end-of-file.
set report      =0         " Always report changed lines.
set synmaxcol   =200       " Only highlight the first 200 columns.
set list                   " Show non-printable characters.
if has('multi_byte') && &encoding ==# 'utf-8'
  let &listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:±'
else
  let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.'
endif

"-------------------------------------------------------------------------------- 
" 按键映射

" 常规
nmap <C-B> :buffers<CR>
nmap <C-J> :term<CR>

" F10保存文件
map <F10> <ESC> :w<CR>
imap <F10> <ESC> :w<CR>
vmap <F10> <ESC> :w<CR>

" F9保存并执行当前脚本
map <F9> <ESC> :w<CR>:!bash %<CR>
imap <F9> <ESC> :w<CR>:!bash %<CR>
vmap <F9> <ESC> :w<CR>:!bash %<CR>

" NERDTree
nmap <F2> :NERDTreeToggle<CR>

" tagbar
nmap <F8> :TagbarToggle<CR>

" auto-pairs
let g:AutoPairsShortcutToggle = '<C-P>'

" ctrlsf
nmap <C-F>f <Plug>CtrlSFPrompt
xmap <C-F>f <Plug>CtrlSFVwordPath
xmap <C-F>F <Plug>CtrlSFVwordExec
nmap <C-F>n <Plug>CtrlSFCwordPath
nmap <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>

" protodef
nmap <buffer> <silent> <leader> ,PP
nmap <buffer> <silent> <leader> ,PN

" fswitch
nmap <C-Z> :vsplit <bar> :wincmd l <bar> :FSRight<CR>

"-------------------------------------------------------------------------------- 
" 插件配置

" NERDTree
let NERDTreeShowBookmarks = 1   " Show the bookmarks table
let NERDTreeShowHidden = 1      " Show hidden files
let NERDTreeShowLineNumbers = 0 " Hide line numbers
let NERDTreeMinimalMenu = 1     " Use the minimal menu (m)
let NERDTreeWinPos = "left"     " Panel opens on the left side
let NERDTreeWinSize = 31        " Set panel width to 31 columns

" tagbar
let g:tagbar_autofocus = 1      " Focus the panel when opening it
let g:tagbar_autoshowtag = 1    " Highlight the active tag
let g:tagbar_position = 'botright vertical' " Make panel vertical and place on the right

" ctrlsf
let g:ctrlsf_backend = 'ack'                " Use the ack tool as the backend
let g:ctrlsf_auto_close = { "normal":0, "compact":0 }   " Auto close the results panel when opening a file
let g:ctrlsf_auto_focus = { "at":"start" }  " Immediately switch focus to the search window
let g:ctrlsf_auto_preview = 0               " Don't open the preview window automatically
let g:ctrlsf_case_sensitive = 'smart'       " Use the smart case sensitivity search scheme
let g:ctrlsf_default_view = 'normal'        " Normal mode, not compact mode
let g:ctrlsf_regex_pattern = 0              " Use absoulte search by default
let g:ctrlsf_position = 'right'             " Position of the search window
let g:ctrlsf_winsize = '46'                 " Width or height of search window
let g:ctrlsf_default_root = 'cwd'           " Search from the current working directory

" fswitch
au! BufEnter *.cpp let b:fswitchdst = 'hpp,h'
au! BufEnter *.h let b:fswitchdst = 'cpp,c'



