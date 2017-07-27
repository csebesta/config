set nocp
execute pathogen#infect()
filetype plugin off
filetype indent on
syntax on

" Split behavior
set splitbelow
set splitright

" Split navigation
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" General
set autoindent
set smartindent
set encoding=utf-8

" Tab behavior
set tabstop=4
set softtabstop=0
set shiftwidth=4
set noexpandtab

" Appearance
set number
set hlsearch incsearch
set ignorecase smartcase
set showcmd cursorline
set ruler laststatus=2
nnoremap \ :noh<CR>

" Faster scrolling
set ttyfast
set lazyredraw

" Graphical Vim
if has('gui_running')
	" Start maximized
	set lines=999
	set columns=999
	" Disable toolbar/menubar/srollbars
	"set guioptions-=m
	set guioptions-=T
	set guioptions-=r
	set guioptions-=L
	" Hide buttons on the toolbar
	aunmenu ToolBar.SaveAll
	aunmenu ToolBar.LoadSesn
	aunmenu ToolBar.SaveSesn
	aunmenu ToolBar.RunScript
	aunmenu ToolBar.Make
	aunmenu ToolBar.RunCtags
	aunmenu ToolBar.TagJump
	aunmenu ToolBar.FindHelp
	" Colorscheme and font
	set background=dark
	colorscheme solarized
	if has('gui_win32')
		set guifont=Consolas:h14:b
	else
		"set guifont=Monospace\ Bold\ 14
		"set guifont=Consolas\ Bold\ 14
		set guifont=Consolas\ 16
	endif
else
	" Commented out lines may fix some terminal issues
	" Whenever possible set terminal colors to solarized
	"set t_Co=16
	set background=dark
	"let g:solarized_termcolors=256
	colorscheme solarized
	"highlight Normal ctermbg=NONE
	"highlight nonText ctermbg=NONE
endif

" Change background
" Requires solarized
call togglebg#map("<F12>")

" Change to fullscreen
" Requires wmctrl
map <silent> <F11>
\	:call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>

" Compile latex document to pdf
" Requires pdflatex
nnoremap <F6>
\	:w<Bar>!pdflatex %:t<CR>
"extra commands go here (open viewer)
