set termencoding=utf-8
set fileencoding=utf-8
set encoding=utf-8

set number relativenumber

syntax on

set expandtab
set autoindent
set smartindent

" ステータス行を常に表示
set laststatus=2

set clipboard+=unnamed

inoremap <C-A> <Home>
inoremap <C-E> <End>
inoremap <C-F> <Right>
inoremap <C-B> <Left>
inoremap <C-D> <Del>

inoremap <silent> jj <ESC>


" --- NeoBundle ----
set runtimepath+=~/.vim/bundle/neobundle.vim/

call neobundle#begin(expand('~/.vim/bundle/'))

"neobundle自体をneobundleで管理
NeoBundleFetch 'shougo/neobundle.vim'

" plugin goes here.
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'grep.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'

call neobundle#end()

filetype plugin indent on

" 未インストールのプラグインをインストールするか訪ねてくれる
NeoBundleCheck


" fugitve
autocmd QuickFixCmdPost *grep* cwindow
set statusline+=%{fugitive#statusline()}

