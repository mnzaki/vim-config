" Plugins plugins plugins

call plug#begin('~/.vim/bundle')
Plug 'WolfgangMehner/bash-support'
" Make sure you use single quotes in plugin names
" Lazy loading FTW
Plug 'mileszs/ack.vim'
"Plug 'kien/ctrlp.vim'

" Plug 'ycm-core/YouCompleteMe', { 'on': 'YcmCompleter' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" Plug 'tweekmonster/django-plus.vim'
Plug 'scrooloose/nerdcommenter'
" Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-vinegar'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'

"Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
"Plug 'tpope/vim-classpath', { 'for': 'clojure' }
"Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
"Plug 'kchmck/vim-coffee-script'
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'posva/vim-vue', { 'for': 'vue' }
" Plug 'Quramy/tsuquyomi', { 'for': 'typescript' }
Plug 'tommcdo/vim-kangaroo'
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
"Plug 'rust-lang/rust', { 'for': 'rust' }

" Music stuff
Plug 'supercollider/scvim', { 'for': 'supercollider' }
Plug 'tidalcycles/vim-tidal', { 'for': 'tidal' }
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'preservim/tagbar', { 'on': 'TagbarToggle' }

" Magic nav across awesome and vim and tmux
Plug 'intrntbrn/awesomewm-vim-tmux-navigator'

" Ruby on Rails
"Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'


" taskwiki stuff
Plug 'tools-life/taskwiki'
Plug 'vimwiki/vimwiki'
" vim-plugin-AnsiEsc adds color support in charts.
Plug 'powerman/vim-plugin-AnsiEsc'
" vim-taskwarrior enables grid view.
Plug 'farseer90718/vim-taskwarrior'

call plug#end()

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

" make that backspace key work the way it should
set backspace=indent,eol,start

" backups, swap, undo
set undodir=~/.vim/.undo//
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//

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
" map <localLeader> to ,
let maplocalleader = ","


" Search settings
set hlsearch
set incsearch
nnoremap <Leader>/ :nohl<CR>

" use wild menu for autocompletion
set wildmenu
" and set it up with sane completion behavior
set wildmode=longest,list:longest,full

" merge sign column with number column
set signcolumn=number

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" buffer management
nnoremap <Leader>x :bd<CR>
nnoremap <Leader>X :bufdo bd<CR>
nnoremap <C-p> :CocCommand fzf-preview.ProjectFiles<CR>
nnoremap <Leader><Leader> :CocCommand fzf-preview.ProjectGrepRecall<CR>
nnoremap <Leader>b :CocCommand fzf-preview.Buffers<CR>

" window management
"nnoremap <C-m> :res 60<CR>:vertical res 90<CR>
"nnoremap <C-n> :res 1<CR>
"nnoremap <C-h> <C-w>h
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-l> <C-w>l

" tab management
execute "set <M-i>=\ei"
execute "set <M-o>=\eo"
nnoremap <M-i> :tabprevious<CR>
nnoremap <M-o> :tabnext<CR>
nnoremap <leader><M-o> :tabnew<CR>
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

" C-a and C-e like readline, while in insert mode
inoremap <C-a> <Esc>I
inoremap <C-e> <Esc>A

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
set title
autocmd BufEnter * let &titlestring = expand("%:t")
" but remove it when we leave..... don't be glitcheeehhhh
execute "set titleold=".getcwd()
" thanks https://vi.stackexchange.com/a/17913

"set t_ts=k
"set t_fs=\

"auto VimLeave * :set t_ts=k\
"auto VimLeave * :set notitle

" tmux knows the extended mouse mode
set ttymouse=xterm2

" make the quickfix window infinitely more useful
" map :cn and :cp

inoremap <C-9> <C-o>:cp<CR>
nnoremap <C-9> :cp<CR>

" Folding stuff
" Width of the fold column on the left
"set foldcolumn=1
" Fold according to syntax
set foldmethod=manual
" foldlevelstart: 0 = all folds closed, 1 = some folds closed, 99 = all open
set foldlevelstart=2

set ignorecase
set smartcase

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

