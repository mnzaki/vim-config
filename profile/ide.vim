call plug#begin('~/.vim/bundle')
Plug 'WolfgangMehner/bash-support'
" Make sure you use single quotes in plugin names
" Lazy loading FTW
Plug 'mileszs/ack.vim'
"Plug 'kien/ctrlp.vim'

" Plug 'ycm-core/YouCompleteMe', { 'on': 'YcmCompleter' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'dense-analysis/ale'
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
Plug 'tpope/vim-obsession'

"Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
"Plug 'tpope/vim-classpath', { 'for': 'clojure' }
"Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
"Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
"Plug 'kchmck/vim-coffee-script'
"Plug 'othree/html5.vim', { 'for': 'html' }
"Plug 'posva/vim-vue', { 'for': 'vue' }
" Plug 'Quramy/tsuquyomi', { 'for': 'typescript' }
"Plug 'tommcdo/vim-kangaroo'
"Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
"Plug 'rust-lang/rust', { 'for': 'rust' }

" Music stuff
Plug 'supercollider/scvim', { 'for': 'supercollider' }
Plug 'tidalcycles/vim-tidal', { 'for': 'tidal' }
"Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'preservim/tagbar', { 'on': 'TagbarToggle' }

" Magic nav across awesome and vim and tmux
Plug 'intrntbrn/awesomewm-vim-tmux-navigator'

" Ruby on Rails
"Plug 'vim-ruby/vim-ruby'
"Plug 'tpope/vim-rails'


" taskwiki stuff
Plug 'tools-life/taskwiki', { 'for': 'markdown' }
Plug 'vimwiki/vimwiki', { 'for': 'markdown' }
Plug 'itchyny/calendar.vim', { 'for': 'markdown' }
" vim-plugin-AnsiEsc adds color support in charts.
Plug 'powerman/vim-plugin-AnsiEsc', { 'for': 'markdown' }
" vim-taskwarrior enables grid view.
Plug 'farseer90718/vim-taskwarrior', { 'for': 'markdown' }


" Brave new world of AI
" Plug 'dense-analysis/neural' " OpenAI wrapper
"   Plug 'muniftanjim/nui.nvim'
"   Plug 'elpiloto/significant.nvim'
Plug 'Exafunction/codeium.vim' " it's own thing, https://codeium.com/vim_tutorial

"Plug 'dstein64/vim-startuptime'

" Elixir
" Plug 'elixir-editors/vim-elixir'

" TreeSitter for better syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()

" TreeSitter config, for elixir phoenix highlighting
" this is neovim specific
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {
      "eex",
      "elixir",
      "erlang",
      "heex",
      "html",
      "surface",
  },
  highlight = {enable = true},
}
EOF

"
" CoC: Conquer of Code

" still using the old school .vim
let g:coc_config_home = expand('~/.vim')

"
" unicode characters in the file autoload/float.vim
set encoding=utf-8

nnoremap <C-p> :CocCommand fzf-preview.ProjectFiles<CR>
nnoremap <Leader>g :CocCommand fzf-preview.ProjectGrepRecall<CR>
nnoremap <Leader>b :CocCommand fzf-preview.Buffers<CR>

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

" Use <Leader>x for convert visual selected code to snippet
xmap <Leader>x  <Plug>(coc-convert-snippet)
" End From coc-snippet

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"

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
nmap <Leader>rn <Plug>(coc-rename)
" File renaming
nmap <Leader>Rn :CocCommand workspace.renameCurrentFile

" Formatting all code
nmap <Leader>F  <Plug>(coc-format)
" Formatting selected code.
xmap <Leader>f  <Plug>(coc-format-selected)
nmap <Leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<Leader>aap` for current paragraph
xmap <Leader>a  <Plug>(coc-codeaction-selected)
nmap <Leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <Leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <Leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <Leader>cl  <Plug>(coc-codelens-action)

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

" some Ycm Leader shortcuts
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

