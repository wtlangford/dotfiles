" .vimrc File
" Maintained by: Jeffrey Way
" jeffrey@jeffrey-way.com
" http://net.tutsplus.com
"

"Enable mouse scrolling
set mousem=extend
set mouse=a

"Fix for background color issues
if &term =~'xterm-256color'
	set t_ut=
	if has("mouse_sgr")
		set ttymouse=sgr
	elseif has("mouse_xterm2")
		set ttymouse=xterm2
	endif
endif

if has("multi_byte_encoding")
	set fillchars=vert:│,fold:—
endif

set foldmethod=syntax
set foldlevel=2
"Forget compatibility with Vi. Who cares.
set nocompatible

" Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'fatih/vim-go'
Plugin 'majutsushi/tagbar'
Plugin 'kchmck/vim-coffee-script'
Plugin 'chooh/brightscript.vim'
Plugin 'tpope/vim-rbenv'
Plugin 'vim-scripts/SyntaxRange'
Plugin 'tpope/vim-rails'
Plugin 'pearofducks/ansible-vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'nathanaelkane/vim-indent-guides'

Plugin 'rizzatti/dash.vim'
Plugin 'garyburd/go-explorer'
Plugin 'hashivim/vim-terraform'

call vundle#end()

let g:syntastic_go_checkers = ['go', 'golint', 'govet', 'errcheck']
let g:indent_guides_enable_on_vim_startup = 1
colorscheme jellybeans

