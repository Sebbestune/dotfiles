" This vimrc comes from trying to get the highest workflow possible. I will
" try to combine all that I've learned. I'll not try to be minimal or maximal.
" I'll use some plugins I find useful but try to limit it to those plugins
" that don't give to hard of a performance hit and that increase my
" productivity.
"- Sebastian Lindgren 2019-11-01

set nocompatible "Makes this vim not compatible with vi, allowing extra functionality to happen
filetype plugin on
"Used to enable syntax highlighting
syntax enable 

" Let Vim load indentation rules (type found in: /usr/share/vim/vim??/ftplugin )
if has("autocmd")
  filetype plugin indent on
endif

source ~/.vim/config/vimset.vim 
source ~/.vim/config/netrwconf.vim 
"Also check file /.vim/config/powerfulcomments.vim

"Install Plug
if empty(glob('~/.vim/autoload/plug.vim'))
    !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"Also install ripgrep:
"curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb
"sudo dpkg -i ripgrep_11.0.2_amd64.deb

call plug#begin('~/.vim/plugged') "I also need to read some of these docs of use
Plug 'godlygeek/tabular'	":Tab /<expr> to make tabular fields look good (just found this too good to get rid off)
Plug 'tpope/vim-fugitive' 	"Interested in side by side view and additional statusbar stuff
Plug 'jiangmiao/auto-pairs' 	"Always gives auto pairs
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim'     "Very good search (especially with ripgrep) 
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'   "Just trying, this seems very good for productivity
Plug 'dense-analysis/ale'   "Ale linting while writing
Plug 'liuchengxu/eleline.vim' "Statusline with ale support
call plug#end()

"------Ale config--------------------------
" Fix files with prettier, and then ESLint.
let b:ale_fixers = ['prettier', 'eslint']
" Equivalent to the above.
let b:ale_fixers = {'javascript': ['prettier', 'eslint']}

"For some extra convenience, I've found them to be easier to type/reach on my Swedish keyboard.
nnoremap B ^
nnoremap E $
"F1 reserved for help
nnoremap <F2> :GDiff :0
nnoremap <F3> :Files<Cr>
nnoremap <F4> :Rg<Cr> 
"Just because it's nice to have easy access to this
nnoremap <F10> :e $MYVIMRC<CR>

"Interesting function to highlight the cursor
nnoremap <C-K> :call HighlightNearCursor()<CR>
function HighlightNearCursor()
  if !exists("s:highlightcursor")
    match Todo /\k*\%#\k*/
    let s:highlightcursor=1
  else
    match None
    unlet s:highlightcursor
  endif
endfunction
