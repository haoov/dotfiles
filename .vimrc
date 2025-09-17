" Enable syntax highlight
syntax on

" File
filetype on
filetype plugin on
filetype indent on
set omnifunc=syntaxcomplete#Complete
set noswapfile

" Line & Cursor
set cursorline
set cursorcolumn
set colorcolumn=80 " Set column at index 80
" set list " Show special character
set listchars=tab:>\ ,space:⋅,trail:~,eol:$ " Set special characters
set relativenumber " Set line number relative to cursor
set nowrap

" Tabs & indentation
set tabstop=4 " set tab to 4 spaces
set shiftwidth=4 " set autoindent to 4 spaces
set shiftwidth=4
set autoindent " enable autoindent
set smartindent
set title
set titlestring=%f

" Search
set incsearch " Incemental search results
set hlsearch " Highlight search results
set showmatch " Show maching words during a search
set ignorecase " Ignore case when searching
set smartcase " Respect case when specified
set path+=** " Recusive seach for find command

" Wildmenu
set wildmenu
set wildmode=longest:full,full
set wildoptions=pum

" Clipboard
set clipboard=unnamed " Use the clipboard as the default register

" Status bar
set laststatus=2
set showmode " Show current mode on last line
set showcmd

" Spliting windows
set splitright
set splitbelow
set fillchars:vert:│

" Keymapping
let mapleader=' '

" Explorer
let g:netrw_liststyle = 3
let g:netrw_banner = 0 " Remove banner
let g:netrw_browse_split = 4 " Open files on previous window (right side)
let g:netrw_winsize = 25 " 25% of window
let g:netrw_altv = 1 " Open explorer on the left
let g:netrw_retmap = 1
let g:netrw_special_syntax = 1

function! OpenExplorer()
	execute "topleft vertical split"
	execute "edit ."
	let t:explorer_bufnr = bufnr("%")
	execute "vertical resize 30"
endfunction

function! CloseExplorer(explorer_winnr)
	execute a:explorer_winnr . "wincmd w"
	close
	unlet t:explorer_bufnr
endfunction

function! ShowExplorer()
	execute "topleft vertical split"
	execute "buffer" . t:explorer_bufnr
	execute "vertical resize 30"
endfunction

function! ToogleExplorer()
	if exists("t:explorer_bufnr")
		let explorer_winnr = bufwinnr(t:explorer_bufnr)
		if explorer_winnr != -1
			" Explorer is open, close it
			call CloseExplorer(explorer_winnr)
		else
			" Explorer buffer exist but not visible, show it
			call ShowExplorer()
		endif
	else
		" No explorer buffer, create one
		call OpenExplorer()
	endif
endfunction

function! FocusExplorer()
	if exists("t:explorer_bufnr")
		let explorer_winnr = bufwinnr(t:explorer_bufnr)
		if explorer_winnr != -1
			execute explorer_winnr . "wincmd w"
		else
			call OpenExplorer()
		endif
	else
		call OpenExplorer()
	endif
endfunction

nnoremap <Leader>ee :call ToogleExplorer()<CR> " Open explorer
nnoremap <Leader>ef :call FocusExplorer()<CR> " Focus explorer

" Window management
nnoremap <Leader>sv <C-w>v " Split window vertically
nnoremap <Leader>sh <C-w>s " Split window horizontally
nnoremap <Leader>se <C-w>= " Resize windows equally
nnoremap <Leader>sx :close<CR> " Close curretn split
nnoremap <C-h> :call SwitchPane('h')<CR>
nnoremap <C-l> :call SwitchPane('l')<CR>
nnoremap <C-j> :call SwitchPane('j')<CR>
nnoremap <C-k> :call SwitchPane('k')<CR>

function SwitchPane(dir)
	let tmux_dir = a:dir == 'h' ? 'L' : a:dir == 'j' ? 'U' : a:dir == 'k' ? 'D' : 'R'
	if winnr('$') > 1 && winnr(a:dir) != winnr()
		execute 'wincmd ' . a:dir
	else
		call system('tmux select-pane -' . tmux_dir)
	endif
endfunction

" Tabs management
nnoremap <Leader>to :tabnew<CR> " Open new tab
nnoremap <Leader>tx :tabc<CR> " Close current tab

" Finder
" Start find in cwd and all subdir
nnoremap <Leader>ff :find 
nnoremap <Leader>fs :call SearchInFiles('')<CR>
nnoremap <Leader>fc :call SearchInFiles(expand('<cword>'))<CR>
nnoremap <Leader>ft :call SearchInFiles('TODO\:')<CR>
nnoremap <Leader>fo :b 
function! SearchInFiles(word)
	if len(a:word) == 0
		let word = input('Search: ')
	endif
	silent! execute 'vimgrep /' . word . '/ **/*'
	if len(getqflist()) > 0
		execute 'cope'
	else
		echo "No match found"
	endif
endfunction
nnoremap <Leader>nh :noh<CR>

" Replace in file
nnoremap <Leader>rn :call ReplaceInFile()<CR>
function! ReplaceInFile()
	let old = expand('<cword>')
	let new = input("New value: ")
	execute ':%s/'. old . '/' . new . '/g'
endfunction

" Colorsheme
colorscheme haoov
set termguicolors
set bg=dark

" Completion
set completeopt=menuone,noinsert,noselect
set updatetime=300
set pumheight=10
set tags=

augroup AutoComplete
	autocmd!
	autocmd InsertCharPre * 
		\ if v:char !~ '\s' && !pumvisible() |
		\	call feedkeys("\<C-x>\<C-n>", "n") |
		\ endif
augroup END

inoremap <expr> <C-j> pumvisible() ? "<C-n>" : "<C-j>"
inoremap <expr> <C-k> pumvisible() ? "<C-p>" : "<C-k>"
inoremap <expr> <CR> pumvisible() ? "<C-E><CR>" : "<CR>"

" 42 Template
let g:user42 = 'rasbbah'
let g:mail42 = 'rsabbah@student.42.fr'
