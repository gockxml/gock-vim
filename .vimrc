autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType scss set omnifunc=csscomplete#CompleteCSS
setlocal expandtab
setlocal shiftwidth=4
setlocal shiftround
setlocal tabstop=4
set bsdir=buffer
set incsearch
set autochdir
let Tlist_JS_Settings = 'javascript;s:string;a:array;o:object;f:function'
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'

let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim
"let Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist窗口``
let g:cssColorVimDoNotMessMyUpdatetime = 1
au BufRead,BufNewFile *.js set syntax=jquery
filetype plugin indent on
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
let g:acp_behaviorKeywordLength = 3
let g:acp_enableAtStartup = 0
