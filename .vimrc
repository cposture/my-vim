set nocompatible
"根据侦测到的不同类型加载对应的插件
filetype off

"############################################### begin vim-plug ################################
call plug#begin()
"CurtineIncSw.vim 插件，用于头文件源文件来回切换
Plug '~/vim-plugin/ericcurtin/CurtineIncSw.vim'
"YouCompleteMe 插件，用于补全和提示
Plug '~/vim-plugin/YouCompleteMe'
"YouCompleteMe 辅助插件，生成项目 .ycm_extra_conf.py 文件
Plug '~/vim-plugin/rdnetto/YCM-Generator'
"Molokai 主题
Plug '~/vim-plugin/tomasr/molokai'
"类/方法/变量相关侧边栏，依赖 ctags
Plug '~/vim-plugin/majutsushi/tagbar'
"自动补全括号插件
Plug '~/vim-plugin/jiangmiao/auto-pairs'
"状态栏
Plug '~/vim-plugin/vim-airline/vim-airline'
"开箱即用型的语法高亮包，支持大部分前端后台语言
Plug '~/vim-plugin/sheerun/vim-polyglot'
"缩进线，方便 python 语言对齐
Plug '~/vim-plugin/Yggdroot/indentLine'
"树形目录插件
Plug '~/vim-plugin/scrooloose/nerdtree'
"语法检查
Plug '~/vim-plugin/vim-syntastic/syntastic'
call plug#end()
"############################################### end vim-plug ##################################

"############################################### begin common-conf #############################
"=========================================
" 键盘配置
"=========================================
" CTRL + LEFT 打开 buffer 文件列表下个文件
nnoremap <C-LEFT> :bn<CR>
" CTRL + RIGHT 打开 buffer 文件列表上个文件
nnoremap <C-RIGHT> :bp<CR>
" CTRL + N 打开下一个 tab
nnoremap <C-N> :tabn<CR>
" CTRL + P 打开上一个 tab
nnoremap <C-P> :tabp<CR>
"去空行  
"nnoremap <F2> :g/^\s*$/d<CR> 
"map <F12> gg=G
"############################################### end common-conf ###############################

"############################################### begin 所有插件配置 #############################
"=========================================
" CurtineIncSw.vim 插件配置
"=========================================
"CTRL + R 头文件源文件来回切换
map <C-R> :call CurtineIncSw()<CR>

"=========================================
" YouCompleteMe 插件配置
"=========================================
".ycm_extra_conf.py 文件路径
let g:ycm_global_ycm_extra_conf = '/data/luffichen/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"是否开启语义补全
let g:ycm_seed_identifiers_with_syntax=1
"打开vim时不再询问是否加载.ycm_extra_conf.py配置
let g:ycm_confirm_extra_conf=0
"提示框展示
set completeopt=longest,menu
"跳转快捷键
" space + j + c 跳转到声明处
nnoremap <leader>jc :YcmCompleter GoToDeclaration<CR>
"space + j + f 跳转到定义处
nnoremap <leader>jf :YcmCompleter GoToDefinition<CR>
"space + j + j 跳转到声明或定义处
nnoremap <leader>jj :YcmCompleter GoToDefinitionElseDeclaration<CR>
"YCM将使用此选项的值作为Vim装订线中错误的符号
let g:ycm_error_symbol = '>>'
"YCM将使用此选项的值作为Vim装订线中警告的符号
let g:ycm_warning_symbol = '>*'
"回车即选中当前项"
inoremap <expr> <CR>       pumvisible() ? '<C-y>' : '<CR>'
let g:ycm_autoclose_preview_window_after_completion = 0
inoremap <expr> <CR> pumvisible() ? "\<C-Y>\<ESC>a" : "\<CR>"

"=========================================
" CurtineIncSw.vim 插件配置
"=========================================
" CTRL-R头文件源文件来回切换
map <C-R> :call CurtineIncSw()<CR>

"=========================================
" YCM-Generator 插件配置
"=========================================
" ctrl-I 自动生成 .ycm_extra_conf.py 文件
map <C-I> :YcmGenerateConfig -c g++ -v -x c++ -m /usr/bin/make -f -b make .<CR>

"=========================================
" molokai 插件配置
"=========================================
"设置背景主题
color molokai

