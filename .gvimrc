"当使用了图形界面，并且环境变量 LANG 中不含“.”（即没有规定编码）时，把 Vim
"的内部编码设为 UTF-8
set guifont=Monaco\ 11
set number 
color blackboard 
set tabstop=4                " 设置tab键的宽度
"set shiftwidth=4             " 换行时行间交错使用4个空格
"set autoindent               " 自动对齐
"set backspace=2              " 设置退格键可用
"set cindent shiftwidth=4     " 自动缩进4空格
"set smartindent              " 智能自动缩进
"set ai!                      " 设置自动缩进
"set mouse=a                  " 启用鼠标
"set ruler                    " 右下角显示光标位置的状态行
"set incsearch                " 查找book时，当输入/b时会自动找到
"set hlsearch                 " 开启高亮显示结果
"set incsearch                " 开启实时搜索功能
"set nowrapscan               " 搜索到文件两端时不重新搜索
"set nocompatible             " 关闭兼容模式
"set vb t_vb=                 " 关闭提示音
"set hidden                   " 允许在有未保存的修改时切换缓冲区
"set list                     " 显示Tab符，使用一高亮竖线代替
set listchars=tab:\|\ ,
syntax enable                " 打开语法高亮
syntax on                    " 开启文件类型侦测
filetype indent on           " 针对不同的文件类型采用不同的缩进格式
filetype plugin on           " 针对不同的文件类型加载对应的插件
filetype plugin indent on    " 启用自动补全
set guioptions-=m
set guioptions-=T
map <silent> <F2> :if &guioptions =~# 'T' <Bar>
            \set guioptions-=T <Bar>
            \set guioptions-=m <bar>
            \else <Bar>
            \set guioptions+=T <Bar>
            \set guioptions+=m <Bar>
            \endif<CR>

function! CompileCode()
    exec "w"
    if &filetype == "c"
        exec "call CompileGcc()"
    elseif &filetype == "cpp"
        exec "call CompileCpp()"
    elseif &filetype == "java"
        exec "call CompileJava()"
    elseif &filetype == "lua"
        exec "!lua %<.lua"
    elseif &filetype == "perl"
        exec "!perl %<.pl"
    elseif &filetype == "python"
        exec "!python %<.py"
    elseif &filetype == "ruby"
        exec "!ruby %<.rb"
    elseif &filetype == "scss"
        exec "!sass --style compressed %<.scss %<.scss.css"
    endif
endfunction

map <C-s> :call CompileCode()<CR>
imap <C-s> <ESC> :call CompileCode()<CR>
vmap <C-s> <ESC> :call CompileCode()<CR>
vmap <C-c> "+yi
vmap <C-x> "+c


map <C-M-V>   "+gP
cmap <C-M-V> <C-R>+
imap <C-M-V> <C-R>+
function! TabPos_ActivateBuffer(num)
    let s:count = a:num 
    exe "tabfirst"
    exe "tabnext" s:count  
endfunction

function! TabPos_Initialize()
    for i in range(1, 9) 
        exe "map <M-" . i . "> :call TabPos_ActivateBuffer(" . i . ")<CR>"
    endfor
    exe "map <M-0> :call TabPos_ActivateBuffer(10)<CR>"
endfunction

autocmd VimEnter * call TabPos_Initialize()

imap <silent> <F8> <esc>:NERDTreeToggle<CR>
nmap <silent> <F8> :NERDTreeToggle<CR>




"隐藏底部滚动条
set guioptions-=b
""隐藏右边滚动条
set guioptions-=R
set guioptions-=r
"隐藏左边滚动条
set guioptions-=l
set guioptions-=L

map <c-t> :FufCoverageFile!<CR> 
set incsearch
set hlsearch
set guitablabel=%N/\ %t\ %M
set sw=4
