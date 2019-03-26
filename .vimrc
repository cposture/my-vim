set nocompatible
"保存全局变量
set viminfo+=!
"设置文件格式为unix，这样换行不会带 ^M
set fileformat=unix

"############################################### begin vim-plug ################################
call plug#begin()
"CurtineIncSw.vim 插件，用于头文件源文件来回切换
Plug '~/vim-plugin/ericcurtin/CurtineIncSw.vim'
"YouCompleteMe 插件，用于补全和提示
Plug '~/YouCompleteMe'
"YouCompleteMe 辅助插件，生成项目 .ycm_extra_conf.py 文件
Plug '~/vim-plugin/rdnetto/YCM-Generator'
"Molokai 主题
Plug '~/vim-plugin/tomasr/molokai'
"solarized 主题
"Plug '~/vim-plugin/altercation/vim-colors-solarized'
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
"配对标签跳转
Plug '~/vim-plugin/andymass/vim-matchup'
"python PEP8标准自动缩进，在函数多行定义下有用
Plug '~/vim-plugin/Vimjas/vim-python-pep8-indent'
"python 折叠
Plug '~/vim-plugin/tmhedberg/SimpylFold'
" vim 中文版文档
Plug '~/vim-plugin/yianwillis/vimcdoc'
"自动补全记忆插件
Plug '~/vim-plugin/ervandew/supertab'
"异步实时代码检索
Plug '~/vim-plugin/wsdjeg/FlyGrep.vim'
"nerdtree 辅助插件，展示文件状态
Plug '~/vim-plugin/Xuyuanp/nerdtree-git-plugin'
"版本控制系统 vcs 展示每列的增删改状态，支持大部分 vcs
Plug '~/vim-plugin/mhinz/vim-signify'
"查看和切换缓冲区
Plug '~/vim-plugin/bsdelf/bufferhint'
" syntastic c++ 辅助插件，用于生成配置文件
Plug '~/vim-plug/cposture/vim-syntastic-generator'
call plug#end()
"############################################### end vim-plug ##################################





"############################################### begin common-conf #############################
"=========================================
" 键盘配置
"=========================================
"设置快捷键的前缀
let mapleader = "\<Space>"
"可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set mouse=a
" CTRL + LEFT 打开 buffer 文件列表下个文件
nnoremap <C-LEFT> :bn<CR>
" CTRL + RIGHT 打开 buffer 文件列表上个文件
nnoremap <C-RIGHT> :bp<CR>
" CTRL + N 打开下一个 tab
nnoremap <C-N> :tabn<CR>
" CTRL + P 打开上一个 tab
nnoremap <C-P> :tabp<CR>
"tags 跳转，ctrl+左键跳转，且当前行移动到屏幕的顶部
nnoremap <C-LeftMouse> <C-]>zt<CR>
"可视模式 Ctrl + C 选择复制到系统剪贴板
vnoremap <silent> <C-c> "+y<CR>:wviminfo! ~/.viminfo<CR>
"可视模式 CTRL + X 剪切到系统剪贴板
vnoremap <silent> <C-X> "+x<CR>:wviminfo! ~/.viminfo<CR>
"插入模式 CTRL + V 粘贴到系统剪贴板
inoremap <silent> <C-V> :rviminfo! ~/.viminfo<CR>"+p<CR>
"命令模式 CTRL + V 粘贴到系统剪贴板
cnoremap <C-V> <C-R>+<CR>
"Pasting blockwise and linewise selections is not possible in Insert and
" Visual mode without the +virtualedit feature.  They are pasted as if they
" were characterwise instead.
" Uses the paste.vim autoload script.
exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']
"可视模式 CTRL-d vim 和 shell 来回切换
nnoremap <C-d> :shell<CR>
"leader z 最大化或恢复当前窗口
function! Zoom ()
    " check if is the zoomed state (tabnumber > 1 && window == 1)
    if tabpagenr(') > 1 && tabpagewinnr(tabpagenr(), ') == 1
        let l:cur_winview = winsaveview()
        let l:cur_bufname = bufname('')
        tabclose

        " restore the view
        if l:cur_bufname == bufname('')
            call winrestview(cur_winview)
        endif
    else
        tab split
    endif
