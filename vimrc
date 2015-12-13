" Setup stuff for Vundle
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" uncomment the below to pass a path where vundle should install plugins
" call vundle#begin('~/some/path/here')

" let vundle manage vundle
"
" Add plugins below this line
Plugin 'gmarik/Vundle.vim'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'altercation/vim-colors-solarized'

" Colors and the logic to change them
Plugin 'scrooloose/nerdtree'
Plugin 'jnurmine/Zenburn'
" Add plguins above this line

call vundle#end()
filetype indent plugin on "identify file types

syntax enable
set background=dark
colorscheme solarized


" Python specific stuff here
au BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79
au BufNewFile,BufRead *.py set expandtab autoindent fileformat=unix encoding=utf-8 foldmethod=indent foldlevel=99
autocmd FileType python set autoindent
let python_highlight_all=1
set number "line numbers


"NERDTree related commands for easy file browsing IN vim. The autocmds should
"start it on load, but otherwise, type Nerd to start it
command Nerd NERDTree "easier to type
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore pyc files and stuff in your home dir
map <C-n> :NERDTreeToggle<CR> " use control+n to hide/unhide nerdtree 

"auto commenting. when in normal mode, press ,cc to comment, ,cu to uncomment.
"works for block text, that's actually why this is here.
autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>
