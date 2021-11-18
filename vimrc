" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Turn syntax highlighting on.
syntax on

" Add numbers to each line on the left-hand side.
" set number

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Highlight cursor line underneath the cursor vertically.
" set cursorcolumn

" Set shift width to 4 spaces.
set shiftwidth=4

" Set tab width to 4 columns.
set tabstop=4

" Use space characters instead of tabs.
set expandtab

" Do not save backup files.
set nobackup

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=1000

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

set ic

set tags=./tags,tags;$HOME

colorscheme molokai
" colorscheme gruvbox

" PLUGINS ---------------------------------------------------------------- {{{

" Plugin code goes here.
call plug#begin('~/.vim/plugged')
" Plug 'dense-analysis/ale'
Plug 'preservim/nerdtree'
" Highligh multiple words
Plug 'inkarkat/vim-ingo-library'
Plug 'inkarkat/vim-mark'

Plug 'morhetz/gruvbox'
Plug 'yegappan/taglist'

call plug#end()

source ~/.vim/plugged/gtags.vim
" source ~/.vim/plugged/gtags-cscope.vim
" }}}


" MAPPINGS --------------------------------------------------------------- {{{

" Mappings code goes here.

" Press the space bar to type the : character in command mode.
nnoremap <space> :

" Center the cursor vertically when moving to the next word during a search.
nnoremap n nzz
nnoremap N Nzz

" Yank from cursor to the end of line.
nnoremap Y y$

" You can split the window in Vim by typing :split or :vsplit.
" Navigate the split view easier by pressing CTRL+j, CTRL+k, CTRL+h, or CTRL+l.
nnoremap <c-k> <c-w>k
nnoremap <c-j> <c-w>j
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Resize split windows using arrow keys by pressing:
" CTRL+UP, CTRL+DOWN, CTRL+LEFT, or CTRL+RIGHT.
" Tmux sends same signal for default arrow keys so this messus up vim behavior
" use different combination when needed
" noremap A <c-w>+
" noremap B <c-w>-
" noremap D <c-w>>
" noremap C <c-w><

" NERDTree specific mappings.
" Map the F3 key to toggle NERDTree open and close.
nnoremap  :NERDTreeFocus<cr>

" have nerdtree ignore certain files and directories.
let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']

" map U to redo
nnoremap <silent> U :redo<cr>

" Set the backslash as the leader key.
let mapleader = "\\"

" set paste when \p is pressed                                                                                                                                                                                                              
nnoremap <leader>p :set paste<CR>
" set nopaste when \o is pressed                                                                                                                                                                                                            
nnoremap <leader>o :set nopaste<CR>

" map folding commands
nnoremap <leader>[ zo
nnoremap <leader>] zc

" }}}


" VIMSCRIPT -------------------------------------------------------------- {{{

" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" More Vimscripts code goes here.
"

" If Vim version is equal to or greater than 7.3 enable undofile.
" This allows you to undo changes to a file even after saving it.
if version >= 703
    set backup
    set backupdir=/p/psg/swip/w/drathina/vim_bkup/bkup
    set backupcopy=yes

    set undofile
    set undodir=/p/psg/swip/w/drathina/vim_bkup/undo
    set undoreload=10000

    " configure bkup directories
    " set backupdir=/p/psg/swip/w/drathina/.vim/.bkup/,/tmp//
    " set directory=/p/psg/swip/w/drathina/.vim/.swap/,/tmp//
    " set undodir=/p/psg/swip/w/drathina/.vim/.undo/,/tmp//

endif

" You can split a window into sections by typing `:split` or `:vsplit`.
" Display cursorline and cursorcolumn ONLY in active window.
augroup cursor_off
    autocmd!
    autocmd WinLeave * set nocursorline nocursorcolumn
    autocmd WinEnter * set cursorline cursorcolumn
augroup END

" }}}


" STATUS LINE ------------------------------------------------------------ {{{

" Status bar code goes here.
" Clear status line when vimrc is reloaded.

set laststatus=2




" }}}
"


" GTAGS ------------------------------------------------------------ {{{

" GTAGS shortcut

"Input ",gd". It searches the string at the current cursor position from tag files.(it's like searching definition)
nmap <Leader>gd :Gtags -i <C-R>=expand("<cword>")<CR><CR>
"Input ",gr". It searches the referenced places of the string where the cursor is located.
nmap <Leader>gr :Gtags -ir <C-R>=expand("<cword>")<CR><CR>
"Input ",gs". It searches the symbols which are not defined in GTAGS.
nmap <Leader>gs :Gtags -is <C-R>=expand("<cword>")<CR><CR>
"Input ",gg". It searches "pattern" from all files.(*.h, *.c, *.txt and etc)
nmap <Leader>gg :Gtags -igo <C-R>=expand("<cword>")<CR><CR>
"Input ",gp". It searches files.
nmap <Leader>gp :Gtags -iPo <C-R>=expand("<cword>")<CR><CR>
"Input ",ge". It searches "--regexp" pattern.
nmap <Leader>ge :Gtags -ige <C-R>=expand("<cword>")<CR><CR>

"These keymaps are same with above, except that the above command searches the string at the current cursor position. Meanwhile, the commands below need to enters the string to search for
nmap <Leader>ild :Gtags -i
nmap <Leader>ilr :Gtags -ir
nmap <Leader>ils :Gtags -is
nmap <Leader>ilg :Gtags -igo
nmap <Leader>ilp :Gtags -iPo
nmap <Leader>ile :Gtags -ige

let g:Gtags_No_Auto_Jump=1



" }}}


