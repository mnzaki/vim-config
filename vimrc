" Note: mapping leader before reading the profile scripts
" map <Leader> to ;
let mapleader = ";"
" map <localLeader> to ,
let maplocalleader = ","

let g:tmux_navigator_no_mappings = 1

" Plugins plugins plugins: moved to profile scripts

let vim_profile = $VIM_PROFILE != '' ? $VIM_PROFILE : 'ide'
exec 'source ~/.vim/profile/' . vim_profile . '.vim'

" coc configuration moved to ide.vim profile

"source $MSH_DIR/vim/nested.vim

" vi compatiblility is LAME
set nocompatible
" give me mouse!
set mouse=a
" let edited buffers be
set hidden
filetype plugin on
filetype plugin indent on

" make the last line where the status is two lines deep so you can see status always
set laststatus=2

" no bell, please
set novb

" make that backspace key works the way it should
set backspace=indent,eol,start

" backups, swap, undo
set undodir=~/.vim/.undo//
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//
" persistent undo
set undofile
set undolevels=2000

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
set ignorecase
set smartcase
nnoremap <Leader>/ :nohl<CR>
nmap <expr> M ':%s/' . @/ . '//g<LEFT><LEFT>'

" use wild menu for autocompletion
set wildmenu
" and set it up with sane completion behavior
set wildmode=longest,list:longest,full

" merge sign column with number column
set signcolumn=number

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" buffer management
" :Bdelete from vim-bbye doesn't close windows
nnoremap <Leader>x :Bdelete<CR>
nnoremap <Leader>X :bd<CR>

" window management
"nnoremap <C-m> :res 60<CR>:vertical res 90<CR>
"nnoremap <C-n> :res 1<CR>
"nnoremap <C-h> <C-w>h
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-l> <C-w>l

" tab management
" (vim)
" execute "set <M-i>=\ei"
" (vim)
" execute "set <M-o>=\eo"
nnoremap <M-i> :tabprevious<CR>
nnoremap <M-o> :tabnext<CR>
nnoremap <M-p> :tabnew<CR>
nnoremap <Leader><M-o> :tabnew<CR>
inoremap <M-i> <Esc>:tabprevious<CR>i
inoremap <M-o> <Esc>:tabnext<CR>i
inoremap <M-p> <Esc>:tabnew<CR>i

" pan
set sidescroll=1
"set nowrap
"set listchars=tab:▸\ ,trail:~,extends:▸,precedes:◂
"set list

noremap <Up> 5<C-y>
noremap <Down> 5<C-e>
noremap <Right> z5l
noremap <Left> z5h

" C-a and C-e like readline, while in insert mode
inoremap <C-a> <Esc>I
inoremap <C-e> <Esc>A

" auto indent
set smartindent
let g:html_indent_inctags = "html,body,head,tbody,div,script"

" Expand tab to space
set expandtab
" Tabs should be 2 spaces in general
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
if has ("title")
  " if there is no &t_ts sequence, is the terminal type known?
  if &t_ts == "" && ( &term == "screen" || &term == "xterm" || &term == "xterm-256color" )
    " add the missing control sequence for xterm or screen
    let &t_ts = "\e]2;"
  endif
endif

" set title
"autocmd BufEnter * let &titlestring = expand("%:~:h:t ") . "/" . expand("%:t")
" but remove it when we leave..... don't be glitcheeehhhh
"execute "set titleold=".getcwd()
" thanks https://vi.stackexchange.com/a/17913

