" ==========================================================================
" Basic Formatting  ---------------------------------------------------------------- 
" ==========================================================================

" Set shift width to 4 spaces.
set shiftwidth=4

" Set tab width to 4 columns.
set tabstop=4

" Use space characters instead of tabs.
set expandtab

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap

" Turn syntax highlighting on.
syntax on

" Add numbers to each line on the left-hand side.
set number

"--------------------------------------------------------------------------

" Show the mode you are on the last line.
set showmode

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Set the commands to save in history default number is 20.
set history=1000

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Make hypenated words considered one tab stop
set iskeyword+=-          

" ==========================================================================
" Search ---------------------------------------------------------------- 
" ==========================================================================

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" ==========================================================================
" Custom Mapleader keys ---------------------------------------------------------------- 
" ==========================================================================
let mapleader = ','

" Enter key - creates newline wihtout insert mode
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" VIM WINDOW LAYOUT AND NAVIGATION
" Jumping between split windows, instead of ctrl-w-w just do ctrl-j to jump
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Copy and Paste from OSX clipboard
vmap <Leader>y y:call system("pbcopy", getreg("\""))<CR>
nmap <Leader>p :call setreg("\"",system("pbpaste"))<CR>p

" open current file in browser
nnoremap <Leader>ob :!open %<Enter>

" Auto close brackets and use control-j to escape out after done typing inside
imap <C-j> <Esc>:exec "normal f" . leavechar<CR>a
inoremap ( ()<Esc>:let leavechar=")"<CR>i
inoremap [ []<Esc>:let leavechar="]"<CR>i
inoremap { {}<Esc>:let leavechar="}"<CR>i
inoremap ' ''<Esc>:let leavechar="'"<CR>i
inoremap " ""<Esc>:let leavechar='"'<CR>i

" Nerdtree plugin - shortcut to open/close nerdtree side panel
map <Leader> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


" ==========================================================================
" PLUGINS ---------------------------------------------------------------- 
" ==========================================================================

call plug#begin('~/.vim/plugged')
    Plug 'preservim/nerdtree'
    Plug 'acevery/snipmate-plus'
    Plug 'yuezk/vim-js'
    Plug 'maxmellon/vim-jsx-pretty'
call plug#end()


" ==========================================================================
" Mouse Stuff ---------------------------------------------------------------- 
" ==========================================================================
" resize splits with mouse
set mouse+=a
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif

