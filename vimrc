execute pathogen#infect()

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

" Search settings
set hlsearch
set incsearch

" use wild menu for autocompletion
set wildmenu

" tab completion
" omni completion
"set ofu=syntaxcomplete#Complete
"set completeopt=menuone,longest,preview
"let g:SuperTabDefaultCompletionType = "context"

" map <Leader> to ;
let mapleader = ";"

" buffer management
nnoremap <Leader>x :bd<CR>
nnoremap <Leader>b :CtrlPBuffer<CR>

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
autocmd BufEnter *.htm? set et ts=2 sw=2
autocmd BufEnter *.css set et ts=2 sw=2
autocmd BufEnter *.?rb set et ts=2 sw=2
autocmd BufEnter *.py set et ts=4 sw=4

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
