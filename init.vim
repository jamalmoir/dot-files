" .vimrc

" PLUGINS
" -------

" vim-plug https://github.com/junegunn/vim-plug - install with :PluginInstall
call plug#begin(stdpath('data') . '/plugged')

" Colour Scheme
Plug 'arcticicestudio/nord-vim', { 'branch': 'develop' }

" Linting and Formating
Plug 'vim-syntastic/syntastic'
Plug 'nvie/vim-flake8'
Plug 'dense-analysis/ale'
Plug 'vim-scripts/indentpython.vim'

" Navigation
" Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Autocomplete
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

call plug#end()

" FZF
set runtimepath+=/usr/local/opt/fzf       " fuzzy file search

nnoremap <C-p> :Files<CR>
nnoremap <C-h> :Hist<CR>
nnoremap gw :Rg <C-R><C-W><CR>

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1
nnoremap <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" NERDTree
" let NERDTreeIgnore=['\.pyc$', '\~$']

" nnoremap <tab> :NERDTreeToggle<CR>
" nnoremap <C-f> :NERDTreeFind<CR>

" Ale
let g:ale_fix_on_save = 1
let g:ale_fixers = {
    \    '*': ['remove_trailing_lines', 'trim_whitespace'],
    \    'javascript': ['eslint', 'prettier'],
    \    'python': ['black', 'isort']
    \}

" Syntastic
let g:syntastic_python_python_exec = 'python3'
let g:syntastic_python_checkers = ['python']


" SETTINGS
" --------

syntax enable                     " show syntax highlighting

" Line Numbers
set number                        " show the current line number
set relativenumber                " show relative line numbers
set ruler                         " show row and column number in footer

" Tabs and Indentation
set autoindent                    " set auto indent
set expandtab                     " use spaces, not tab characters
set tabstop=8                     " set indent to 8 spaces - change softtabstop and shiftwidth not this.
set shiftwidth=2                  " set indent to 2 spaces
set softtabstop=2                 " set indent to 2 spaces

" Searching
set hlsearch                      " highlight all search matches
set incsearch                     " show search results as you type
" when these two are active together case is ignored when all lowercase.
set smartcase                     " pay attention to case when caps are used in searching
set ignorecase                    " ignore case when searching

" Wild Menu
set wildmenu                      " enable bash style tab completion
set wildmode=list:longest,full

" Misc.
set clipboard=unnamed             " use system keyboard
set encoding=utf-8                " ascii? Nope. Shift-jis? Hell no. Let's be sane here.
set visualbell                    " enable visual bell (disable audio bell)
set autoread                      " automatically reload files changed outside of vim, unchanged in vim
set termguicolors                 " enable true colour support
set scrolloff=2                   " minimum lines above/below cursor
set cursorline                    " highlight current line
set nofoldenable                  " disable code folding
set laststatus=2                  " always show status bar
set list listchars=tab:»·,trail:· " show extra space characters
set showmatch                     " show bracket matches
set ttimeoutlen=100               " decrease timeout for faster insert with 'O'
set backspace=indent,eol,start    " more powerful backspacing


" FILETYPE SETTINGS
" -----------------

au BufNewFile,BufRead *.py
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
"   \ set textwidth=99 |  Disabled because of annoying auto new line
    \ set expandtab |
    \ set fileformat=unix |
    \ let python_highlight_all=1

au BufNewFile,BufRead *.js, *.ts, *.tsx, *.svelte, *.html, *.css
    \ set softtabstop=2 |
    \ set shiftwidth=2


" CUSTOM KEYMAPPINGS
" ------------------

" Insert space on spacebar
nnoremap <space> i<space><esc>

" split navigations
" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-L> <C-W><C-L> nnoremap <C-H> <C-W><C-H>


" HIGHLIGHTING
" ------------

" set up some custom colors
highlight ColorColumn  ctermbg=237

" highlight the status bar when in insert mode
if version >= 700
  au InsertEnter * hi StatusLine ctermfg=235 ctermbg=2
  au InsertLeave * hi StatusLine ctermbg=240 ctermfg=12
endif

" highlight trailing spaces in an obnoxious red
highlight ExtraWhitespace ctermbg=1 guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/

" hint to keep lines short
if exists('+colorcolumn')
  set colorcolumn=99
endif


" COLOURSCHEME
" ------------

colorscheme nord
