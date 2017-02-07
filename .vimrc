set termencoding=utf-8
set fileencoding=utf-8
set encoding=utf-8

set number relativenumber

syntax on

set expandtab   " タブを空白に変換する
set autoindent  " インデントをいい感じに
set smartindent " インデントをいい感じに

" ステータス行を常に表示
set laststatus=2

" ヤンクをクリップボードを使う
set clipboard+=unnamed

" インサートモード時にはEmacs的な移動をする
inoremap <C-A> <Home>
inoremap <C-E> <End>
inoremap <C-F> <Right>
inoremap <C-B> <Left>
inoremap <C-D> <Del>

" インサートモード時にjjでノーマルモードに戻る
inoremap <silent> jj <ESC>


"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/yusukekokubo/.vim/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/yusukekokubo/.vim/dein')
  call dein#begin('/Users/yusukekokubo/.vim/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/yusukekokubo/.vim/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-rails')
  call dein#add('Shougo/neocomplete.vim')

  " You can specify revision/branch/tag.
  call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------