"Ansible tweaks
let g:ansible_extra_syntaxes = "upstart.vim sh.vim json.vim"
autocmd BufRead,BufNewFile ~/src/build/ansible/*.yml set ft=ansible

"Enable filetypes
filetype plugin indent on

":Q is :q
:command! Q q

syntax on
"Write the old file out when switching between files.
set autowrite
"Display current cursor position in lower right corner.
set ruler
"Want a different map leader than \
"set mapleader = ",";
"Ever notice a slight lag after typing the leader key + command? This lowers
"the timeout.
set timeoutlen=500
"Switch between buffers without saving
set hidden
"Set font type and size. Depends on the resolution. Larger screens, prefer h20
set guifont=Menlo:h14
"Tab stuff
set tabstop=3
set shiftwidth=3
set softtabstop=3
"set expandtab
"Show command in bottom right portion of the screen
set showcmd
"Show lines numbers
set number
"Prefer relative line numbering?
"set relativenumber"
"Indent stuff
set smartindent
set autoindent
"Always show the status line
set laststatus=2
"Prefer a slightly higher line height
set linespace=3
"Better line wrapping
set wrap
set textwidth=79
set formatoptions=qrn1
"Set incremental searching"
set incsearch
"Highlight searching
set hlsearch
" case insensitive search
set ignorecase
set smartcase
"Hide MacVim toolbar by default
set go-=T
"Hard-wrap paragraphs of text
nnoremap <leader>q gqip
"Enable code folding
set nofoldenable
"Hide mouse when typing
set mousehide
"Shortcut to fold tags with leader (usually \) + ft
nnoremap <leader>ft Vatzf
" Create dictionary for custom expansions
set dictionary+=/Users/jeff_way/.vim/dict.txt
"Opens a vertical split and switches over (\v)
nnoremap <leader>v :bel vsp 
nnoremap <leader>s :bel sp 
"Opens a new tab
nnoremap <leader>t :tabnew<CR>
"Split windows below the current window.
set splitbelow
" session settings
set sessionoptions=resize,winpos,winsize,buffers,tabpages,folds,curdir,help
"Set up an HTML5 template for all new .html files
"autocmd BufNewFile * silent! 0r $VIMHOME/templates/%:e.tpl
"Map a change directory to the desktop - Mac specific
nmap <leader>d :cd ~/Desktop<cr>:e.<cr>
"Shortcut for editing  vimrc file in a new tab
nmap <leader>ev :tabedit $MYVIMRC<cr>
"Change zen coding plugin expansion key to shift + e
let g:user_zen_expandabbr_key = '<C-e>'
"Faster shortcut for commenting. Requires T-Comment plugin
map <leader>c <c-_><c-_>
"Saves time; maps the spacebar to colon
nmap <space> :
"Automatically change current directory to that of the file in the buffer
autocmd BufEnter * cd %:p:h
"Map code completion to , + tab
imap <leader><tab> <C-x><C-o>
" More useful command-line completion
set wildmenu
"Auto-completion menu
set wildmode=list:longest
"http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
set completeopt=longest,menuone,preview
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
"Map escape key to jj -- much faster
imap jj <esc>
"Delete all buffers (via Derek Wyatt)
nmap <silent> ,da :exec "1," . bufnr('$') . "bd"<cr>
"Bubble single lines (kicks butt)
"http://vimcasts.org/episodes/bubbling-text/
nmap <C-Up> ddkP
nmap <C-Down> ddp
"Bubble multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]
" Source the vimrc file after saving it. This way, you don't have to reload Vim to see the changes.
if has("autocmd")
 augroup myvimrchooks
  au!
  autocmd bufwritepost .vimrc source ~/.vimrc
 augroup END
endif
" easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
"Spelling corrects. Just for example. Add yours below.
iab teh the
iab Teh The
" Get to home dir easier
" <leader>hm is easier to type than :cd ~
nmap <leader>hm :cd ~/ <CR>
" Alphabetically sort CSS properties in file with :SortCSS
:command! SortCSS :g#\({\n\)\@<=#.,/}/sort
" Shortcut to opening a virtual split to right of current pane
" Makes more sense than opening to the left
nmap <leader>bv :bel vsp
" Backups
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap// " swap files
set backup " enable backup
" No more stretching for navigating files
"noremap h ;
"noremap j h
"noremap k gj
"noremap l gk
"noremap ; l
set showmatch " show matching brackets
" print empty <a> tag
map! ;h <a href=""></a><ESC>5hi
:command! Initc <leader>main
map <leader>main i#include <stdio.h><CR><CR>int main(int argc, char **argv) {<CR><TAB>printf("Hello, world!\n");<CR>return 0;<CR>}<ESC>2ki


"Prebuilt C template
autocmd bufnewfile *.c so ~/.vim/templates/c_template
autocmd bufnewfile *.c exe "1," . 10 . "g/FNAME/s//".expand("%")
autocmd bufnewfile *.c exe "1," . 10 . "g/UNAME/s//" .system("finger `whoami` | sed -e '/Name/!d' -e 's/.*Name: //'") 
autocmd bufnewfile *.c exe "1," . 10 . "g/DATE/s//" .strftime("%m\\/%d\\/%y")
autocmd bufnewfile *.c exe "1," . 10 . "g/YEAR/s//" .strftime("%Y")
autocmd bufnewfile *.c exe "1," . 10 . "g/COMPANY/s//" .input("Company:")

"Prebuilt H template
autocmd bufnewfile *.h so ~/.vim/templates/h_template
autocmd bufnewfile *.h exe "%s/FNAME/".toupper(expand('%:t:r'))."_H/g"

"Prebuilt java template
autocmd bufnewfile *.java so ~/.vim/templates/java_template
autocmd bufnewfile *.java exe "%g/CLASSNAME/s//" . expand('%:t:r')
"Comment lines
fu! CommentLineANSI()
	if empty(matchstr(getline('.'),'^\s*/\*.*\*/\s*'))
		:s/^\(.*\)$/\/*\1*\//
	else
		:s/^\/\*\(.*\)\*\//\1/
	endif
		:silent! /dskjldsjkldd
endfunction
fu! CommentBlock()
	:'< s/^/\/*/
	:'> s/$/*\//
endfu
nmap <C-_> :call CommentLineANSI()<CR>
imap <C-_> <C-O> :call CommentLineANSI()<CR>
vmap <C-_> :call CommentLineANSI()<CR>gv

"latex
let g:tex_flavor='latex'
