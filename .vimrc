" Robert's .vimrc

set nocompatible
filetype off
set encoding=UTF-8
set nobk
set noswapfile
syntax on  
set number

" Allow backspace in insert mode
set backspace=indent,eol,start

" Don't wake up system with blinking cursor
let &guicursor = &guicursor . ",a:blinkon0"

" set font for GUI vim
set guifont=Consolas:h15

" Show matching parenthesis/brace/bracket
set showmatch

" Ignore case when searching and other improvements
set ignorecase
set smartcase
" set incsearch

" No beeps! This is for you, Danny!
set noerrorbells

" Auto and smart indent
set ai
set si

" Set title in console bar
set title

" Use spaces instead of tabs
" set expandtab

" Be smart when using tabs
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Turn on the ruler
set ruler

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" Begin Vundle
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'ap/vim-css-color'
Plugin 'junegunn/fzf'
Plugin 'frazrepo/vim-rainbow'
Plugin 'tpope/vim-surround'
Plugin 'reedes/vim-pencil'
Plugin 'dbmrq/vim-ditto'
Plugin 'tpope/vim-fugitive'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-rails.git'
Plugin 'w0rp/ale'
Plugin 'dracula/vim'                             

call vundle#end()	
" End Vundle

" Set the color scheme
set termguicolors
set t_Co=256
colorscheme dracula

" Required -- to ignore plugin indent changes, instead use:
" filetype plugin on
filetype plugin indent on 

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" set relativenumber
let g:rehash256 = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Rainbow
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:rainbow_active = 1
let g:rainbow_guifgs = ['FireBrick']
let g:rainbow_ctermfgs = ['magenta']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set noshowmode
set laststatus=2

let g:lightline = {
      \ 'colorscheme': 'dracula',
	  \ 'component_function': {
	  \     'battery': 'battery#component',
	  \ },
	  \ }

" Battery on status line
let g:battery#update_statusline = 1
let g:battery#update_tabline = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Uncomment to autostart the NERDTree
" autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Minimap
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:minimap_show='<leader>mm'
let g:minimap_update='<leader>mu'
let g:minimap_close='<leader>mc'
let g:minimap_toggle='<leader>mt'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
hi LineNr ctermfg=242
hi CursorLineNr ctermfg=15
hi VertSplit ctermfg=8 ctermbg=0
hi Statement ctermfg=3

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mouse Scrolling
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set mouse=a

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Splits and Tabbed Files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitbelow splitright
set path+=**					" Searches current directory recursively.
set wildmenu					" Display all matches when tab complete.
set incsearch

let g:minimap_highlight='Visual'
let g:python_highlight_all = 1

au! BufRead,BufWrite,BufWritePost,BufNewFile *.org 
au BufEnter *.org            call org#SetOrgFileType()

hi Normal ctermbg=none

" Enable Pencil
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd,text,tex call pencil#init()
augroup END

" Toggle certain options for writing mode
autocmd FileType markdown,mkd,text,tex setlocal nonu

" Enable Ditto
autocmd FileType markdown,mkd,text,tex DittoOn
