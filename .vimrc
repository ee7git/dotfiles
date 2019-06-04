" Started from Ben Hilburn's vimrc.
" https://github.com/bhilburn/dotfiles/blob/master/vim/vimrc

" Ignore compatibility issues with Vi
set nocompatible

" Vim plug settings ---------------------- {{{

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'wjes/snippets'
Plug 'lifepillar/vim-mucomplete'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'prettier/vim-prettier'
Plug 'sheerun/vim-polyglot'
"Plug 'prettier/prettier-eslint'
Plug 'BarretRen/vim-colorscheme'
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

set splitbelow
set splitright

set cursorline          " Show row highlight
set cursorcolumn        " Show column highlight
set scrolloff=5         " See 5 lines above/below the edge

set encoding=utf-8
set fillchars=diff:⣿,vert:│
set listchars=tab:▸\ ,trail:·,extends:❯,precedes:❮
"set showbreak=↪

set cmdheight=2         " Better display for messages
"set signcolumn=yes     " Always show signcolumns
"set updatetime=300     " Smaller updatetime for CursorHold & CursorHoldI

autocmd BufRead,BufNewFile *.phtml set filetype=php
autocmd BufRead,BufNewFile *.pinc set filetype=php

" }}}

" Save when losing focus
au FocusLost * :silent! wall

" Resize splits when the window is resized
au VimResized * :wincmd =

" Spacing and tabbing {{{
set expandtab
set smarttab
set softtabstop=4
set tabstop=4
set shiftwidth=4
" }}}

" Backup Files {{{

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

" Some servers have issues with backup files
"set nobackup
"set nowritebackup

" }}}

" Colors {{{
set t_Co=256

colorscheme monokai

" Transparent background
hi Normal ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi NonText ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi LineNr ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
" }}}

" Abbreviations (hehe) {{{
iabbrev emomg ಠ_ಠ
iabbrev emsad ಥ_ಥ
iabbrev emhap ಥ‿ಥ
iabbrev emmis ಠ‿ಠ
" }}}

" Key Re-Mappings ------------------------ {{{

let mapleader = ',' " Change the <leader> key

:map <f10> <nop>
:map! <f10> <nop>

" "Uppercase word" mapping.
"
" This mapping allows you to press <c-u> in insert mode to convert the current
" word to uppercase.  It's handy when you're writing names of constants and
" don't want to use Capslock.
"
" To use it you type the name of the constant in lowercase.  While your
" cursor is at the end of the word, press <c-u> to uppercase it, and then
" continue happily on your way:
"
"                            cursor
"                            v
"     max_connections_allowed|
"     <c-u>
"     MAX_CONNECTIONS_ALLOWED|
"                            ^
"                            cursor
"
" It works by exiting out of insert mode, recording the current cursor location
" in the z mark, using gUiw to uppercase inside the current word, moving back to
" the z mark, and entering insert mode again.
"
" Note that this will overwrite the contents of the z mark.  I never use it, but
" if you do you'll probably want to use another mark.
inoremap <C-u> <esc>mzgUiw`za

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

" Some love to my spanish hand (delete this after custom keyboard)
inoremap <silent> ñ /
inoremap <silent> Ñ ñ

" Easy buffer navigation
noremap <leader>h <C-W>h
noremap <leader>j <C-W>j
noremap <leader>k <C-W>k
noremap <leader>l <C-W>l

" Easy tab navigation
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>

" Spell checker
nnoremap <leader>e   :setlocal spell spelllang=es<CR>
nnoremap <leader>i   :setlocal spell spelllang=en<CR>
nnoremap <leader>s   :setlocal nospell<CR>

" }}}
"
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

" Mucomplete settings -------------------- {{{

"c-n" : keywords in 'complete' (search forwards);
"c-p" : keywords in 'complete' (search backwards);
"cmd" : Vim command line;
"defs": definitions or macros;
"dict": keywords in 'dictionary';
"file": file names;
"incl": keywords in the current and included files;
"keyn": keywords in the current file (search forwards);
"keyp": keywords in the current file (search backwards);
"line": whole lines;
"omni": omni completion ('omnifunc');
"spel": spelling suggestions;
"tags": tags;
"thes": keywords in 'thesaurus';
"user": user defined completion ('completefunc').
"path": file names (MUcomplete's implementation).
"uspl": spelling suggestions (MUcomplete's implementation).
"list": complete words from |b:mucomplete_wordlist| or |g:mucomplete#wordlist|.
"nsnp": Neosnippet snippets.
"snip": SnipMate snippets.
"ulti": UltiSnips snippets.

let g:mucomplete#chains = { 'default' : ['ulti', 'incl', 'defs', 'file', 'path', 'tags', 'line'] }

set completeopt+=menuone
set shortmess+=c    " Shut off completion messages
set belloff+=ctrlg  " If Vim beeps during completion
set completeopt+=noselect

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
let g:UltiSnipsEnableSnipMate = 0

" On the fly snippets edition window
let g:UltiSnipsEditSplit = "vertical"

" Conflict with Mucomplete
let g:UltiSnipsExpandTrigger = "<f7>"        " Do not use <tab>
let g:UltiSnipsJumpForwardTrigger = "<f10>"  " Do not use <c-j>

" Include the js-node snippets to all js files
autocmd FileType javascript UltiSnipsAddFiletypes javascript-node
autocmd FileType javascript UltiSnipsAddFiletypes javascript-jsdoc

" Save before saving
let g:prettier#autoformat = 0
"autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html,*.markdown,*.lua,*.php,*.py,*.rb PrettierAsync

" }}}

" ALE settings --------------------------- {{{

highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

" https://freshman.tech/vim-javascript/

"let g:ale_linter_aliases = { 'html': ['html', 'javascript', 'css'] }
"let g:ale_linters = {
"\   'javascript': ['eslint']}
"\   'typescript': ['tsserver'],
"\   'graphql' : ['eslint']
"\ }

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint']}

"\   'graphql': ['prettier'],
"\   'css': ['prettier'],
"\   'scss': ['prettier'],
"\   'typescript': ['prettier'],
"\   'json': ['prettier'],
"\   'html': ['prettier']
"\ }

let g:ale_fix_on_save = 1

" We're using UltiSnips
let g:ale_completion_enabled = 0

" No highlighting the row
let g:ale_set_highlights = 0

" Airline will handle the display
let g:airline#extensions#ale#enabled = 1

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0

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
