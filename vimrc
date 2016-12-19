"call plugin management tools
call pathogen#infect()

set autochdir
set autoindent
set wrap
set tags=tags;

set tabstop=4
set shiftwidth=4
set expandtab
"taglist 
nmap <F4> :Tlist<CR>
let Tlist_Auto_Open=1

filetype plugin indent on
filetype plugin on
syntax on
au BufNewFile,BufRead *.cu set ft=cuda
au BufNewFile,BufRead *.cuh set ft=cuda

"find cscope
let max = 5
let dir = './'
let i = 0
let break = 0
while isdirectory(dir) && i < max
	if filereadable(dir . 'cscope.out') 
		execute 'cs add ' . dir . 'cscope.out'
		let break = 1
	endif
	if break == 1
		execute 'lcd ' . dir
		break
	endif
	let dir = dir . '../'
	let i = i + 1
endwhile

nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-@>i :cs find i <C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>

set nu
" Use vim features - ignore vi compatibility
set nocompatible

" Make sure vim checks for 'set commands' in opened files
set modeline
set modelines=1

" Make the window title reflect the file being edited
set title
set titlestring=VIM:\ %F

" At command line, complete longest common string, then list alternatives.
set wildmode=longest,list

" Automatically insert the current comment leader
" after hitting 'o' or 'O' in Normal mode.
set fo+=o

" Do not automatically insert a comment leader after an enter
set fo-=r

" Do no auto-wrap text using textwidth (does not apply to comments)
set fo-=t

" Turn off the bell
set vb t_vb=

" Enable the mouse
set mouse=v
set mouse+=n
set mouse+=c
set selectmode=

" Set list Chars - for showing characters that are not
" normally displayed i.e. whitespace, tabs, EOL
set listchars=trail:.,tab:>-,eol:$
set nolist

" Show incomplete paragraphs
set display+=lastline

" Turn ruler on
set ruler

" Set horizontal scrolling jump to 10
set sidescroll=10

" Turn off end of line wrapping
set nowrap

" Make sure status line is always visible
set laststatus=2

" Make command line two lines high
set ch=1

" Make the Tab spacing 3 characters wide
set ts=2

" Make the shift width 3 characters wide
set sw=2

" Allow backspace to delete
set bs=2

" Make window height VERY large so they always maximise on window switch
set winheight=9999

" Switch off search pattern highlighting.
set hlsearch

" Turn Brace/Bracket match showing off
set noshowmatch

" Setup backup location and enable
set backupdir=~/backup/vim
set backup
" Set Swap directory

if !exists("*PrintFile")
   function PrintFile(fname)
      call system("lpr -r -PLaserjet " . a:fname)
      return v:shell_error
endfunc
endif

""" Enable 'in-column' up and down motion in INSERT mode on wrapped lines
""imap <silent> <Up>   <C-o>gk
""imap <silent> <Down> <C-o>gj
""
""" Enable 'in-column' up and down motion on wrapped lines
""map <silent> <Up>   gk
""map <silent> <Down> gj
""
""" Map shift up and down to page scrolling
""map <S-Up>   <C-E>
""map <S-Down> <C-Y>

" Folding options
set foldmethod=marker
set foldcolumn=2
set foldtext=MyFoldText()

if !exists("*MyFoldText")
   function MyFoldText()
      let line = getline(v:foldstart)
j      let sub = substitute(line, '/\*\|\*/\|{{{\d\=', '', 'g')
      return "FOLD (" . (v:foldend - v:foldstart) . ")" . sub
   endfunction
endif

" Switch on syntax highlighting.
syntax enable 

" Use colours that work well on a dark background
set background=dark

"color scheme
"colorscheme elflord
"colorscheme darkblue 
"colorscheme evening 
"colorscheme murphy 
"colorscheme torte
colorscheme  desert
"colorscheme morning 
"colorscheme default
"colorscheme solarized 
"colorscheme hhteal 



" auto match"
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {<CR>}<ESC>O
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i

function! ClosePair(char)
 if getline('.')[col('.') - 1] == a:char
     return "\<Right>"
 else
     return a:char
 endif
endfunction

filetype plugin indent on 

let g:neocomplcache_enable_at_startup=1   
let g:neocomplcache_caching_limit_file_size=500000
let g:neocomplcache_tags_caching_limit_file_size = 500000 
let g:neocomplcache_release_cache_time = 900
let g:neocomplcache_enable_auto_select = 1

set guioptions-=T  
set guioptions+=r  
set guioptions-=L  
set guioptions+=m  
set wrap  
set completeopt=longest,menu  

nmap <C-@>q :NeoComplCacheCachingTags<CR><CR>
nmap <C-@>i :NeoComplCacheCachingInclude<CR><CR>
nmap <C-@>a :NeoComplCacheCachingSyntax<CR><CR>

let OmniCpp_ShowPrototypeInAbbr = 1

"tarbar plugin
"nmap <F4> :TagbarToggle<CR>
"let g:tagbar_width = 25"设置宽度，默认为40
"autocmd VimEnter * nested :call tagbar#autoopen(1)    "打开vim时自动打开tagbar
"let g:tagbar_left = 1         "在左侧
""let g:tagbar_right = 1        "在右侧""""""

"NERDTREE plugin"
nmap <F5> :NERDTree<CR>
nmap <F6> :NERDTreeClose<CR>
let g:NERDTredWinSize=15
let g:NERDTreeWinPos="right"

" set for Doxygen.vim 
let g:DoxygenToolkit_authorName="wangyanfei(wangyanfei01@baidu.com)"
let g:DoxygenToolkit_licenseTag="Copyright (C) 2013 Baidu.com, Inc. All Rights Reserved"
let g:DoxygenToolkit_versionString ="--"

" Pathogen load
filetype off
call pathogen#infect()
call pathogen#helptags()

let g:pymode_rope_lookup_project = 0

