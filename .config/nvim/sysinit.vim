" Plug-In 시작 (플러그인 설치 경로)
call plug#begin('~/.vim/plugged')

" 설치하고 싶은 플러그인 (예, NERDTree)
Plug 'preservim/nerdtree'
Plug 'preservim/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vhda/verilog_systemverilog.vim'
Plug 'frazrepo/vim-rainbow'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'yggdroot/indentline'

"Plug 'nathanaelkane/vim-indent-guides'
"Plug 'tpope/vim-surround'
"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}


" 플러그인 시스템 초기화
call plug#end()

" NERDTree
let NERDTreeShowHidden=1

" airline font
let g:airline_powerline_fonts = 1
let g:airline_theme='wombat'

" rainbow brackets
let g:rainbow_active = 1

let g:tagbar_type_systemverilog = {
        \ 'ctagstype'   : 'SystemVerilog',
        \ 'kinds'       : [
            \ 'b:blocks:1:1',
            \ 'c:constants:1:0',
            \ 'e:events:1:0',
            \ 'f:functions:1:1',
            \ 'm:modules:0:1',
            \ 'n:nets:1:0',
            \ 'p:ports:1:0',
            \ 'r:registers:1:0',
            \ 't:tasks:1:1',
            \ 'A:assertions:1:1',
            \ 'C:classes:0:1',
            \ 'V:covergroups:0:1',
            \ 'I:interfaces:0:1',
            \ 'M:modport:0:1',
            \ 'K:packages:0:1',
            \ 'P:programs:0:1',
            \ 'R:properties:0:1',
            \ 'T:typedefs:0:1'
        \ ],
        \ 'sro'         : '.',
        \ 'kind2scope'  : {
            \ 'm' : 'module',
            \ 'b' : 'block',
            \ 't' : 'task',
            \ 'f' : 'function',
            \ 'C' : 'class',
            \ 'V' : 'covergroup',
            \ 'I' : 'interface',
            \ 'K' : 'package',
            \ 'P' : 'program',
            \ 'R' : 'property'
        \ },
    \ }


"###########################################################
"   Disable Clipboard for X 
"###########################################################
"set clipboard=exclude:.*
set clipboard=unnamedplus

"	"###########################################################
"	"   VUNDLE 
"	"###########################################################
"	
"	set nocompatible              " be iMproved, required
"	filetype off                  " required
"	
"	" set the runtime path to include Vundle and initialize
"	set rtp+=~/.vim/bundle/Vundle.vim
"	call vundle#begin()
"	" alternatively, pass a path where Vundle should install plugins
"	"call vundle#begin('~/some/path/here')
"	
"	" let Vundle manage Vundle, required
"	Plugin 'VundleVim/Vundle.vim'
"	
"	" The following are examples of different formats supported.
"	" Keep Plugin commands between vundle#begin/end.
"	" plugin on GitHub repo
"	Plugin 'tpope/vim-fugitive'
"	" plugin from http://vim-scripts.org/vim/scripts.html
"	Plugin 'L9'
"	" Git plugin not hosted on GitHub
"	Plugin 'git://git.wincent.com/command-t.git'
"	" git repos on your local machine (i.e. when working on your own plugin)
"	Plugin 'file:///home/gmarik/path/to/plugin'
"	" The sparkup vim script is in a subdirectory of this repo called vim.
"	" Pass the path to set the runtimepath properly.
"	Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"	" Avoid a name conflict with L9
"	Plugin 'user/L9', {'name': 'newL9'}
"	
"	Plugin 'The-NERD-tree'
"	Plugin 'NERD_Tree-and-ack'
"	Plugin 'AutoComplpop'
"	Plugin 'AutoClose'
"	
"	" All of your Plugins must be added before the following line
"	call vundle#end()            " required
"	filetype plugin indent on    " required
"	" To ignore plugin indent changes, instead use:
"	"filetype plugin on
"	"
"	" Brief help
"	" :PluginList       - lists configured plugins
"	" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
"	" :PluginSearch foo - searches for foo; append `!` to refresh local cache
"	" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"	"
"	" see :h vundle for more details or wiki for FAQ
"	" Put your non-Plugin stuff after this line


"###########################################################
"   BASIC 
"###########################################################
set ts=4          "tapstop
set et            "expandtab
set ai            "autoindent
set cindent
set si            "smartindent
set sw=4          "shiftwidth    "width of smartindent

