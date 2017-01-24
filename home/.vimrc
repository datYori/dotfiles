"=== Some defaults
set nocompatible
syntax on
set hidden
set history=1000
set title
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set ruler
set shortmess=atI
set backspace=indent,eol,start " better backspace
set scrolloff=5
set mouse=a
set number
set cursorline          " highlight current line
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
set matchtime=0

"=== Search
set hlsearch
set incsearch
set ignorecase
set smartcase

"=== Leader shortcuts
let mapleader=","
" unhighlight search
nmap <silent> <leader>n :silent :nohlsearch<CR>
" spellcheck
nmap <Leader>c :setlocal spell!<CR>

"=== Smart indenting
set tabstop=4    " Set the default tabstop
set softtabstop=4
set shiftwidth=4 " Set the default shift width for indents
set expandtab   " Make tabs into spaces (set by tabstop)
set smarttab " Smarter tab levels
set autoindent
set cindent
set cinoptions=:s,ps,ts,cs
set cinwords=if,else,while,do,for,switch,case
set wildignore+=*.pyc,*/venv/*,*/s/*


"=== Shortcuts
set pastetoggle=<F3>
map <F4> :source ~/.vimrc<CR>
map <F5> :edit ~/.vimrc<CR>
map <F6> :! subl %<CR><CR>
map <F7> gg"*yG
cmap w!! w !sudo tee % >/dev/null

" \s for seeing tabs spaces
nmap <silent> <leader>s :set nolist!<CR>

"=== Vundle
filetype off                   " required!
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" Rails
Plugin 'tpope/vim-rails.git'
Plugin 'tpope/vim-bundler.git'
Plugin 'tpope/vim-endwise'

Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

Plugin 'scrooloose/nerdtree.git'
map <F2> :NERDTreeToggle<CR>
" close when no other windows
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"Markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
let g:vim_markdown_frontmatter=1
let g:vim_markdown_folding_disabled=1

Plugin 'groenewege/vim-less'
Plugin 'nono/vim-handlebars'
au BufRead,BufNewFile *.handlebars,*.hbs,*.hjs set ft=handlebars
Plugin 'matchit.zip'

Plugin 'nginx.vim'
au BufRead,BufNewFile /etc/nginx/* set ft=nginx

" Ctrl+P search
Plugin 'kien/ctrlp.vim'
" ignore .gitignore files
let g:ctrlp_user_command = 'find %s -type f | grep -v "`cat .gitignore`" | grep -v ".git"'


Plugin 'Lokaltog/vim-powerline'
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs
set t_Co=256 " Terminal colors

" Syntax errors
Plugin 'scrooloose/syntastic'
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
let g:syntastic_python_python_exec = '/usr/local/bin/python3'
let g:syntastic_ignore_files = ['\.py$', '\.js$']
map <F9> :SyntasticToggleMode<CR>

" Working with Django
Plugin 'django.vim'
Plugin 'pydoc.vim'

" Pysmell Autocompletion for Python
autocmd FileType python setlocal omnifunc=pysmell#Complete

" C++ compile and run
Plugin 'xuhdev/SingleCompile'
map <silent> <F9> :SCCompileRunAF -std=c++11 <CR>

" Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"

" Comments
Plugin 'scrooloose/nerdcommenter'

" Jekyll
Plugin 'itspriddle/vim-jekyll'

" Solarized color scheme
Plugin 'altercation/vim-colors-solarized'


call vundle#end()
filetype plugin indent on

" Solarized stuff
syntax enable
set background=dark
silent! colorscheme solarized

" Local settings
if filereadable(glob("~/.vimrclocal")) 
  source ~/.vimrclocal
endif
