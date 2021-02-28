" Plugins plugins plugins

call plug#begin('~/.vim/bundle')
" Make sure you use single quotes in plugin names
" Lazy loading FTW
Plug 'git@github.com:mileszs/ack.vim.git'
Plug 'git@github.com:kien/ctrlp.vim.git'
Plug 'git@github.com:ycm-core/YouCompleteMe.git', { 'on': 'YcmCompleter' }
" Plug 'git@github.com:tweekmonster/django-plus.vim.git'
Plug 'git@github.com:scrooloose/nerdcommenter.git'
" Plug 'git@github.com:scrooloose/nerdtree.git'
Plug 'git@github.com:tpope/vim-vinegar.git'
" Plug 'git@github.com:edkolev/tmuxline.vim.git'
Plug 'git@github.com:SirVer/ultisnips'
Plug 'git@github.com:honza/vim-snippets.git'
Plug 'git@github.com:vim-airline/vim-airline.git'
Plug 'git@github.com:vim-airline/vim-airline-themes.git'
Plug 'git@github.com:tpope/vim-fugitive.git'
Plug 'git@github.com:tpope/vim-sensible.git'
Plug 'git@github.com:tpope/vim-surround.git'
"Plug 'git@github.com:tpope/vim-fireplace', { 'for': 'clojure' }
"Plug 'git@github.com:tpope/vim-classpath.git', { 'for': 'clojure' }
"Plug 'git@github.com:guns/vim-clojure-static.git', { 'for': 'clojure' }
Plug 'git@github.com:pangloss/vim-javascript.git', { 'for': 'javascript' }
"Plug git@github.com:'kchmck/vim-coffee-script.git'
Plug 'git@github.com:othree/html5.vim.git', { 'for': 'html' }
Plug 'git@github.com:posva/vim-vue.git', { 'for': 'vue' }
" Plug 'git@github.com:Quramy/tsuquyomi.git', { 'for': 'typescript' }
Plug 'git@github.com:tommcdo/vim-kangaroo.git'
Plug 'git@github.com:leafgarland/typescript-vim.git', { 'for': 'typescript' }
Plug 'git@github.com:rust-lang/rust.vim', { 'for': 'rust' }

" Music stuff
Plug 'supercollider/scvim', { 'for': 'supercollider' }
Plug 'tidalcycles/vim-tidal', { 'for': 'tidal' }
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'preservim/tagbar', { 'on': 'TagbarToggle' }

call plug#end()

" vi compatiblility is LAME
set nocompatible
" give me mouse!
set mouse=a
" let edited buffers be
set hidden
filetype plugin on
filetype plugin indent on

set background=dark
colorscheme xoria256_no_bg

" make the last line where the status is two lines deep so you can see status always
set laststatus=2

" no bell, please
set novb

" make that backspace key work the way it should
set backspace=indent,eol,start

" backups go to /tmp
set bdir=/tmp

" syntax highlighting on
syntax on

" show line numbers
set nu

" show matching brackets
set showmatch

" show whitespace at end of lines
"highlight WhitespaceEOL ctermbg=lightgray guibg=lightgray
"match WhitespaceEOL /\s\+$/

" map <Leader> to ;
let mapleader = ";"

" Search settings
set hlsearch
set incsearch
nnoremap <Leader>/ :nohl<CR>

" use wild menu for autocompletion
set wildmenu

" tab completion
" omni completion
"set ofu=syntaxcomplete#Complete
"set completeopt=menuone,longest,preview
"let g:SuperTabDefaultCompletionType = "context"

" buffer management
nnoremap <Leader>x :bd<CR>
nnoremap <Leader>X :bufdo bd<CR>
nnoremap <Leader>b :CtrlPBuffer<CR>

" window management
nnoremap <C-m> :res 60<CR>:vertical res 90<CR>
nnoremap <C-n> :res 1<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" tab management
execute "set <M-i>=\ei"
execute "set <M-o>=\eo"
nnoremap <M-i> :tabprevious<CR>
nnoremap <M-o> :tabnext<CR>
inoremap <M-i> <Esc>:tabprevious<CR>i
inoremap <M-o> <Esc>:tabnext<CR>i

" pan
set sidescroll=1
"set nowrap
"set listchars=tab:▸\ ,trail:~,extends:▸,precedes:◂
"set list

noremap <Up> 5<C-y>
noremap <Down> 5<C-e>
noremap <Right> z5l
noremap <Left> z5h

" auto indent
set smartindent
let g:html_indent_inctags = "html,body,head,tbody,div,script"

" Expand tab to space
set expandtab
" Tabs should be four spaces in general
set tabstop=2
set shiftwidth=2
set textwidth=80

" Makefile sanity
autocmd BufEnter * set et
autocmd BufEnter ?akefile* set noet

" Tab and space settings
autocmd BufEnter *.js set et ts=2 sw=2
autocmd BufEnter *.htm? set et ts=2 sw=2
autocmd BufEnter *.css set et ts=2 sw=2
autocmd BufEnter *.?rb set et ts=2 sw=2
autocmd BufEnter *.py set et ts=4 sw=4

" when inside the matrix
" window title
autocmd BufEnter * let &titlestring = "vim[" . expand("%:t") . "]"
set t_ts=k
set t_fs=\
set title
" but remove it when we leave..... don't be glitcheeehhhh
auto VimLeave * :set t_ts=k\
" tmux knows the extended mouse mode
set ttymouse=xterm2

" Folding stuff
" Width of the fold column on the left
"set foldcolumn=1
" Fold according to syntax
set foldmethod=manual
" foldlevelstart: 0 = all folds closed, 1 = some folds closed, 99 = all open
set foldlevelstart=2


" Zen Coding
let g:user_zen_expandabbr_key = '<c-y>'
let g:use_zen_complete_tag = 1

" NERDTree!
nnoremap <F2> :NERDTreeFocus<CR>
nnoremap <F3> :NERDTreeFind<CR>
" start automatically if no file mentioned on the command line
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" CtrlP
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_open_multiple_files = '2jvr'
let g:ctrlp_jump_to_buffer = 2
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/venv/*
set wildignore+=*/node_modules/*,*/.meteor/local/*
nnoremap <Leader>r :CtrlPClearAllCaches<CR>
"let g:ctrlp_custom_ignore = '\v[\/](\.git|\.hg|\.svn)$'

" VimWiki
let wiki = {}
let wiki.path = '~/wiki/'
let wiki.path_html = '~/wiki/html/'
let wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp', 'c': 'c',
                          \ 'ruby': 'ruby', 'perl': 'perl', 'sh': 'sh'}
let g:vimwiki_list = [wiki]
nmap <leader>tt <Plug>VimwikiToggleListItem
vmap <leader>tt <Plug>VimwikiToggleListItem

" Highlight cur line in active window
"set cul
"augroup BgHighlight
"    autocmd!
"    autocmd WinEnter * set cul
"    autocmd WinLeave * set nocul
"augroup END

" UltiSnip!
" :(

" Airline!
" give me tabs and buffers!
let g:airline#extensions#tabline#enabled = 1
" highlight whitespace
let g:airline#extensions#whitespace#enabled = 1
" show me pretty symbols!
let g:airline_powerline_fonts = 1

" We all make mistakes
command WQ wq
command Wq wq
command W w
command Q q

" 'The other tool I use to combat EOL whitespace is to unceremoniously execute it'
function! <SID>StripTrailingWhitespace()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
nmap <silent> <Leader><space> :call <SID>StripTrailingWhitespace()<CR>
