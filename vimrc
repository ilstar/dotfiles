" 设置启动位置及窗口大小
" winpos 200 102
set lines=40 columns=140
" 选择高亮方案
colorscheme railscasts
"语法样式开启
syntax on
set nocompatible
filetype plugin indent on
"设置字体大小
set guifont=Monaco:h18
" set guifont=Monaco\ 14
"设置缩进
set sw=2
set ts=2
set softtabstop=2
set expandtab
"显示行号（否：nonumber）
set number
"显示光标的坐标
set ruler
"不自动换行(否：wrap)
set nowrap
"在输入括号时光标会短暂地跳到与之相匹配的括号处，不影响输入
set showmatch
" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=1
" 搜索高亮
set hlsearch
"设置编码
set enc=utf-8
"设置文件编码
set fenc=utf-8
"设置文件编码检测类型及支持格式
set fencs=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
"开启命令显示
set showcmd
" 当文件发生变化时，自动读取最新的内容
set autoread

"隐藏菜单栏
set guioptions-=m
"隐藏工具栏
set guioptions-=T

" 设置窗口标题，主要是最后一个方法的使用，显示当前buffer所在目录，其实就是项目目录
set titlestring=%(\ %M%)\ %{expand(\"%:f\")}%(\ %a%)\ -\ %{getcwd()}

"设置F2呼出菜单栏
function! ToggleMenuBar()
	echo "ToggleMenuBar"
	if &guioptions =~# 'm'
		set guioptions-=m
	else
		set guioptions+=m
	endif
endfunction
imap <silent> <C-F12> <C-O>:call ToggleMenuBar()<CR>
map <silent> <C-F12> :call ToggleMenuBar()<CR>

"括号补全
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {}<ESC>i
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap < <><ESC>i
:inoremap > <c-r>=ClosePair('>')<CR>

inoremap ' ''<esc>:let leavechar="'"<cr>i
inoremap " ""<esc>:let leavechar='"'<cr>i

function ClosePair(char)
  if getline('.')[col('.') - 1] == a:char
    return "\<Right>"
  else
    return a:char
  endif
endf

" NERDTree插件的快捷键
imap <silent> <F7> <esc>:NERDTreeToggle<CR>
nmap <silent> <F7> :NERDTreeToggle<CR>
" BufExplorer 快捷键
imap <silent> <F2> <esc>:BufExplorer<CR>
nmap <silent> <F2> :BufExplorer<CR>

" ctrl + s
imap <C-s> <esc>:w<CR>:echo expand("%f") . " saved."<CR>
vmap <C-s> <esc>:w<CR>:echo expand("%f") . " saved."<CR>
nmap <C-s> :w<CR>:echo expand("%f") . " saved."<CR>
imap <C-s> <esc>:w<CR>:echo expand("%f") . " saved."<CR>

" 切换标签
map <D-1> :tabn 1<CR>
map <D-2> :tabn 2<CR>
map <D-3> :tabn 3<CR>
map <D-4> :tabn 4<CR>
map <D-5> :tabn 5<CR>
map <D-6> :tabn 6<CR>
map <D-7> :tabn 7<CR>
map <D-8> :tabn 8<CR>
map <D-9> :tabn 9<CR>

map! <D-1> <C-O>:tabn 1<CR>
map! <D-2> <C-O>:tabn 2<CR>
map! <D-3> <C-O>:tabn 3<CR>
map! <D-4> <C-O>:tabn 4<CR>
map! <D-5> <C-O>:tabn 5<CR>
map! <D-6> <C-O>:tabn 6<CR>
map! <D-7> <C-O>:tabn 7<CR>
map! <D-8> <C-O>:tabn 8<CR>
map! <D-9> <C-O>:tabn 9<CR>

" 当修改snippet脚本后，执行,rr可重新加载脚本，无需重启Vim
function! ReloadSnippets( snippets_dir, ft )
  if strlen( a:ft ) == 0
    let filetype = "_"
  else
    let filetype = a:ft
  endif

  call ResetSnippets()
  call GetSnippets( a:snippets_dir, filetype )
endfunction
nmap ,rr :call ReloadSnippets(snippets_dir, &filetype)<CR>
