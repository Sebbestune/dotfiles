set showcmd							" Show (partial) command in status line.
set showmatch						" Show matching brackets.
set ignorecase						" Do case insensitive matching
set smartcase						" Do smart case matching
set incsearch						" Incremental search
set autowrite						" Automatically save before commands like :next and :make
set hidden							" Hide buffers when they are abandoned
set mouse=a							" Enable mouse usage (all modes)
set number							" Shows a number on the side
set hlsearch						" Highlight search pattern matches
set laststatus=2					" Always show the statusline
" set backupdir=~/.vim/backup// 		" This allows me to save backup to another location
" set directory=~/.vim/swap// 		" This allows me to save swapfiles to another location
" set undodir=~/.vim/undo/ 			" This allows me to save undo to another location/
set autoread						" Automatically read file  again if changed outside vim	
set viminfo='50,<100,s20,h 			" To be able to save larger amount of code with a yy
set backspace=indent,eol,start 		" Allow backspacing over everything in INSERT mode
set ruler 							" Show ruler and command visual aid
set showcmd 						" Show ruler and command visual aid
set noerrorbells 					" Disable bells
set visualbell 						" Disable bells
set t_vb= 							" Disable bells
set list 							" Show line number and listchars
set nu 								" Show line number and listchars
" set cursorline 						" Highlight the cursor line
set splitright 						" Set default vertical split to right
set tabstop=4 						" Set soft tabs
set shiftwidth=4 					" Set soft tabs
set ai 								" Indent
set si 								" Indent
set listchars=eol:¬,tab:▸\ ,trail:· " Show invisibles

highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

colorscheme desert 					" Set the colorscheme 

"If I fold (use :<startno>,<endno>fo) then this saves the state for next time)
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

" CTRL-U in INSERT mode deletes a lot. Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>
" Don't use Ex mode, use Q for formatting
map Q gq