if exists('$TMUX')
  " Functions for tmux window renaming on focus events
  function s:TmuxGrabState()
    let g:tmux_title_was_auto = system("tmux display-message -p -F \\#{automatic-rename}")
    let g:tmux_title_was_auto = substitute(g:tmux_title_was_auto, '[\n\r]*$', '', '')
    if g:tmux_title_was_auto == "0"
      let g:tmux_last_window_name = system("tmux display-message -p -F \\#W")
      let g:tmux_last_window_name = substitute(g:tmux_last_window_name, '[\n\r]*$', '', '')
    endif

    let g:tmux_nvim_window_id = system("tmux display-message -p -F \\#{window_id}")
    let g:tmux_nvim_window_id = substitute(g:tmux_nvim_window_id, '[\n\r]*$', '', '')
  endfunction

  function s:TmuxRenameWindow(name)
    call system("tmux rename-window -t " . g:tmux_nvim_window_id . " " . shellescape(a:name))
  endfunction

  function! s:RenameTmuxWindowOnFocusGained()
    call s:TmuxGrabState()
    call s:TmuxRenameWindow(expand("%:t"))
  endfunction

  function! s:RestoreTmuxWindowNameOnFocusLost()
    if g:tmux_title_was_auto == "1"
      " Keep the original behavior for automatic-rename
      call system("tmux set-window-option automatic-rename")
    elseif exists('g:tmux_last_window_name') && !empty(g:tmux_last_window_name)
      call s:TmuxRenameWindow(g:tmux_last_window_name)
      unlet g:tmux_last_window_name " Clear the variable after restoring
    endif
  endfunction

  function! s:RenameTmuxWindowOnBufChanges()
    if !exists('g:tmux_title_was_auto')
      call s:TmuxGrabState()
    endif

    call s:TmuxRenameWindow(expand("%:t"))
  endfunction

  augroup tmux
    " Rename window on FocusGained (and save old name)
    autocmd FocusGained * call s:RenameTmuxWindowOnFocusGained()
    autocmd BufEnter * call s:RenameTmuxWindowOnBufChanges()
    " Restore old name and set automatic-rename on FocusLost/VimLeave
    autocmd VimLeave,FocusLost * call s:RestoreTmuxWindowNameOnFocusLost()
  augroup END

  noremap <silent> <C-h> :<C-U>TmuxNavigateLeft<cr>
  noremap <silent> <C-j> :<C-U>TmuxNavigateDown<cr>
  noremap <silent> <C-k> :<C-U>TmuxNavigateUp<cr>
  noremap <silent> <C-l> :<C-U>TmuxNavigateRight<cr>
  let g:tmux_navigator_no_dynamic_title = 1
  " let g:tmux_navigator_save_on_switch = 1
  " let g:tmux_navigator_disable_when_zoomed = 1
  " let g:tmux_navigator_preserve_zoom = 1
endif

"set t_ts=k
"set t_fs=\

"auto VimLeave * :set t_ts=k\
"auto VimLeave * :set notitle

" (vim) tmux knows the extended mouse mode
" set ttymouse=xterm2

" make the quickfix window infinitely more useful
" map :cn and :cp

inoremap <C-9> <C-o>:cp<CR>
nnoremap <C-9> :cp<CR>

" Folding stuff
" Width of the fold column on the left
"set foldcolumn=1
" Fold according to syntax
set foldmethod=syntax
" foldlevelstart: 0 = all folds closed, 1 = some folds closed, 99 = all open
set foldlevelstart=99

" Zen Coding
let g:user_zen_expandabbr_key = '<c-y>'
let g:use_zen_complete_tag = 1

" " NERDTree!
" nnoremap <F2> :NERDTreeFocus<CR>
" nnoremap <F3> :NERDTreeFind<CR>
" nnoremap <F4> :NERDTreeClose<CR>
"
" " start automatically if no file mentioned on the command line
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTreeToggle | endif
" let NERDTreeIgnore = ['\.pyc$']

