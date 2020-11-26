set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'sukima/xmledit'
Plugin 'scrooloose/nerdtree'
Plugin 'dense-analysis/ale'
Plugin 'itchyny/lightline.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'Yggdroot/indentLine'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'dracula/vim', { 'name': 'dracula' }
Plugin 'tpope/vim-surround'
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'davidhalter/jedi-vim'
Plugin 'ap/vim-css-color'
Plugin 'numirias/semshi'

Plugin 'roxma/nvim-yarp'
Plugin 'ncm2/ncm2'
Plugin 'ncm2/ncm2-bufword'
Plugin 'ncm2/ncm2-path'
Plugin 'ncm2/ncm2-jedi'
Plugin 'ncm2/ncm2-tern',  {'do': 'npm install'}
Plugin 'ncm2/ncm2-cssomni'
Plugin 'ncm2/ncm2-racer'
Plugin 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plugin 'mattn/emmet-vim'
Plugin 'posva/vim-vue'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'rust-lang/rust.vim'
Plugin 'tpope/vim-fugitive'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2017 Sep 20
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
" source $VIMRUNTIME/defaults.vim

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
"if has('syntax') && has('eval')
"  packadd! matchit
"endif

set clipboard=unnamed

autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4
autocmd BufEnter *.vue set filetype=vue

syntax on
syntax enable
let g:lightline = { 'colorscheme': 'one' }
colorscheme dracula
set number
" set relativenumber
set expandtab
set ttyfast
set shiftwidth=4
set showmatch
set nowrap
set undodir =~/.vim/undodir
set undofile
set nobackup
set ignorecase
set smartcase
set incsearch
let python_highlight_all=1
set textwidth=100
set formatoptions-=t

" YCM config
" let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
" let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
" let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
" let g:ycm_complete_in_comments = 1 " Completion in comments
" let g:ycm_complete_in_strings = 1 " Completion in string
" let g:ycm_autoclose_preview_window_after_insertion = 1 " Close preview window when leaving insert mode

" ALE config
" let g:ale_python_pylint_options = '--load-plugins pylint_django'
let g:ale_disable_lsp = 1
let g:ale_lint_delay = 400

nmap <silent> <C-j> :ALENext<cr>
nmap <silent> <C-k> :ALEPrevious<cr>

" Nerdtree config
autocmd vimenter * NERDTree

" Open nerdtree automatically if vim starts with no files
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Open nerdtree automatically when vim starts in a dir
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" Map ctrl-n to nerdtree
map <C-n> :NERDTreeToggle<CR>

" Nerdtree show dotfiles
let NERDTreeShowHidden=1

" Close nerdtree if it is the only window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Lightline config
set laststatus=2

let g:python3_host_prog = '/usr/bin/python3'
" Set vim to look in venv
" python with virtualenv support
"py3 << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
"  project_base_dir = os.environ['VIRTUAL_ENV']
"  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"  exec(open(activate_this).read(), dict(__file__=activate_this))
"EOF

" Enable code folding
set foldmethod=indent
set foldlevel=99

" Simply fold show docstring
let g:SimpylFold_docstring_preview=0
let g:SimpylFold_fold_docstring=0

highlight Folded ctermbg=White ctermfg=Red

" add fzf
set rtp+=~/.fzf

" Map ctrl-p to fzf
map <C-p> :FZF<CR>
map <C-g> :Ag<CR>

set colorcolumn=101

set mouse=
"set ttymouse=

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=c

" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <c-c> <ESC>

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" wrap existing omnifunc
" Note that omnifunc does not run in background and may probably block the
" editor. If you don't want to be blocked by omnifunc too often, you could
" add 180ms delay before the omni wrapper:
"  'on_complete': ['ncm2#on_complete#delay', 180,
"               \ 'ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
au User Ncm2Plugin call ncm2#register_source({
        \ 'name' : 'css',
        \ 'priority': 9,
        \ 'subscope_enable': 1,
        \ 'scope': ['css','scss'],
        \ 'mark': 'css',
        \ 'word_pattern': '[\w\-]+',
        \ 'complete_pattern': ':\s*',
        \ 'on_complete': ['ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
        \ })

" jedi options
let g:jedi#auto_initialization = 1
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#popup_on_dot = 0
let g:jedi#completions_command = ""
let g:jedi#show_call_signatures = "1"
let g:jedi#show_call_signatures_delay = 0
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#show_call_signatures_modes = 'i'  " ni = also in normal mode
let g:jedi#enable_speed_debugging=0
let g:jedi#goto_stubs_command = ""

" map leader to space
let mapleader = " "

map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>
nnoremap <leader>s :wincmd s<CR>
map <leader>v :wincmd v<CR>
map <F3> f,a<CR><Esc>
map <F2> "+y<Esc>
map <F4> "+p<Esc>
map <leader>e <C-Y>,
map <leader>b :Git blame<CR>
map <leader>w :W<CR>

map <leader>f za

nmap =j :%!python -m json.tool<CR>

" Jump to last position in file
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal g`\"" |
            \ endif

" Markdown preview
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 1

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" Enable emmet only for html and css
let g:user_emmet_install_global = 0
autocmd FileType html,htmldjango,css,vue EmmetInstall

let g:vue_pre_processors = 'detect_on_enter'

" Semshi config
" Disable marking the selected variables
let g:semshi#mark_selected_nodes = 1
