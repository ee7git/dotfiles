" Ignore compatibility issues with Vi
set nocompatible
set modelines=0

" For security reasons
set nomodeline

" Vim plug settings ---------------------- {{{

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
Plug 'vim-scripts/dbext.vim'

" UltiSnips & Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'wjes/snippets'

" Autocompletion
Plug 'lifepillar/vim-mucomplete'

" Navigation
Plug 'scrooloose/nerdtree'

" Style
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'BarretRen/vim-colorscheme'

" Editor config
Plug 'editorconfig/editorconfig-vim'

" Highlights
"Plug 'sheerun/vim-polyglot'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'leshill/vim-json'

" Fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" The master
Plug 'w0rp/ale'

call plug#end()

" }}}

" Global settings ------------------------ {{{


set number              " Show current line number
set relativenumber      " Show relative line numbers
set autoread            " Against any external change
set hidden              " Idk, everyone use it
set noshowmode          " Since we have airline
set wrap                " Wrap
set linebreak           " Wrap only in the line breaks
set nolist              " list disables linebreak
set shortmess+=A        " Avoid the annoying warning from existing swap file

set splitbelow
set splitright

set cursorline          " Show row highlight
set cursorcolumn        " Show column highlight
set scrolloff=7         " See 5 lines above/below the edge

set encoding=utf-8

set cmdheight=2         " Better display for messages
"set signcolumn=yes     " Always show signcolumns
"set updatetime=300     " Smaller updatetime for CursorHold & CursorHoldI

"autocmd BufRead,BufNewFile *.phtml set filetype=php
"autocmd BufRead,BufNewFile *.pinc set filetype=php

" Save when losing focus
"au FocusLost * :silent! wall

" Resize splits when the window is resized
"au VimResized * :wincmd =

" Spacing and tabbing 
set expandtab
set smarttab
set softtabstop=2
set tabstop=2
set shiftwidth=2

" Backup Files
set backup                       " enable backups

set undodir=~/.vim/tmp/undo/     " undo files
set backupdir=~/.vim/tmp/backup/ " backups
set directory=~/.vim/tmp/swap/   " swap files

" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif

" Colors 
set t_Co=256

" PHP syntaz alias
autocmd BufNewFile,BufRead *.pinc,*.phtml set syntax=php

" Automatic fold save/load
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview 

colorscheme plastic

" Transparent background
hi Normal ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi NonText ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi LineNr ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE

" Abbreviations (hehe)
iabbrev emomg ಠ_ಠ
iabbrev emsad ಥ_ಥ
iabbrev emhap ಥ‿ಥ
iabbrev emmis ಠ‿ಠ
" }}}

" Key Re-Mappings ------------------------ {{{

let mapleader = ',' " Change the <leader> key

" Make sure the following keys don't do anything
:map <f10> <nop>
:map! <f10> <nop>

:map <f7> <nop>
:map! <f7> <nop>

" Typos
command! -bang E e<bang>
command! -bang Q q<bang>
command! -bang W w<bang>
command! -bang QA qa<bang>
command! -bang Qa qa<bang>
command! -bang Wa wa<bang>
command! -bang WA wa<bang>
command! -bang Wq wq<bang>
command! -bang WQ wq<bang>

" Easy buffer navigation
noremap <leader>h <C-W>h
noremap <leader>j <C-W>j
noremap <leader>k <C-W>k
noremap <leader>l <C-W>l

" Easy tab navigation
nnoremap <S-tab> :tabprevious<CR>
nnoremap <tab>   :tabnext<CR>

" Spell checker
nnoremap <leader>e   :setlocal spell spelllang=es<CR>
nnoremap <leader>i   :setlocal spell spelllang=en<CR>
nnoremap <leader>s   :setlocal nospell<CR>

" Number and relative number
nnoremap <leader>n :set nonumber norelativenumber<CR>
nnoremap <leader>N :set number relativenumber<CR>

" }}}

" Folding {{{

"set nofoldenable
"set foldlevelstart=0
"set foldlevel=2
"set foldcolumn=0
"set foldmethod=indent
"set foldopen-=search
"set foldopen-=undo

" Set ,z to toggle all folds on/off
"nnoremap <leader>z zi
"vnoremap <leader>z zi

" Make zO recursively open whatever top level fold we're in, no matter where the
" cursor happens to be.
"nnoremap zO zCzO

" "Focus" the current line.  Basically:
"
" 1. Close all folds.
" 2. Open just the folds containing the current line.
" 3. Move the line to a little bit (15 lines) above the center of the screen.
" 4. Pulse the cursor line.  My eyes are bad.
"
" This mapping wipes out the z mark, which I never use.
"
" I use :sus for the rare times I want to actually background Vim.
"nnoremap <c-z> mzzMzvzz15<c-e>`z<cr>

" }}}

" Airline settings ----------------------- {{{

" TODO - Make the powerline fonts work
" https://github.com/powerline/fonts

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline_theme = 'luna'

" }}}

" Fzf ------------------------------------- {{{

" Since I can't make the command to ignore node_module
silent! nmap <C-P> :GFiles<CR>

" }}}