endfunction
nnoremap <leader>z :call Zoom()<CR>
"=========================================
" 语言配置
"=========================================
"编码
set termencoding=utf-8
set encoding=utf8
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030
" python tab 长度为 4
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
" 开启文件类型检查，这将触发FileType事件，该事件可用于设置语法突出显示，设置选项等
filetype on
" 开启文件类型插件，会在'runtimepath'中加载文件“ftplugin.vim”
filetype plugin on
" 开启文件类型缩进，会在'runtimepath'中加载文件“indent.vim”
filetype indent on
"将输入的TAB自动展开成空格。开启后要输入TAB，需要Ctrl-V<TAB>
set expandtab
"使用每层缩进的空格数
set shiftwidth=4
"编辑时一个TAB字符占多少个空格的位置
set tabstop=4
"方便在开启了et后使用退格（backspace）键，每次退格将删除X个空格
set softtabstop=4
" 使回格键（backspace）正常处理indent(缩进位置), eol(行结束符), start(段首), 很奇怪 Vim 默认竟然不允许在这些地方使用 backspace
set backspace=indent,eol,start
"开启时，在行首按TAB将加入 shiftwidth 个空格，否则加入 tabstop 个空格
set smarttab
"设置光标超过 78 列的时候折行
set tw=78
"不在单词中间断行，如果一行文字非常长，无法在一行内显示完的话，它会在单词与单词间的空白处断开
"尽量不会把一个单词分成两截放在两个不同的行里
set lbr
"打开断行模块对亚洲语言支持
"m 表示允许在两个汉字之间断行，即使汉字之间没有出现空格
"B 表示将两行合并为一行的时候，汉字与汉字之间不要补空格
set fo+=mB
"显示括号配对情况。打开这个选项后，当输入后括号(包括小括号、中括号、大括号) 的时候，光标会跳回前括号片刻，然后跳回来，以此显示括号的配对情况
"带有如下符号的单词不要被换行分割
set iskeyword+=$,@,%,#,-,_
set sm
"缩进方式，每一行都和前一行有相同的缩进量，当遇到右花括号（}）等，则取消缩进形式
"set smartindent
"缩进方式，用C语言的缩进格式来处理程序的缩进结构
set cindent
"设置当文件被改动时自动载入
set autoread
"当你编辑下一个文件的时候，目前正在编辑的文件如果改动，将会自动保存
set autowrite
"tags 配置
set tags=tags;
"输出时只有文件名，不带./ ../等目录前缀(默认了执行％在当前的目录下)
set autochdir 
"禁止生成临时文件
set noundofile
set nobackup
set noswapfile
"搜索忽略大小写
set ignorecase
augroup file_type
    autocmd!
    "为特定后缀的文件设置文件类型
    autocmd BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn}   set filetype=mkd
    autocmd BufRead,BufNewFile *.{go}   set filetype=go
    autocmd BufRead,BufNewFile *.{js}   set filetype=javascript
    autocmd BufRead,BufNewFile *.{htm}   set filetype=html
augroup END
"=========================================
" 显示配置
"=========================================
if has("gui_running")
    au GUIEnter * simalt ~x " 窗口启动时自动最大化
    set guioptions-=m " 隐藏菜单栏
    set guioptions-=T " 隐藏工具栏
    set guioptions-=L " 隐藏左侧滚动条
    set guioptions-=r " 隐藏右侧滚动条
    set guioptions-=b " 隐藏底部滚动条
    "set showtabline=0 " 隐藏Tab栏
endif
"打开 vim 语法高亮
syntax on
"在命令模式下使用 Tab 自动补全的时候，将补全内容使用一个漂亮的单行菜单形式显示出来
set wildmenu
"指定在选择文本时，光标所在位置也属于被选中的范围。如果指定 selection=exclusive 的话，可能会出现某些文本无法被选中的情况
set selection=inclusive
"选择字符，使用鼠标时或 shift+特殊键时进入选择模式
set selectmode=mouse,key
"当右键单击窗口的时候，弹出快捷菜单, GUI
set mousemodel=popup
"256位色
set t_Co=256
"高亮光标所在行
set cul
"高亮光标所在列
set cuc
"显示行号
set number
"历史记录数
set history=1000
"在屏幕右下角显示未完成的指令输入，有时候我们输入的命令不是立即生效的，它会稍作等待，等候你是否输入某种组合指令 
set showcmd
"光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3
"光标移动的距离
set scroll=1
"高亮显示匹配的括号
set showmatch
"匹配括号高亮的时间（单位是十分之一秒）
set matchtime=1
"显示状态栏
set laststatus=2
"突出显示当前行
set cursorline
"设置魔术
set magic
"打开搜索高亮模式，若搜索找到匹配项就高亮显示所有匹配项
set hlsearch
"打开增量搜索模式，Vim 会即时匹配你当前输入的内容，这样会给你更好的搜索反馈
set incsearch
"语言设置
set langmenu=zh_CN.UTF-8
"如果有，就使用vim 中文帮助文档
set helplang=cn
"设置命令行的高度
set cmdheight=1
"menu:匹配多于一个使用弹框显示补全，longest:不懂
set completeopt=longest,menu
"在处理未保存或只读文件的时候，弹出确认
set confirm
"使用 :commands 命令模式时总是报告修改的行数
set report=0
" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\ 
augroup vimrcEx
    "当打开一个文件，跳到上次光标所在位置
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \   exe "normal g`\"" |
                \ endif
    " quickfix 模式
    autocmd FileType c,cpp noremap <buffer> <leader><space> :w<cr>:make<cr>