" CtrlP
"let g:ctrlp_clear_cache_on_exit = 1
"let g:ctrlp_open_multiple_files = '2jvr'
"let g:ctrlp_jump_to_buffer = 2
"let g:ctrlp_custom_ignore = '\v[\/](\.git|\.hg|\.svn)$'
"
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/venv/*
set wildignore+=*/node_modules/*,*/.meteor/local/*

" VimWiki
let wiki = {
\ 'path': '~/pkb',
\ 'maxhi': 1,
\ 'path_html': '~/pkb.html/',
\ 'nested_syntaxes': {
  \ 'python': 'python', 'c++': 'cpp', 'c': 'c',
  \ 'ruby': 'ruby', 'perl': 'perl', 'sh': 'sh'
\ },
\ 'syntax': 'markdown', 'ext': '.md', 'auto_tags': 1 }

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

set background=dark
colorscheme xoria256_no_bg

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
nnoremap <Leader>; :Eval<CR>
vnoremap <Leader>; :Eval<CR>
nnoremap <Leader>' :Eval (stop)<CR>
nnoremap <Leader>o :Eval (stop)<CR>:Eval<CR>
nnoremap <Leader>e :Require<CR>
" vnoremap e :Eval<CR>
" K is already mapped for documentation

noremap <F9> :TagbarToggle<CR>

"
" CoC: Conquer of Code

"
" unicode characters in the file autoload/float.vim
set encoding=utf-8


" From coc-snippet
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)
" End From coc-snippet

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>


"
" YouCompleteMe [turned off in favor of coc]
"

" popup instead of preview window, and always show menu
" set completeopt=menuone,longest,popup
"
" let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
" let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
" let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
" let g:ycm_complete_in_comments = 1 " Completion in comments
" let g:ycm_complete_in_strings = 1 " Completion in string
"
" let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
"
" let g:ycm_confirm_extra_conf = 0
"
" " YouCompleteMe and UltiSnips, you two play well together now
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<S-tab>"

" some Ycm leader shortcuts
"nnoremap <Leader>f :YcmCompleter FixIt<CR>
"nnoremap <Leader>t :YcmCompleter GetType<CR>
"nnoremap <Leader>T :YcmCompleter GetDoc<CR>
"nnoremap <Leader>D :YcmDiags<CR>
"nnoremap <Leader>r :YcmCompleter GoToReferences<CR>

" supercharged GoTo
" map gD :YcmCompleter GoTo<CR>

" supercharged tag jump
" autocmd FileType rust nnoremap <buffer> <C-]> :YcmCompleter GoTo<CR>
" autocmd FileType rust inoremap <buffer> <C-]> <Esc>:YcmCompleter GoTo<CR>
" autocmd FileType typescript nnoremap <buffer> <C-]> :YcmCompleter GoTo<CR>
" autocmd FileType typescript inoremap <buffer> <C-]> <Esc>:YcmCompleter GoTo<CR>
" autocmd FileType typescriptreact nnoremap <buffer> <C-]> :YcmCompleter GoTo<CR>
" autocmd FileType typescriptreact inoremap <buffer> <C-]> <Esc>:YcmCompleter GoTo<CR>
" autocmd FileType javascript nnoremap <buffer> <C-]> :YcmCompleter GoTo<CR>
" autocmd FileType javascript inoremap <buffer> <C-]> <Esc>:YcmCompleter GoTo<CR>
" autocmd FileType javascriptreact nnoremap <buffer> <C-]> :YcmCompleter GoTo<CR>
" autocmd FileType javascriptreact inoremap <buffer> <C-]> <Esc>:YcmCompleter GoTo<CR>
" autocmd FileType java nnoremap <buffer> <C-]> :YcmCompleter GoTo<CR>
" autocmd FileType java inoremap <buffer> <C-]> <Esc>:YcmCompleter GoTo<CR>
" autocmd FileType go nnoremap <buffer> <C-]> :YcmCompleter GoTo<CR>
" autocmd FileType go inoremap <buffer> <C-]> <Esc>:YcmCompleter GoTo<CR>



" load some snippets in the right files
autocmd FileType django UltiSnipsAddFiletypes javascript-jasmine

" Ag is the_silver_surfer
let g:ackprg = 'ag --vimgrep --smart-case'
cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack

" Typescript stuff
" use async calls for tsserver
" let g:tsuquyomi_use_vimproc = 0
" let g:tsuquyomi_baseurl_import_path = 1

" Rust stuff
" let g:rustfmt_autosave = 1

let g:prettier#config#semi = 'false'
let g:prettier#config#singleQuote = 'true'
" let g:prettier#config#config_precedence = 'cli-override'


let g:tmux_navigator_insert_mode = 1


" yank/copy / paste with no xterm-clipboard support
vnoremap <Leader>y :w !xsel -b<CR><CR>
nnoremap <Leader>y <S-v>:w !xsel -b<CR><CR>
vnoremap <Leader>p :r !xsel -b<CR>
nnoremap <Leader>p :r !xsel -b<CR>
" and cut as well
vnoremap <Leader>Y :w !xsel -b<CR>:'<,'> d<CR><CR>
nnoremap <Leader>Y <S-v>:w !xsel -b<CR>:'<,'> d<CR><CR>

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
