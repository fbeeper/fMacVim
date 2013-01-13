" 
" Yet another .vimrc by:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    ..                                                                
"   oec : . uW8"                                                                
"  @88888 `t888                             .d``                      .u    .  
"  8"*88%  8888   .        .u         .u    @8Ne.   .u        .u    .d88B :@8c 
"  8b.     9888.z88N    ud8888.    ud8888.  %8888:u@88N    ud8888. ="8888f8888r
" u888888> 9888  888E :888'8888. :888'8888.  `888I  888. :888'8888.  4888>'88" 
"  8888R   9888  888E d888 '88%" d888 '88%"   888I  888I d888 '88%"  4888> '   
"  8888P   9888  888E 8888.+"    8888.+"      888I  888I 8888.+"     4888>     
"  *888>   9888  888E 8888L      8888L      uW888L  888' 8888L      .d888L .+  
"  4888   .8888  888" '8888c. .+ '8888c. .+'*88888Nu88P  '8888c. .+ ^"8888*"   
"  '888    `%888*%´    `88888%    `88888%  ~ '88888F`     `88888%      `Y´     
"   88R       `´         `YP'       `YP'      888 ^         "YP'                
"   88>                                        *8E                              
"   48                                         '8>                              
"   '8                                          "                               
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"													Ferran Poveda
"													@fbeeper 
"													http://github.com/fbeeper
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Table of Contents

" 1) Basic Settings
" 2) Plugin management
" 3) General file settings
" 4) General behaviours
" 5) Text indentation
" 6) Text wrapping
" 7) Text folding
" 8) Theme + Statusbar
" 9) Search behaviour
" 10) Autocompletion
" 11) NERDTree
" 12) OpenGL GLSL specifics
" 13) Git integration