"=========================================
" tagbar 插件配置，依赖 ctags
"=========================================
" F9 展示类/方法/变量相关侧边栏
nmap <F9> :TagbarToggle<CR>
"启动时自动focus
let g:tagbar_autofocus = 1

"=========================================
" auto-pairs 插件配置
"=========================================

"=========================================
" vim-airline 插件配置
"=========================================
"当只打开一个选项卡时自动显示所有缓冲区
let g:airline#extensions#tabline#enabled = 1

"=========================================
" vim-polyglot 插件配置
"=========================================

"=========================================
" indentLine 插件配置
"=========================================
"打开缩进线
let g:indentLine_enabled = 1

"=========================================
" indentLine 插件配置
"=========================================
"打开树形目录
map <F3> :NERDTreeToggle<CR>
imap <F3> <ESC> :NERDTreeToggle<CR>
"只剩 NERDTree 时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"=========================================
" syntastic 插件配置
"=========================================
"检查语法错误
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"############################################### end 所有插件配置 ###############################

filetype plugin indent on    " required

if has("gui_running")
    au GUIEnter * simalt ~x " 窗口启动时自动最大化
    set guioptions-=m " 隐藏菜单栏
    set guioptions-=T " 隐藏工具栏
    set guioptions-=L " 隐藏左侧滚动条
    set guioptions-=r " 隐藏右侧滚动条
    set guioptions-=b " 隐藏底部滚动条
    "set showtabline=0 " 隐藏Tab栏
endif
syntax on
let mapleader = "\<Space>"
set sw=4
set ts=4
set et
set smarttab
set smartindent
set lbr
set fo+=mB
set sm
set selection=inclusive
set wildmenu
set mousemodel=popup
set t_Co=256 "256位色"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 显示相关  
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set cul "高亮光标所在行
set cuc
color molokai     " 设置背景主题  
set guifont=Monaco:h10:b
set ruler           " 显示标尺  
set showcmd         " 输入的命令显示出来，看的清楚些  
set scrolloff=2     " 光标移动到buffer的顶部和底部时保持3行距离  
set laststatus=2   " 启动显示状态行(1),总是显示状态行(2)  
"set foldenable      " 允许折叠  
"set foldmethod=manual   " 手动折叠  
set cursorline              " 突出显示当前行
set magic                   " 设置魔术
" 自动缩进
set autoindent
set cindent
" Tab键的宽度
set tabstop=4
" 统一缩进为4
set softtabstop=4
set shiftwidth=4
" 使用空格代替制表符
set expandtab
" 在行和段开始处使用制表符
set smarttab
" 显示行号
set number
" 历史记录数
set history=1000
"搜索逐字符高亮
set hlsearch
set incsearch
"语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn
" 总是显示状态行
set cmdheight=1
" 侦测文件类型
filetype on
" 载入文件类型插件
filetype plugin on
" 为特定文件类型载入相关缩进文件
filetype indent on
" 保存全局变量
set viminfo+=!
" 带有如下符号的单词不要被换行分割
set iskeyword+=$,@,%,#,-,_

" 字符间插入的像素行数目
"markdown配置
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn}   set filetype=mkd
au BufRead,BufNewFile *.{go}   set filetype=go
au BufRead,BufNewFile *.{js}   set filetype=javascript
au BufRead,BufNewFile *.{htm}   set filetype=html

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"键盘命令
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"html标签自动补全
map! <C-O> <C-Y>,

"C，C++ 按F5编译运行
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!gcc % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'java' 
        exec "!javac %" 
        exec "!time java %<"
    elseif &filetype == 'cs'
        exec "!mcs %"
        exec "!time mono %<.exe"
    elseif &filetype == 'python'
        exec "!python3 %"
    endif
endfunc
"C,C++的调试
map <F8> :call Rungdb()<CR>
func! Rungdb()
    exec "w"
    exec "!g++ % -g -o %<"
    exec "!gdb ./%<"
endfunc
"代码格式优化化
map <F6> :call FormartSrc()<CR><CR>
"定义FormartSrc()
func FormartSrc()
    exec "w"
    if &filetype == 'c'
        exec "!astyle --style=ansi -a --suffix=none %"
    elseif &filetype == 'cpp' || &filetype == 'hpp'
        exec "r !astyle --style=ansi --one-line=keep-statements -a --suffix=none %> /dev/null 2>&1"
    elseif &filetype == 'perl'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'py'||&filetype == 'python'
        exec "r !autopep8 -i --aggressive %"
    elseif &filetype == 'java'
        exec "!astyle --style=java --suffix=none %"
    elseif &filetype == 'jsp'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'xml'
        exec "!astyle --style=gnu --suffix=none %"
    else
        exec "normal gg=G"
        return
    endif
    exec "e! %"
