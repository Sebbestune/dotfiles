syntax on
set expandtab 
set tabstop=2
set shiftwidth=2

set autoindent
set number
set ruler
set noshowmode

set swapfile
set dir=~/vimfiles/tmp

highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

set noerrorbells visualbell t_vb=

call plug#begin('~/.vim/plugged')
  Plug 'fatih/vim-go', { 'tag': '*' }
  Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'itchyny/lightline.vim'
  Plug 'dense-analysis/ale'
  Plug 'maximbaz/lightline-ale'
  Plug 'ianks/vim-tsx'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-ragtag'
call plug#end()

"Start lightline
set laststatus=2

" Only check on save
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0

" Flipping through erros
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Integrate lightline with ALE
let g:lightline = {}
let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_infos': 'lightline#ale#infos',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }
let g:lightline.component_type = {
      \     'linter_checking': 'right',
      \     'linter_infos': 'right',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'right',
      \ }
let g:lightline.active = { 'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ]] }

" Icons for ALE
let g:lightline#ale#indicator_checking = "Checking"
let g:lightline#ale#indicator_infos = "Infos"
let g:lightline#ale#indicator_warnings = "Warnings"
let g:lightline#ale#indicator_errors = "Errors"
let g:lightline#ale#indicator_ok = "Ok"

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['tsserver', 'tslint'],
\   'vue': ['eslint']
\}

let g:ale_fixers = {
\    'javascript': ['eslint'],
\    'typescript': ['prettier'],
\    'vue': ['eslint'],
\    'scss': ['prettier'],
\    'html': ['prettier']
\}
let g:ale_fix_on_save = 1
