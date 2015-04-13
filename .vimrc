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


" --- NeoBundle ----
set runtimepath+=~/.vim/bundle/neobundle.vim/

call neobundle#begin(expand('~/.vim/bundle/'))

"neobundle自体をneobundleで管理
NeoBundleFetch 'shougo/neobundle.vim'

" plugin goes here.

call neobundle#end()

filetype plugin indent on

" fugitve
NeoBundle 'tpope/vim-fugitive'
autocmd QuickFixCmdPost *grep* cwindow
set statusline+=%{fugitive#statusline()}

" surround.vim
NeoBundle 'tpope/vim-surround'

" NERDTree
NeoBundle 'scrooloose/nerdtree'

" Unite.vim
NeoBundle 'Shougo/unite.vim'

" grep.vim
NeoBundle 'grep.vim'

" 未インストールのプラグインをインストールするか訪ねてくれる
NeoBundleCheck