augroup END

"=========================================
" vim omnicompletion 配置
"=========================================
"OmniCppComplete 是根据 Ctags 生成的索引文件进行补全
"开启各种语言的补全
autocmd FileType java setlocal omnifunc=javacomplete#Complete
autocmd FileType cs setlocal omnifunc=OmniSharp#Complete
autocmd FileType python set omnifunc=python3complete#Complete
autocmd FileType JavaScript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"############################################### end common-conf ###############################






"############################################### begin 所有插件配置 #############################
"=========================================
" CurtineIncSw.vim 插件配置
"=========================================
"CTRL + R 头文件源文件来回切换
noremap <C-R> :call CurtineIncSw()<CR>

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
noremap <C-R> :call CurtineIncSw()<CR>

"=========================================
" YCM-Generator 插件配置
"=========================================
" ctrl-I 自动生成 .ycm_extra_conf.py 文件
noremap <C-I> :YcmGenerateConfig -c g++ -v -x c++ -m /usr/bin/make -f -b make .<CR>

"=========================================
" molokai 插件配置
"=========================================
"设置背景主题
color molokai

"=========================================
" vim-colors-solarized 插件配置
"=========================================
"syntax enable
"set background=dark
"colorscheme solarized

"=========================================
" tagbar 插件配置，依赖 ctags
"=========================================
" F9 展示类/方法/变量相关侧边栏
nnoremap <F9> :TagbarToggle<CR>
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
" NERDTree 插件配置
"=========================================
"打开树形目录
noremap <F3> :NERDTreeToggle<CR>
inoremap <F3> <ESC> :NERDTreeToggle<CR>
noremap <F4> :NERDTreeFind<CR>
inoremap <F4> <ESC> :NERDTreeFind<CR>
augroup vimrcEx-NERDTree
    "只剩 NERDTree 时自动关闭
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
augroup END

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

"=========================================
" vim-matchup 插件配置
"=========================================

"=========================================
" SimpylFold 插件配置
"=========================================
"在折叠文本中预览 python docstring
let g:SimpylFold_docstring_preview = 1

"=========================================
" supertab 插件配置
"=========================================
"记住上次的补全方式，直到按ESC退出插入模式为止;
let g:SuperTabRetainCompletionType = 2
"把omni补全设置成tab键
let g:SuperTabDefaultCompletionType="<C-X><C-O>"

"=========================================
" FlyGrep 插件配置
"=========================================
nnoremap <C-F> :FlyGrep<CR>

"=========================================
" nerdtree-git-plugin 插件配置
"=========================================
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

"=========================================
" vim-signify 插件配置
"=========================================
" 设置要检查的VCS
let g:signify_vcs_list = ['git', 'svn']
" 插入模式下指定updatetime时间后无操作将缓存区交换文件写入磁盘
let g:signify_cursorhold_insert     = 1
" 正常模式下指定updatetime时间后无操作将缓存区交换文件写入磁盘
let g:signify_cursorhold_normal     = 1
" 缓冲区被修改时更新符号
let g:signify_update_on_bufenter    = 0
" vim获取焦点时更新符号
let g:signify_update_on_focusgained = 1
"仅为当前缓冲区打开插件
nnoremap <leader>gt :SignifyToggle<CR>
" 键盘映射
nnoremap <leader>gt :SignifyToggle<CR>
nnoremap <leader>gh :SignifyToggleHighlight<CR>
nnoremap <leader>gr :SignifyRefresh<CR>
nnoremap <leader>gd :SignifyDebug<CR>
" hunk jumping
nnoremap <leader>gj <plug>(signify-next-hunk)
nnoremap <leader>gk <plug>(signify-prev-hunk)
" hunk text object
onoremap ic <plug>(signify-motion-inner-pending)
xnoremap ic <plug>(signify-motion-inner-visual)
onoremap ac <plug>(signify-motion-outer-pending)
xnoremap ac <plug>(signify-motion-outer-visual)

"=========================================
" bufferhint 插件配置
"=========================================
"buffer 排序规则，0: sort by path，1: sort by LRU
let g:bufferhint_SortMode=0
" - 快捷键打开缓冲区列表，再按一下关闭
nnoremap - :call bufferhint#Popup()<CR>
" 切回上一个缓冲区
nnoremap \ :call bufferhint#LoadPrevious()<CR>

"=========================================
" vim-python-pep8-indent 插件配置
"=========================================
let g:python_pep8_indent_hang_closing = 1
let g:python_pep8_indent_multiline_string = -2

"############################################### end 所有插件配置 ###############################
