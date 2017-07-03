colorscheme evening
set nocompatible "use vim keyboard mod

" Set Tab. 
" Tab is shown as '^I' when run ':set list'.
" If you want to see more key notations, you can type ':help tab'.
set noexpandtab
" set listchars=tab:>-,space:. "<Tab> will be shown as '>--------',Spaces will be shown as '.' 
if 0
	set tabstop=4 " <Tab> width
	set softtabstop=8 " If you type <Tab> in insert mode, it will insert (softtabstop/tabstop) <Tab>s.
	set expandtab " Use the appropriate number of spaces to insert a <Tab>.
endif

" set keyboard mapping
map <F12> gg=G

" set four encodings
set encoding=utf-8 " buffer
set fileencoding=utf-8 " edit file
set fileencodings=ucs-bom,utf-8,cp936,latin1 " try those encodings when open an exist file
set termencoding=utf-8 "terminal

set ff=unix "file plantform

" filetype plugin indent on "This command is short for the three commands below 
filetype on "Enable file type detection(by file name or the contents)
filetype plugin on "Enable loading the plugin files for specific file types
filetype indent on "Enable loading the indent file for specific file type
syntax on
set smartindent
"set noswapfile
"set noundofile
"set nobackup
if (has("win32") || has("win64"))
	set undodir=$VIM/undodir " store.un~ file in the specified dir.
	set backupdir=$VIM/backupdir
endif

set number " show line number
set confirm " pop hint
set autoread " check outside change
set showmatch " show match, [] {}
set foldenable
set showcmd
set autoindent
set cursorline " highlight current line 
"set cursorcolumn " highlight current colum
set colorcolumn=80
highlight ColorColumn ctermbg=235 guibg=#2c2d27

" Set up GUI
if has("gui_running")
	au GUIEnter * simalt ~x " max window
	set guioptions-=m " menu bar
	set guioptions-=T " tools bar
	set guioptions-=L
	set guioptions-=r
	set guioptions-=b
	" set showtabline=0
	if (has("win32") || has("win64"))
		set guifont=courier_new:h12:b:cDEFAULT
	endif
endif


" ------------------------------ Vundle Settings ------------------------------
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
if (has("win32") || has("win64"))
	set rtp+=$VIM/vimfiles/bundle/vundle/
	call vundle#rc('$VIM/vimfiles/bundle/')
elseif has("unix")
	set rtp+=~/.vim/bundle/vundle/
	call vundle#rc('~/.vim/bundle/')
endif
Bundle 'gmarik/vundle'

" NerdTree
Bundle 'scrooloose/nerdtree'
let NERDTreeWinPos='left'
let NERDTreeWinSize=30
map <F2> :NERDTreeToggle<CR>

" tagbar
Bundle 'majutsushi/tagbar'
let g:tagbar_ctags_bin='$VIM\tools\ctags58\ctags.exe'
let g:tagbar_width=30
let g:tagbar_autofocus=1
nmap <F6> :TagbarToggle<CR>

" Status bar
Bundle 'Lokaltog/vim-powerline'
set laststatus=2 " always display the status line

" Git wrapper
Bundle 'tpope/vim-fugitive'
set statusline+=%{fugitive#statusline()} " git hotness

" Cscope
Bundle 'brookhong/cscope.vim'

" You complete me(http://valloric.github.io/YouCompleteMe)
Bundle 'Valloric/YouCompleteMe'
let g:ycm_confirm_extra_conf = 0 " No inquiry
let g:ycm_global_ycm_extra_conf =$VIM . '\vimfiles\bundle\YouCompleteMe\.ycm_extra_conf.py'

Bundle 'vim-syntastic/syntastic'


" Markdown syntax highlighter
Bundle 'godlygeek/tabular'
Bundle 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled=1 "disable folding configuration 

" Markdown preview in chrome
if has('unix')
	Bundle 'JamshedVesuna/vim-markdown-preview'
elseif has('win32') || has('win64')
	" no proper solution
endif

" Support for markdown [TOC] (https://github.com/mzlogin/vim-markdown-toc)
" Usage :GenTocGFM :GenTocRedcarpet
Bundle 'mzlogin/vim-markdown-toc'
map <C-K><C-T> :GenTocGFM<CR>

" plantUML
if 0
	Bundle 'aklt/plantuml-syntax'
	let g:plantuml_executable_script='java -jar E:\Program Files\plantUML\plantuml.jar'
	nnoremap <F5> :w<CR> :silent make<CR>
	inoremap <F5> <Esc>:w<CR>:silent make<CR>
	vnoremap <F5> :<C-U>:w<CR>:silent make<CR>
endif

"------------------------------ Original Configures ---------------------------
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
	let opt = '-a --binary '
	if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
	if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
	let arg1 = v:fname_in
	if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
	let arg2 = v:fname_new
	if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
	let arg3 = v:fname_out
	if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
	if $VIMRUNTIME =~ ' '
		if &sh =~ '\<cmd'
			if empty(&shellxquote)
				let l:shxq_sav = ''
				set shellxquote&
			endif
			let cmd = '"' . $VIMRUNTIME . '\diff"'
		else
			let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
		endif
	else
		let cmd = $VIMRUNTIME . '\diff'
	endif
	silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
	if exists('l:shxq_sav')
		let &shellxquote=l:shxq_sav
	endif
endfunction