set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/venv/*
set wildignore+=*/node_modules/*,*/.meteor/local/*

" VimWiki
let wiki = {
\ 'path': '~/pkb',
\ 'path_html': '~/pkb.html/',
\ 'nested_syntaxes': {
  \ 'python': 'python', 'c++': 'cpp', 'c': 'c',
  \ 'ruby': 'ruby', 'perl': 'perl', 'sh': 'sh'
\ },
\ 'syntax': 'markdown', 'ext': '.md', 'auto_tags': 1 }
"\ 'maxhi': 1,

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
let g:UltiSnipsExpandTrigger="<C-tab>"


" Airline!
" let g:airline_theme='powerlineish'
let g:airline_theme='distinguished'
" give me tabs and buffers!
let g:airline#extensions#tabline#enabled = 1
" highlight whitespace
let g:airline#extensions#whitespace#enabled = 1
" show me pretty symbols!
let g:airline_powerline_fonts = 1
" don't tmuxline, I do it manually in .tmux.conf
let g:airline#extensions#tmuxline#enabled = 0
" git branch is pretty useless, takes up space
let g:airline_skip_empty_sections = 1
let g:airline_section_b = ''
" disable codeium extension, it slows down everything for some reason
let g:airline#extensions#codeium#enabled = 0
" enable highlighting cache for a smoother experience
let g:airline_highlighting_cache = 1

" Color me timbers
set background=dark
colorscheme xoria256_no_bg
" Fix for floating panels color
hi NormalFloat guibg=#222222
" Fix vimdiff colors
hi DiffAdd guibg=#004a00 gui=bold
hi DiffDelete guibg=#ba0000 gui=bold
hi DiffChange guibg=#003000 gui=bold
hi DiffText guibg=#006a00 gui=bold

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

" for overtone
"nnoremap <Leader>; :Eval<CR>
"vnoremap <Leader>; :Eval<CR>
"nnoremap <Leader>' :Eval (stop)<CR>
"nnoremap <Leader>o :Eval (stop)<CR>:Eval<CR>
"nnoremap <Leader>e :Require<CR>
"" vnoremap e :Eval<CR>
" K is already mapped for documentation

noremap <F9> :TagbarToggle<CR>

let g:tmux_navigator_insert_mode = 1

" yank/copy / paste with no xterm-clipboard support
vnoremap <silent> <Leader>y y:new ~/.vim/.yank<CR>VGp:w !xclip -rmlastnl -selection clipboard<CR><CR>:bdelete!<CR>
nnoremap <silent> <Leader>y yy:w !xclip -rmlastnl -selection clipboard<CR><CR>
vnoremap <silent> <Leader>p :r !xclip -o -selection clipboard<CR>
nnoremap <silent> <Leader>p :r !xclip -o -selection clipboard<CR>
" and cut as well
vnoremap <silent> <Leader>Y d:new ~/.vim/.yank<CR>VGp:w !xclip -rmlastnl -selection clipboard<CR><CR>:bdelete!<CR>
nnoremap <silent> <Leader>Y dd:new ~/.vim/.yank<CR>VGp:w !xclip -rmlastnl -selection clipboard<CR><CR>:bdelete!<CR>

"-------------------------------------------------------------------------------
" Bash-Support
" the settings are documented here:
"  :help bashsupport-custom-variables
"-------------------------------------------------------------------------------
"let g:BASH_LoadMenus  = 'yes'
"let g:BASH_CreateMenusDelayed = 'no'
"let g:BASH_RootMenu   = '&Bash'
"let g:BASH_MapLeader  = '\'
"let g:BASH_InsertFileHeader = 'no'
"let g:BASH_OutputMethod = 'terminal'
"let g:BASH_DirectRun    = 'yes'
"let g:BASH_AlsoBash = [ '*.SlackBuild' , 'rc.*' ]


" mnzakish/categorization
" to tag current file :Tag public sometag
command! -nargs=1 Silent execute ':silent !'.<q-args> | execute ':redraw!'
command -nargs=+ Tag Silent ~/.msh/categorization.sh tag % <q-args>
command -nargs=+ Tagrm Silent ~/.msh/categorization.sh tagrm % <q-args>

" mnzakish/bin/capture
vnoremap <Leader>z :w !capture<CR><CR>


" tidal
" run SuperCollider as well
let g:tidal_sc_enable = 1
" if there's no "boot.sc" in the project, then use this one
let g:tidal_sc_boot_fallback = "~/pkb/tidal/boot.sc"

""""""" AI
command -nargs=1 NeuralToTypescript :exe "echo 'code in typescript using imports "  . <q-args> . "\n'"
vnoremap <Leader>n :delete<CR>:NeuralToTypescript @"<CR>

" Codeium.com
let g:codeium_disable_bindings = 1
imap <script><silent><nowait><expr> <C-]> codeium#Accept()
inoremap <C-PageDown>   <Cmd>call codeium#CycleCompletions(1)<CR>
inoremap <C-PageUp>   <Cmd>call codeium#CycleCompletions(-1)<CR>
" imap <C-/>   <Cmd>call codeium#Clear()<CR>

" Function to source only if file exists {
function! SourceIfExists(file)
  if filereadable(expand(a:file))
    exe 'source' a:file
  endif
endfunction
" }

call SourceIfExists("~/.vimrc.secrets")