" Vim Javascript -------------------------- {{{

"let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1

"let g:javascript_conceal_function             = "ƒ"
"let g:javascript_conceal_null                 = "ø"
"let g:javascript_conceal_this                 = "@"
"let g:javascript_conceal_return               = "⇚"
"let g:javascript_conceal_undefined            = "¿"
"let g:javascript_conceal_NaN                  = "ℕ"
"let g:javascript_conceal_prototype            = "¶"
"let g:javascript_conceal_static               = "•"
"let g:javascript_conceal_super                = "Ω"
"let g:javascript_conceal_arrow_function       = "⇒"
"let g:javascript_conceal_noarg_arrow_function = "🞅"
"let g:javascript_conceal_underscore_arrow_function = "🞅"
"
"set conceallevel=1
"map <leader>c :exec &conceallevel ? "set conceallevel=0" : "set conceallevel=1"<CR>

" }}}

" Vim JSX --------------------------------- {{{

" Allow use .js extension instead of .jsx
let g:jsx_ext_required = 0

" }}}

"" Mucomplete settings -------------------- {{{
"
""c-n" : keywords in 'complete' (search forwards);
""c-p" : keywords in 'complete' (search backwards);
""cmd" : Vim command line;
""defs": definitions or macros;
""dict": keywords in 'dictionary';
""file": file names;
""incl": keywords in the current and included files;
""keyn": keywords in the current file (search forwards);
""keyp": keywords in the current file (search backwards);
""line": whole lines;
""omni": omni completion ('omnifunc');
""spel": spelling suggestions;
""tags": tags;
""thes": keywords in 'thesaurus';
""user": user defined completion ('completefunc').
""path": file names (MUcomplete's implementation).
""uspl": spelling suggestions (MUcomplete's implementation).
""list": complete words from |b:mucomplete_wordlist| or |g:mucomplete#wordlist|.
""nsnp": Neosnippet snippets.
""snip": SnipMate snippets.
""ulti": UltiSnips snippets.
"
let g:mucomplete#chains = { 'default' : ['path', 'ulti', 'snip', 'omni', 'incl', 'keyn', 'dict', 'uspl'] }

set completeopt+=menuone
set shortmess+=c    " Shut off completion messages
set belloff+=ctrlg  " If Vim beeps during completion
set completeopt+=noselect
"
let g:mucomplete#enable_auto_at_startup = 1

" Select the snippet with enter
inoremap <silent> <expr> <plug>MyCR  mucomplete#ultisnips#expand_snippet("\<cr>")
imap <cr> <plug>MyCR

" }}}

" UltiSnips settings --------------------- {{{

" Use Python 3
let g:UltiSnipsUsePythonVersion = 3

" Only check for these dirs (faster)
let g:UltiSnipsSnippetDirectories = [$HOME.'/.vim/plugged/vim-snippets/UltiSnips/', $HOME.'/.vim/plugged/snippets/UltiSnips/']

" Disable SnipMate snippets
"let g:UltiSnipsEnableSnipMate = 0

" On the fly snippets edition window
let g:UltiSnipsEditSplit = "vertical"

" Conflict with Mucomplete
let g:UltiSnipsExpandTrigger = "<f7>"        " Do not use <tab>
let g:UltiSnipsJumpForwardTrigger = "<f10>"  " Do not use <c-j>

" Include the js-node snippets to all js files
autocmd FileType javascript UltiSnipsAddFiletypes javascript-node
"autocmd FileType javascript UltiSnipsAddFiletypes javascript-jsdoc

" Save before saving
let g:prettier#autoformat = 0
"autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html,*.markdown,*.lua,*.php,*.py,*.rb PrettierAsync

" }}}

" ALE settings --------------------------- {{{

highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

" https://freshman.tech/vim-javascript/

"set completeopt=menu,menuone,preview,noselect,noinsert

"let g:ale_linter_aliases = { 'html': ['html', 'javascript', 'css'] }

let g:ale_linters = {'javascript': ['eslint']}
let g:ale_fixers = {'javascript': ['eslint']}

" We're using mucomplete
let g:ale_completion_enabled = 0

" No highlighting the row
let g:ale_set_highlights = 0

" Airline will handle the display
let g:airline#extensions#ale#enabled = 1

" When to fix
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_fix_on_save = 1

" Signs
let g:ale_sign_warning = '>'
let g:ale_sign_info = 'I'

" For error navigations
nmap <silent> <leader>aj :ALENext<cr>
nmap <silent> <leader>ak :ALEPrevious<cr>

" Remap keys for gotos
nnoremap <silent> <leader>d :ALEGoToDefinition<cr>
nnoremap <silent> <leader>t :ALEGoToTypeDefinition<cr>
nnoremap <silent> <leader>r :ALEFindReferences<cr>

" }}}

" Nerd Tree settings --------------------- {{{

" Toggle tree view
nmap <leader>m :NERDTreeToggle<CR>

" Close vim if NERDTree is the last thing opened
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

" }}}

"let g:loaded_sql_completion = 0
"let g:omni_sql_no_default_maps = 1
"let g:ftplugin_sql_omni_key = '<Leader>sql'