endfunc
"结束定义FormartSrc

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""实用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \   exe "normal g`\"" |
                \ endif
endif
" 只剩 NERDTree时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" 设置当文件被改动时自动载入
set autoread
" quickfix模式
autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>
"代码补全 
set completeopt=preview,menu 
"自动保存
set autowrite
" 去掉输入错误的提示声音
"set noeb
" 在处理未保存或只读文件的时候，弹出确认
set confirm
"禁止生成临时文件
set noundofile
set nobackup
set noswapfile
"搜索忽略大小写
set ignorecase
set linespace=0
" 增强模式中的命令行自动完成操作
set wildmenu
" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2
" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set mouse=a
set selection=exclusive
set selectmode=mouse,key
" 通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0
" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\ 

" 高亮显示匹配的括号
set showmatch
" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=1
" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3

filetype plugin indent on 
"打开文件类型检测, 加了这句才可以用智能补全
set completeopt=longest,menu
set tags=tags;
set autochdir "输出时只有文件名，不带./ ../等目录前缀(默认了执行％在当前的目录下)
set termencoding=utf-8
set encoding=utf8
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030
"tags 跳转，ctrl+左键跳转
nnoremap <C-LeftMouse> <C-]><CR>

"javacomplete2配置
augroup filetype java
    "F4自动补全倒入缺失包｀
    autocmd FileType java nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
    autocmd FileType java imap <F4> <Plug>(JavaComplete-Imports-AddSmart)
    "To enable usual (will ask for import option) inserting class imports with F5, add:
    "nmap <F5> <Plug>(JavaComplete-Imports-Add)
    "imap <F5> <Plug>(JavaComplete-Imports-Add)
    "To add all missing imports with F6:
    "nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)
    "imap <F6> <Plug>(JavaComplete-Imports-AddMissing)
    "To remove all missing imports with F7:
    "nmap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
    "imap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
    "Default mapping for accessors generation:
    nmap <buffer> <leader>jA <Plug>(JavaComplete-Generate-Accessors)
    nmap <buffer> <leader>js <Plug>(JavaComplete-Generate-AccessorSetter)
    nmap <buffer> <leader>jg <Plug>(JavaComplete-Generate-AccessorGetter)
    nmap <buffer> <leader>ja <Plug>(JavaComplete-Generate-AccessorSetterGetter)
    "imap <buffer> <C-j>s <Plug>(JavaComplete-Generate-AccessorSetter)
    "imap <buffer> <C-j>g <Plug>(JavaComplete-Generate-AccessorGetter)
    "imap <buffer> <C-j>a <Plug>(JavaComplete-Generate-AccessorSetterGetter)
augroup end


"关于neocomplete，需要安装lua---------------------------------------------------------------------
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" AutoComplPop like behavior.
let g:neocomplete#enable_auto_select = 1
" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()
" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:]*\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:]*\t]\%(\.\|->\)\|\h\w*::'

" Enable omni completion.
autocmd FileType java setlocal omnifunc=javacomplete#Complete
autocmd FileType cs setlocal omnifunc=OmniSharp#Complete
autocmd FileType python set omnifunc=python3complete#Complete
autocmd FileType JavaScript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

"把omni补全设置成tab键
"let g:SuperTabDefaultCompletionType="<C-X><C-O>" 


augroup VimCSS3Syntax
    autocmd!
    autocmd FileType css setlocal iskeyword+=-
augroup END
let g:cssColorVimDoNotMessMyUpdatetime = 1

let g:nodejs_complete_config = {
            \'js_compl_fn': 'javascriptcomplete#CompleteJS',
            \'max_node_compl_len': 15
            \}
"javascript html5 API补全插件
let g:jscomplete_use = ['dom', 'html5API', 'webGL']
let g:jscomplete_webgl_ns = 'webgl'
let g:javascript_plugin_jsdoc = 1

"augroup javascript_folding
"    au!
"    au FileType javascript setlocal foldmethod=syntax
"augroup END

let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
