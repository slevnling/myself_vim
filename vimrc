""""""""""""""""""""""""""""""""""""""""""""""""
"                    配置Pathogen              "
""""""""""""""""""""""""""""""""""""""""""""""""
    execute pathogen#infect()
    call    pathogen#helptags() 

""""""""""""""""""""""""""""""""""""""""""""""""
"                    基本配置                  "
""""""""""""""""""""""""""""""""""""""""""""""""
    set nocompatible

    "设置默认编码
    set encoding=utf8
    set fenc=utf-8
    set fileencoding=utf-8

    set ruler

    "显示行号
    set nu
    "自动换行
    set wrap
    "按下F2关闭或者显示行号
    nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>

    "文件类型
    filetype on 
    filetype plugin on "针对不同的文件类型加载对应的插件
    filetype indent on "针对不同的文件类型采用不同的缩进格式

    "显示当前的行号和序列号
    set ruler
    "在状态栏显示正在输入的命令
    set showcmd 
    "wild模式
    set wildmenu

    "支持鼠标
    set mouse=a

    "支持单词拼写检查
    "set spell

    "语法高亮,设置配色方案
    syntax on
    set background=dark
    colorscheme solarized
    set guifont=YaHei\ Consolas\ Hybrid\ 10
""""""""""""""""""""""""""""""""""""""""""""""""
"                    自动保存                  "
"""""""""""""""""""""""""""""""""""""""""""""""" 
    let g:auto_save = 1
""""""""""""""""""""""""""""""""""""""""""""""""
"                    设置缩进                  "
""""""""""""""""""""""""""""""""""""""""""""""""
    set autoindent 
    set expandtab
    set tabstop=4
    set shiftwidth=4
    "打开vim时把已有的Tab全部转换为空格
    retab 

""""""""""""""""""""""""""""""""""""""""""""""""
"                    快速退出                  "
""""""""""""""""""""""""""""""""""""""""""""""""
    imap jj <esc>
    map ,f :q!<CR>
""""""""""""""""""""""""""""""""""""""""""""""""
"                    快速vimrc
""""""""""""""""""""""""""""""""""""""""""""""""
    map ,e :e ~/.vimrc<CR>
    map ,j :e ~/.vim/bundle/snipmate/snippets/java.snippets<CR>
    autocmd! bufwritepost vimrc source ~/.vimrc

""""""""""""""""""""""""""""""""""""""""""""""""
"                    ctrlp                     "
""""""""""""""""""""""""""""""""""""""""""""""""
    set runtimepath^=~/.vim/bundle/ctrlp.vim

""""""""""""""""""""""""""""""""""""""""""""""""
"                    NERDTree                  "
""""""""""""""""""""""""""""""""""""""""""""""""
    map <c-n> :NERDTreeToggle<CR>
    "autocmd VimEnter * NERDTree
    let NERDTreeWinPos="right"
    let NERDTreeWinSize=30
    let NERDTreeMouseMode=2
    let NERDChristmasTree=1 
    let NERDTreeShowHidden=1
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

""""""""""""""""""""""""""""""""""""""""""""""""
"                    配置代码折叠              "
""""""""""""""""""""""""""""""""""""""""""""""""
    " 按下 'za' 打开或者折叠代码
    set foldmethod=indent
    set foldlevel=99
    map <F3> za
""""""""""""""""""""""""""""""""""""""""""""""""
"                    缓冲区切换              "
""""""""""""""""""""""""""""""""""""""""""""""""

    set hidden "in order to switch between buffers with unsaved change 
    map <s-tab> :bp<cr>
    map <tab> :bn<cr>
    map ,bd :bd<cr>
""""""""""""""""""""""""""""""""""""""""""""""""
"                    窗口分列                  "
""""""""""""""""""""""""""""""""""""""""""""""""
    " 垂直分屏 ： Ctrl+w+v
    " 水平分屏 ： Ctrl+w+s
    map <c-j> <c-w>j
    map <c-k> <c-w>k
    map <c-l> <c-w>l
    map <c-h> <c-w>h


""""""""""""""""""""""""""""""""""""""""""""""""
"                单词拼写检查                  "
""""""""""""""""""""""""""""""""""""""""""""""""

    let g:languagetool_jar='/home/doro/.vim/bundle/language-tool/LanguageTool-2.5/languagetool-commandline.jar'
    
""""""""""""""""""""""""""""""""""""""""""""""""
"                indent line                   "
""""""""""""""""""""""""""""""""""""""""""""""""
    let g:indentLine_colot_term=239
    

""""""""""""""""""""""""""""""""""""""""""""""""
"                F5编译运行，JAVA                   "
""""""""""""""""""""""""""""""""""""""""""""""""

func! CompileCode()
    exec "w"
    if &filetype == "java"
        exec "!javac -encoding utf-8 %"
    endif
endfunc

func! RunCode()
    if &filetype == "java"
        exec "!java -classpath %:h: %:t:r"
    endif
endfunc

"F5 保存和编译
map <F5> :call CompileCode()<CR>

"F6 运行
map <F6> :call RunCode()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""
"                java complete                 "
""""""""""""""""""""""""""""""""""""""""""""""""
