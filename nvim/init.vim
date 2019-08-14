" vim: filetype=vim

"dein Scripts-----------------------------
if &compatible
  " Be iMproved
  set nocompatible
endif

" Required:
set runtimepath+=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.config/nvim/dein')
  call dein#begin('~/.config/nvim/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.config/nvim/dein/repos/github.com/Shougo/dein.vim')

  call dein#load_toml('~/.config/nvim/plugins.toml', {})

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

" マウスを有効にする
set mouse=a

" 編集
set tabstop=4
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent
set cinoptions=:0,g0,(1s,m1,j1,J1
set backspace=indent,eol,start
set inccommand=split

" 句読点を「，．」に置換する
nnoremap <Leader>p :silent! %s/、/，/g<CR>:silent! %s/。/．/g<CR>

" TeXのインデント設定
let g:tex_indent_brace=0
let g:tex_indent_items=0

" 表示
colorscheme molokai

set wrap
set showcmd
set number
set ruler
set list
set listchars=tab:>-,trail:-,eol:$,extends:>,precedes:<,nbsp:%
set hlsearch "検索結果のハイライト。消すときは :nohl で。
" □や○があってもカーソル位置がずれないようにする
set ambiwidth=double
set wildmenu
syntax on

" 文字コード
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=iso-2022-jp,utf-8,cp932,euc-jp,default,latin
set nobomb
nnoremap ,U :set encoding=utf-8<CR>
nnoremap ,E :set encoding=euc-jp<CR>
nnoremap ,S :set encoding=cp932<CR>

" j、k ではカーソルを表示行で移動する。物理行移動は <C-n>、<C-p>。
nnoremap <Down> gj
nnoremap <Up> gk
nnoremap j gj
nnoremap k gk

" カレントディレクトリ移動
command! CD call s:CDToFileDir()

function! s:CDToFileDir()
  lcd %:p:h
  pwd
endfunction