set nowrap
set ic            "ignorecase
"set nowrapscan
set paste

let g:loaded_logipat = 1   "Disable LogiPat plugin for use the Exploer command through shortcut ':E'

"###########################################################
"   DISPLAY
"###########################################################
"set visualbell
set nu            "number
set hlsearch
set ruler
set title
set wmnu          "display autocomplete list
set sm            "showmatch
set mps+=<:>      "add to showmatch pattern '<', '>' 
set ls=2          "always display status line
sy enable
"set list listchars=tab:\|\ 


function! HLNext()
  let l:higroup = matchend(getline('.'), '\c'.@/, col('.')-1) == col('.')
              \ ? 'SpellRare' : 'ErrorMsg'
"              \ ? 'SpellRare' : 'IncSearch'
"              \ ? 'ErrorMsg' : 'IncSearch'
  let b:cur_match = matchadd(l:higroup, '\c\%#'.@/, 101)
  redraw
  augroup HLNext
    autocmd CursorMoved <buffer>
                \   execute 'silent! call matchdelete('.b:cur_match.')'
                \ | redraw
                \ | autocmd! HLNext
  augroup END
endfunction
nnoremap <silent> * *:call HLNext()<CR>
nnoremap <silent> # #:call HLNext()<CR>
nnoremap <silent> n n:call HLNext()<cr>
nnoremap <silent> N N:call HLNext()<cr>


"###########################################################
"   COLOR 
"###########################################################
"colorscheme koehler
"colorscheme CodeSchool3
set termguicolors
 
set bg=dark
"/usr/share/vim/vim74/colors/koehler.vim

hi Search term=reverse ctermfg=white ctermbg=red guifg=Black guibg=Yellow
hi Cursor ctermbg=Red ctermfg=Green guifg=Green guibg=Red

"hi DiffAdd      ctermfg=NONE          ctermbg=Green
"hi DiffChange   ctermfg=NONE          ctermbg=NONE
"hi DiffDelete   ctermfg=LightBlue     ctermbg=Red
"hi DiffText     ctermfg=Yellow        ctermbg=Red

"hi DiffAdd      gui=none    guifg=NONE          guibg=#bada9f
"hi DiffChange   gui=none    guifg=NONE          guibg=#e5d5ac
"hi DiffDelete   gui=bold    guifg=#ff8080       guibg=#ffb0b0
"hi DiffText     gui=none    guifg=NONE          guibg=#8cbee2

"###########################################################
"   CURSOR AIM
"###########################################################
hi CursorLine	  term=bold  cterm=none ctermbg=blue  guibg=#444444 
hi CursorColumn	  term=bold  cterm=none ctermbg=blue  guibg=#444444 

augroup CursorLine
	au!
	au InsertEnter * setlocal cursorline
	au InsertLeave * setlocal nocursorline
augroup END

augroup CursorColumn
	au!
	au InsertEnter * setlocal cursorcolumn
	au InsertLeave * setlocal nocursorcolumn
augroup END

hi StatusLine	ctermfg=white 		ctermbg=darkgray	cterm=bold 
hi StatusLineNC	ctermfg=lightgray	ctermbg=darkgray
hi LineNr		ctermfg=Yellow

"###########################################################
"   KEY MAP
"###########################################################

nnoremap <silent><F2> :NERDTreeToggle<CR><bar>:TagbarToggle <CR>
map <F3> :set paste<CR>
map <F4> :set nopaste<CR>

map <F4> :diffthis<CR>
map <F5> :diffupdate<CR>
map <S-F5> :call IwhiteToggle()<CR>

function! IwhiteToggle()
	if &diffopt =~ 'iwhite'
		set diffopt-=iwhite
	else
		set diffopt+=iwhite
	endif
endfunction

map <F6> zf
map <F7> zo
map <F8> zc
map <F9> :diffoff<CR>

"replace string to zero padded string
map <F11> :%s/^\([0-9]*\)\(\s*\)/\=repeat('0',10-len(submatch(0))).submatch(0)/g

"Remap Ctrl+Space to Ctrl+p, Not working on SSH
inoremap <C-Space> <C-P>


" <Ctrl + h, l> 를 눌러서 이전, 다음 탭으로 이동
nnoremap <silent><C-h> :tabprevious<CR>
nnoremap <silent><C-l> :tabnext<CR>


vmap <LeftRelease> "*ygv
vmap <RightRelease> p
