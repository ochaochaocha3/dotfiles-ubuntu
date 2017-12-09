" vim: filetype=vim

" neobundle.vim によるプラグイン管理
if has('vim_starting')
  set nocompatible " Be iMproved
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
  \     'windows' : 'make -f make_mingw32.mak',
  \     'cygwin' : 'make -f make_cygwin.mak',
  \     'mac' : 'make -f make_mac.mak',
  \     'unix' : 'make -f make_unix.mak',
  \    },
  \ }

NeoBundle 'thinca/vim-quickrun'

let g:quickrun_config = {
\   '_': {
\     'runner': 'vimproc',
\     'runner/vimproc/updatetime': 60
\   },
\   'tex': {
\        'command': 'latexmk',
\        'exec': ['%c -gg -pdfdvi %s', 'xdg-open %s:r.pdf']
\   },
\}

NeoBundle 'sudo.vim'

" 日本語ドキュメント
" インストールしても表示できない場合は以下を実行する
" :helptags ~/.vim/bundle/vimdoc-ja/doc
NeoBundle 'vim-jp/vimdoc-ja'

NeoBundle 'lilydjwg/fcitx.vim'

NeoBundle 'bling/vim-airline'
set laststatus=2

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'majutsushi/tagbar'

NeoBundle 'othree/eregex.vim'
nnoremap / :M/
nnoremap ? :M?
nnoremap ,/ /
nnoremap ,? ?

NeoBundle 'thinca/vim-qfreplace'

NeoBundle 'tomasr/molokai'

NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'ngmy/vim-rubocop'
NeoBundle 'othree/html5.vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'JavaScript-syntax'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'vim-scripts/mediawiki.vim'

NeoBundle 'Shougo/neocomplete.vim'
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions'
      \ }
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
 return neocomplete#close_popup() . "\<CR>"
 " For no inserting <CR> key.
 " "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplete#close_popup()
inoremap <expr><C-e> neocomplete#cancel_popup()
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

call neobundle#end()

filetype plugin indent on " Required!

" Installation check.
NeoBundleCheck

" ここまで：neobundle.vim によるプラグイン管理

" マウスを有効にする
set mouse=a

" タブ・インデント
set tabstop=4
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent
set backspace=indent,eol,start

" 表示
set wrap
set showcmd
set wildmenu
set number
set ruler
set list
set listchars=tab:>-,trail:-,eol:$,extends:>,precedes:<,nbsp:%
set hlsearch "検索結果のハイライト。消すときは :nohl で。
" □や○があってもカーソル位置がずれないようにする
set ambiwidth=double
colorscheme molokai
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

" クリップボードを使用可能にする
set clipboard=unnamedplus

let g:tex_flavor = 'latex'

" カレントディレクトリ移動
command! CD call s:CDToFileDir()

function! s:CDToFileDir()
  lcd %:p:h
  pwd
endfunction
