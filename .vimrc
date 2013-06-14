" wookayin's vimrc file
" https://github.com/wookayin/vim-config

"""""""""""""""""""""""""""
" 1. General Settings
"""""""""""""""""""""""""""

syntax on
set nocompatible

" load plugins with pathogen/vundle
try
	runtime bundle/pathogen/autoload/pathogen.vim
	call pathogen#infect()
catch
endtry

" basic displays and colors
" (for detailed color settings, see section 3)
colorscheme evening
set bg=dark
set number					" show line numbers
set ruler
"set t_Co=256
"colorscheme xoria256

" input settings
set bs=indent,eol,start		" allow backspaces over everything
set autoindent
set smartindent
set pastetoggle=<F8>

set wrap
set textwidth=0				" disable automatic line breaking
set cursorline

" tab settings
set tabstop=4
set shiftwidth=4
set softtabstop=4

" tab navigation
set showtabline=2			" always show tab pannel

set scrolloff=3

" search
set ignorecase				" case-insensitive by default
set smartcase				" case-sensitive if keyword contains both uppercase and lowercase
set incsearch
set hlsearch

" wildmenu settings
set wildmenu
set wildmode=list:longest,full
set wildignore=*.swp,*.swo,*.class

" status line
set statusline=%1*%{winnr()}\ %*%<\ %f\ %h%m%r%=%l,%c%V\ (%P)
set laststatus=2			" show anytime

" mouse behaviour
set mouse=nvc
set ttymouse=xterm2

" encoding and line ending settings
set encoding=utf-8
set fileencodings=utf-8,cp949,latin1
set fileformats=unix,dos

" split and autocomplete settings
set splitbelow              " preview window at bottom

" miscellanious
set showmode
set showcmd

set visualbell
set history=1000
set undolevels=1000
set lazyredraw				" no redrawing during macro execution

set mps+=<:>


"""""""""""""""""""""""""""
" 2. Key Mappings
"""""""""""""""""""""""""""

" the leader key
let mapleader=","			" comma is the <Leader> key.

" navigation key mapping
map k gk
map j gj
map <up> gk
map <down> gj
imap <up> <c-o>gk
imap <down> <c-o>gj

" window navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" do not exit from visual mode when shifting
" (gv : select the preivous area)
vnoremap < <gv
vnoremap > >gv

" [F5] Make
map <F5> <ESC>:w<CR>:make!<CR>

" [F4] Next Error [Shift+F4] Previous Error
map <F4> <ESC>:cn<CR>
map [26~ <ESC>:cp<CR>

" [F2] save
imap <F2> <ESC>:w<CR>
map <F2> <ESC><ESC>:w<CR>


" Useful leader key combinations {{{

" <leader><space> : turn off search highlight
nmap <leader><space> :noh<CR>

" <leader>cd : switch to the directory of the current buffer
nmap <leader>cd :cd %:p:h<CR>

" <leader>r : screen sucks, redraw everything
nnoremap <leader>r :redraw!<CR>

" }}}


"""""""""""""""""""""""""""
" 3. Highlight and Syntax
"""""""""""""""""""""""""""

" highlight
highlight LineNr ctermfg=black ctermbg=Gray
highlight StatusLine ctermfg=LightGreen

highlight Comment ctermfg=darkgreen
au FileType c,cpp,latex,tex highlight Comment ctermfg=cyan

" IDE settings
filetype plugin on
filetype indent on

" Use spaces instead of tab in python codes
au FileType python set expandtab

" filetype detections
au BufRead,BufNewFile /etc/nginx/* if &ft == '' | setfiletype nginx | endif

" remove trailing whitespaces on save
fun! StripTrailingWhitespaces()
	let l = line(".")
	let c = col(".")
	%s/\s\+$//e
	call cursor(l, c)
endfun

autocmd FileType c,cpp,java,javascript,html,ruby,python autocmd BufWritePre <buffer> :call StripTrailingWhitespaces()

" highlight trailing whitespaces
highlight ExtraWhitespace ctermbg=red guibg=red

match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()


" better popup menu colors (instead of dark black)
highlight Pmenu ctermfg=black ctermbg=yellow
highlight PmenuSel ctermfg=red ctermbg=white gui=bold

"""""""""""""""""""""""""""
" 4. GUI Options
"""""""""""""""""""""""""""

" gui settings
if has("gui_running")

	if has("gui_win32")
		language mes en			" use english messages (korean characters broken)
		set langmenu=none		" use english context menus (korean characters broken)
		set guioptions-=T		" exclude toolbar
		set guioptions-=m		" exclude menubar

		" font setting for windows
		set guifont=Consolas:h11:cANSI
		set guifontwide=GulimChe:h12:cDEFAULT

	elseif has("gui_gtk2")
		" font setting for Ubuntu linux (GTK)
		set guifont=Ubuntu\ Mono\ 12

	endif

endif


"""""""""""""""""""""""""""
" 5. Plugin Settings
"""""""""""""""""""""""""""

" vim-pandoc
let g:pandoc_no_folding = 1		" no automatic folding

" pymode off toggle
let g:pymode_folding = 0

" fugitive key mappings
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gs :Gstatus<CR>:20wincmd +<CR>
nnoremap <leader>gw :Gwrite<CR>
nnoremap <leader>gb :Gblame<CR>:20wincmd <<CR>
nnoremap <leader>gci :Gcommit<CR>
