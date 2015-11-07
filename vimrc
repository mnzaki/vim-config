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

" buffer explorer - minibufexpl by fholgado
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>
nnoremap <Leader>x :bd<CR>
nnoremap <Leader>b :CtrlPBuffer<CR>
nnoremap <Leader>r :CtrlPClearAllCaches<CR>


" pan
set sidescroll=1
"set nowrap
set listchars=tab:▸\ ,trail:~,extends:▸,precedes:◂
set list

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

" Gundo!
nnoremap <F5> :GundoToggle<CR>
nnoremap <F6> :TlistToggle<CR>

" NERDTree!
nnoremap <F2> :NERDTree<CR>
" start automatically if no file mentioned on the command line
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_open_multiple_files = '2jvr'
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/venv/*
set wildignore+=*/node_modules/*,*/.meteor/local/*
"let g:ctrlp_custom_ignore = '\v[\/](\.git|\.hg|\.svn)$'


" EasyTags
let g:easytags_file = '~/.vim/tags'
" A hack, instead of writing a function to find the project root.
" 15 levels back.
set tags=./vimtags;../vimtags;../../vimtags;../../../vimtags;../../../../vimtags;../../../../../vimtags;../../../../../../vimtags;../../../../../../../vimtags;../../../../../../../../vimtags;../../../../../../../../../vimtags;../../../../../../../../../../vimtags;../../../../../../../../../../../vimtags;../../../../../../../../../../../../vimtags;../../../../../../../../../../../../../vimtags;../../../../../../../../../../../../../../vimtags;../../../../../../../../../../../../../../../vimtags
let g:easytags_dynamic_files = 1

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

" We all make mistakes
command WQ wq
command Wq wq
command W w
command Q q
