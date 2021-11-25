
" CONFIGS -------------------------------------------------------------- {{{

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" If on and using a tag file in another directory, file names in that
"  tag file are relative to the directory where the tag file is.
set notagrelative

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
" }}}

" PLUGINS ---------------------------------------------------------------- {{{

" Plugin code goes here.
call plug#begin('~/.vim/plugged')
" Plug 'dense-analysis/ale'
Plug 'preservim/nerdtree'
" Highligh multiple words
Plug 'inkarkat/vim-ingo-library'
Plug 'inkarkat/vim-mark'

Plug 'morhetz/gruvbox'
" There is a defect in taglist , it failed to find index for some file.
"Plug 'yegappan/taglist'
Plug 'preservim/tagbar'
Plug 'sudar/comments.vim'

Plug 'milkypostman/vim-togglelist'
Plug 'junegunn/fzf'

" https://www.freecodecamp.org/news/how-to-search-project-wide-vim-ripgrep-ack/ 
Plug 'mileszs/ack.vim'

call plug#end()

"source ~/.vim/plugged/gtags.vim
source ~/.vim/plugged/gtags-cscope.vim
" }}}


" MAPPINGS --------------------------------------------------------------- {{{

" Mappings code goes here.
"let g:toggle_list_copen_command="Copen"
let g:tagbar_ctags_bin="/usr/intel/pkgs/ctags/5.8/bin/ctags"


nnoremap <Tab> >>
nnoremap <S-Tab> <<

" Mark Multiple word highlighter
" https://github.com/inkarkat/vim-mark

"taglist sidebar toggler
nnoremap <leader>t :TagbarToggle<cr>
" Press the space bar to type the : character in command mode.
nnoremap <space> :
nnoremap wq :wq<cr>

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
" noremap OA <c-w>+
" noremap OB <c-w>-
" noremap OD <c-w>>
" noremap OC <c-w><

" NERDTree specific mappings.
" Map the F3 key to toggle NERDTree open and close.
nnoremap <leader>nt :NERDTreeToggle<cr>

" have nerdtree ignore certain files and directories.
let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']
let NERDTreeStatusline = "NT"

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

nnoremap <leader>f :FZF<CR> 

" }}}


" VIMSCRIPT -------------------------------------------------------------- {{{
"

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
"augroup cursor_off
    "autocmd!
    "autocmd WinLeave * set nocursorline nocursorcolumn
    "autocmd WinEnter * set cursorline cursorcolumn
"augroup END

" }}}


" STATUS LINE ------------------------------------------------------------ {{{

" Status bar code goes here.
" Clear status line when vimrc is reloaded.

set laststatus=2
set statusline=
"set statusline+=%#LineNr#
"set statusline+=\ %t
set statusline+=%{expand('%:~:.')}
set statusline+=%m
"set statusline+=%#CursorColumn#
"set statusline+=\ %y
"set statusline+=\ -\ %{tagbar#currenttag('[%s]','')}
set statusline+=\ -\ %{tagbar#currenttag('%s',\ '',\ 'f',\ 'scoped-stl')}
set statusline+=%=
set statusline+=\ %p%%
set statusline+=\ %l:%c



" }}}
"

" GTAGS ------------------------------------------------------------ {{{

let g:Gtags_No_Auto_Jump=1


" Jump back to previous tag using Ctrl-d
" ;) coz Ctrt-t is not easy
nmap <C-d> <C-t>

" previous tag
nnoremap <F11> :tp<CR>
" next tag
nnoremap <F12> :tn<CR>
nnoremap <C-r> :cs find s <C-R>=expand("<cword>")<CR><CR>

" there are many useful tips here
" https://vim.fandom.com/wiki/Browsing_programs_with_tags

" normal command
":nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
":nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
":nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
":nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
":nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
":nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
":nmap <C-\>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
"
"For opening result in horizontal window <c-space>
"For opening result in vertical window <C-space-space>

" }}}


" ack.vim --- {{{

" Use ripgrep for searching ⚡️
" Options include:
" --vimgrep -> Needed to parse the rg response properly for ack.vim
" --type-not sql -> Avoid huge sql file dumps as it slows down the search
" --smart-case -> Search case insensitive if all lowercase pattern, Search case sensitively otherwise
let g:ackprg = 'rg --vimgrep --type-not sql --smart-case'

" Auto close the Quickfix list after pressing '<enter>' on a list item
let g:ack_autoclose = 1

" Any empty ack search will search for the work the cursor is on
let g:ack_use_cword_for_empty_search = 1

" Don't jump to first match
cnoreabbrev Ack Ack!

" Maps <leader>/ so we're ready to type the search keyword
nnoremap <Leader>a :Ack!<Space>

" Navigate quickfix list with ease
nnoremap <silent> [q :cprevious<CR>
nnoremap <silent> ]q :cnext<CR>
" }}}