" N-1) Useful functions
" N) Personal Keyboard bindings
" N+1) Other practical stuff
" N+2) Deal with common typos

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"															   1) Basic Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible   					" Disable vi-compatibility
set laststatus=2  					" Always show the statusline
set encoding=utf-8 					" Necessary to show Unicode glyphs


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"															2) Plugin management
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call pathogen#infect()				
call pathogen#helptags()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"														3) General file settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype plugin on					" Detect filetypes, it is 2013!
syntax enable						" If you don't need color switch TextEdit
set autoread						" read alien changes automatically
set autowrite						" auto write file when thowing (e.g.) :make
set hidden							" they deserve backgrounding
"au BufAdd,BufNewFile,BufRead * nested tab sball " Love tabs, but it breaks! :(
set shortmess+=a 					" Short messages are short :)
set shortmess+=I 					" Forget about Vim's intro message
set autochdir						" The working directory follows me
set nobackup						" Disable old-school backups, and
set noswapfile						" for good coder's sake use a repo :P
set sessionoptions+=unix,slash		" Moving back and forth to W? Make it easier
set nospell 						" I don't want it by default
set spelllang=en_us 				" Language will likely be English
set exrc               				" Allow tuning with local .vimrc files
set secure 							" and do it securely
autocmd WinLeave * set nocursorline " Highlight current line
autocmd WinEnter * set cursorline	" in current window
set nostartofline					" Don't move!
set lazyredraw						" Don't repaint while executing macros
set ttyfast 						" Improve?
set undodir=~/.vim/undos			" Where to save undos?
set undofile						" Persistence of undos is a nice feature
set undolevels=10000				" Max changes that can be undone
set undoreload=10000				" Max lines to save for undo after reload
let g:gundo_right=1					" What I expect of gundo!
let g:gundo_close_on_revert=1		" You don't want that window there always
let g:gundo_width = 82				" My preferred settings
let g:gundo_preview_height = 20


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"														   4) General behaviours
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = ',' 				" It's closer and easier
set backspace=indent,eol,start		" Common backspace function
set scrolloff=2						" Offsets screen limits
set noerrorbells 					" Nobody wants that :S
set visualbell						" I hate sound alerts but can live with this
set viminfo='500,f1,<500,s10,h		" Bigger viminfo may be better...
set history=500						" Let's be generous
set mouse=a							" Sorry, I like my touchpad. Not nerd enough
set showmatch						" {}()[]
set relativenumber					" Automagic line numbering
autocmd InsertEnter * :set number	" adapted to Insert/Normal modality needs
autocmd InsertLeave * :set relativenumber
set guioptions-=r 					" Disable scrollbars
set guioptions-=R					" This info is available at the statusbar
set guioptions-=l					" and the #s
set guioptions-=L
set guioptions-=T					" Hide toolbar
set listchars=tab:<-,trail:.,extends:#,nbsp:.,eol:$ " prettier, don't you think?
set whichwrap+=<,>,h,l,[,]			" Wrap navigation in normal and insert!
set clipboard=unnamed				" Yank will go to mac's clipboard


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"															 5) Text indentation
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype plugin indent on 			" Activate indentation
set autoindent smartindent 			" If you don't need indentation... TextEdit!
set tabstop=4 softtabstop=4			" 8 is too much for my eyes	 
set smarttab
set shiftwidth=4 					" Automatic indent must follow same rule
set noexpandtab 					" Tab is the new Tab ;)
vnoremap < <gv 						" Reselect after indent/outdent
vnoremap > >gv


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"																6) Text wrapping
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nowrap							" Wrap makes code uninteligible sometimes,
set linebreak						" but linebreaks help me to respect width.
set nolist							" list disables linebreak, default setting
set textwidth=80 					" Based on the historical 80 width
set colorcolumn=+1					" Visual cue
set formatoptions=tcrqnl 			" Pretty common setting +n
									" vimdoc.sf.net/htmldoc/change.html#fo-table


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"																 7) Text folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set foldmethod=manual				" Handy to control your own folds
set foldcolumn=1					" First column will show them
set nofoldenable					" Do not fold by default!
au BufWinLeave * silent! mkview 	" Manual folding is lost by default,
au BufWinEnter * silent! loadview	" but this will keep it :) /!\ If this saves
									" a faulty state will recover it as well :S
									" BTW, take a look at <space> shortcut below


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"															8) Theme + Statusbar
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set background=dark 				" This is my default, check <F5><F6> below,
colorscheme solarized				" they switch between Dark and Light
set guifont=Menlo\ for\ Powerline:h11
let g:Powerline_symbols = 'fancy' " start fancy, but:
let g:Powerline_dividers_override = ['', '', '', ''] " remove the ugly arrows


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"															 9) Search behaviour
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set ignorecase 						" normal search
set smartcase 						" smart case sensing
set incsearch 						" incremental search
set hlsearch 						" hl search results
"autocmd InsertEnter * :setlocal nohlsearch " do not highlight while editing
"autocmd InsertLeave * :setlocal hlsearch	" interferes with other settings :S
set magic 							" accept special characters on search terms
nmap n nzz							" center searches
nmap N Nzz
"nmap <silent> * *zz
"nmap <silent> # #zz


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"															  10) Autocompletion
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set wildmenu						" Autocompletion rulez
set wildignore+=*.a,*.o				" Leave out files from completion
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
set wildignore+=.DS_Store,.git,.hg,.svn
set wildignore+=*~,*.swp,*.tmp
set wildmode=list:longest,full
set completeopt=menu,longest,preview
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-n>"
let g:SuperTabLongestHighlight = 1
let g:SuperTabLongestEnhanced = 1
"let g:SuperTabMappingForward = <Tab>
"let g:SuperTabMappingBackward = <S-Tab>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"																	11) NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:NERDTreeShowBookmarks = 1
"let g:NERDTreeChDirMode = 2


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"													   12) OpenGL GLSL specifics
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd BufNewFile,BufRead *.c,*.cpp,*.cxx,*.cc set tags+=~/.vim/ctags/opengltags
autocmd BufNewFile,BufRead *.c,*.cpp,*.cxx,*.cc set tags+=~/.vim/ctags/gluttags
autocmd BufNewFile,BufRead *.frag.glsl,*.vert.glsl,*.geom.glsl setf glsl400
autocmd BufNewFile,BufRead *.vp,*.fp,*.gp,*.vs,*.fs,*.gs,*.tcs setf glsl400
autocmd BufNewFile,BufRead *.cs,*.vert,*.frag,*.geom,*.tess setf glsl400
autocmd BufNewFile,BufRead *.tes,*.shd,*.gls,*.glsl setf glsl400


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"															 13) Git integration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:Gitv_OpenHorizontal = 1
let g:Gitv_TruncateCommitSubjects = 1
let g:Gitv_PromptToDeleteMergeBranch = 1
cabbrev gitv Gitv


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"														   N-1) Useful functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! NumberToggle()
    if(&relativenumber == 1)
        set number
    else
        set relativenumber
    endif
endfunc

