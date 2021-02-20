set nocompatible
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=2000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set visualbell                  "No sounds
set t_vb=
set autoread                    "Reload files changed outside vim
set nofoldenable                "dont fold by default
set scrolloff=4                 "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1
set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
"set laststatus=2
set hidden
nnoremap <F12> :set invpaste paste?<CR>
set pastetoggle=<F12>
let mapleader=","
set wa
set ruler
set whichwrap+=<,>
set showmatch
colorscheme desert
set background=dark
"set wildmenu
"set noswapfile
"set nobackup

map <silent> <leader>ss :source ~/.vimrc<cr>

syntax on

function! OnLoadSrc ()
    set number                      "Line numbers are good
    set autoindent
    set smarttab
    set expandtab
endfunction

function! OnLoadC ()
    call OnLoadSrc()
    set shiftwidth=4
    set softtabstop=4
    set tabstop=4
endfunction

function! OnLoadVue ()
    call OnLoadSrc()
    set shiftwidth=2
    set softtabstop=2
    set tabstop=2
endfunction

function! OnLoadHTMLJS ()
    call OnLoadSrc()
    set shiftwidth=2
    set softtabstop=2
    set tabstop=2
    set linebreak    "Wrap lines at convenient points
endfunction

function! OnLoadMarkdown ()
    set autoindent
    set smarttab
    set shiftwidth=4
    set tabstop=4
    set tw=72
endfunction

"set nowb
filetype on
filetype plugin on
filetype indent on
set list listchars=tab:\ \ ,trail:·
"set nowrap       "Don't wrap lines

autocmd FileType c,cpp,css,java,python,sh,vim call OnLoadC()
autocmd FileType vue call OnLoadVue()
autocmd FileType javascript,html call OnLoadHTMLJS()
autocmd FileType markdown call OnLoadMarkdown()

function! CheckPlug ()
    if !filereadable(glob("~/.vim/plugged/plug.vim"))
        ! mkdir -p ~/.vim/plugged ; wget --no-check-certificate -O ~/.vim/plugged/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    endif
    source ~/.vim/plugged/plug.vim
endfunction

call CheckPlug()

call plug#begin('~/.vim/plugged')
Plug 'git://github.com/tpope/vim-surround.git'
Plug 'posva/vim-vue'
Plug 'lervag/vimtex'
call plug#end()

function! InstallYCM ()
    ! cd ~/.vim/plugged/YouCompleteMe ; ./install.py --clang-completer
endfunction

function! UploadConf ()
    ! scp ~/.vimrc wagner:public_html/myvimrc
endfunction

function! DownloadConf ()
    ! mkdir -p ~/.vim
    ! cp ~/.vimrc ~/.vimrc-old
    ! wget -O ~/.vimrc http://www.wdong.org/~wdong/myvimrc
    source ~/.vimrc
    :PlugInstall
endfunction

if has('gui')

set guifont=Source\ Code\ Pro\ 20

endif