function! AutocloseOn()
	inoremap { {}<left>
	inoremap ( ()<left>
	inoremap [ []<left>
	inoremap " ""<left>
	inoremap ' ''<left>
endfunc
call AutocloseOn()

function! AutocloseOff()
	inoremap { {
	inoremap ( (
	inoremap [ [
	inoremap " "
	inoremap ' '
endfunc

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.' . a:extra_filter)
    elseif a:direction == 'r'
        call CmdLine("%s" . '/' . l:pattern . '/')
	elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif
	
    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"												   N) Personal Keyboard bindings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"	[F1] remove help functions
inoremap <silent> <F1> <ESC>:GundoToggle<CR>
nnoremap <silent> <F1> :GundoToggle<CR>
vnoremap <silent> <F1> <ESC>:GundoToggle<CR>

"	[F2] NERDTree toggle
nnoremap <silent> <F2> :NERDTreeToggle<CR>
inoremap <silent> <F2> <nop>

"	[F3] Paste mode (pasting code without breaking identation)
nnoremap <F3> :set invpaste<CR>					" Paste mode
set pastetoggle=<F3>

"   [F4] Gitv!
nnoremap <silent> <F4> :Gitv!<CR>
inoremap <silent> <F4> <nop>
vnoremap <silent> <F4> :Gitv!<CR>

"	[F5]
"	[F6] Switchin background Dark/Light
"		 (This may not be the best way to do it, but it's my workaround to make
"		 it work in the 3 modes)
nnoremap <silent> <F5> :set background=dark<CR>
inoremap <silent> <F5> <ESC>:set background=dark<CR>a
vnoremap <silent> <F5> <ESC>:set background=dark<CR>gv
nnoremap <silent> <F6> :set background=light<CR>
inoremap <silent> <F6> <ESC>:set background=light<CR>a
vnoremap <silent> <F6> <ESC>:set background=light<CR>gv

"	[F7] Show invisibles
nnoremap <silent> <F7> :set nolist!<CR>
inoremap <silent> <F7> <ESC>:set nolist!<CR>i
vnoremap <silent> <F7> <ESC>:set nolist!<CR>gv

"	[F8] Make on play button :P
nnoremap <F8> :make<CR>
inoremap <F8> <ESC>:make<CR>
vnoremap <F8> <ESC>:make<CR>

"	[F9]
"	[F10] Toggle autoclosing brackets
inoremap <F9> <ESC>:call AutocloseOn()<CR>i
inoremap <F10> <ESC>:call AutocloseOff()<CR>i

"	[Y] Yank until the end (as D does by default)
nnoremap Y y$

"	[Space] Toggle folds (useful! :D)
nnoremap <Space> za

"	[Cmd]+[N] 
"	[Cmd]+[1..9]
"		Tab switching «opa browser style»
"		(I've set Cmd-tab/Cmd-s-tab too! But they are a patch of menu.vim)
noremap <D-1> :tabn 1<CR> 	
noremap <D-2> :tabn 2<CR>
noremap <D-3> :tabn 3<CR>
noremap <D-4> :tabn 4<CR>
noremap <D-5> :tabn 5<CR>
noremap <D-6> :tabn 6<CR>
noremap <D-7> :tabn 7<CR>
noremap <D-8> :tabn 8<CR>
noremap <D-9> :tabn 9<CR>
inoremap <D-1> <nop>
inoremap <D-2> <nop>
inoremap <D-3> <nop>
inoremap <D-4> <nop>
inoremap <D-5> <nop>
inoremap <D-6> <nop>
inoremap <D-7> <nop>
inoremap <D-8> <nop>
inoremap <D-9> <nop>

" + hl disabling
" + visual selection search
" + visual replacement
" + buffer closing short
" Taken from https://github.com/amix/
nnoremap <silent> <leader><cr> :noh<cr>
vnoremap <silent> * :call VisualSelection('f','')<CR>
vnoremap <silent> # :call VisualSelection('b','')<CR>
vnoremap <silent> <leader>r :call VisualSelection('r','')<CR>
map <leader>bd :Bclose<cr>

"	[,]+[n] Line numbering mode toggle
"			(Relative is better for normal mode, but sometimes is useful abs)
nnoremap <silent> <leader>n :call NumberToggle()<CR>

" [Ctrl]+[h,j,k,l] Easy navigation of splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"													  N+1) Other practical stuff
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Format human files accordingly :)
autocmd FileType mail,human setlocal formatoptions+=tna spell spelllang=en
autocmd FileType text,markdown setlocal formatoptions+=tna spell spelllang=en

" Auto-jump to the last known position when reopening
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | 
	\ exe "normal! g'\"" | endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"													 N+2) Deal with common typos
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

iabbr witdh width
iabbr withd width
iabbr widht width
iabbr heith height
iabbr heigth height


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"																		The end. --> Happy hacking!
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
