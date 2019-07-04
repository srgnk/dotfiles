set background=dark
set showcmd
set nu
set nowrap

set incsearch
"set nohlsearch
set hlsearch
set scrolljump=7
set scrolloff=7

"set mouse=a
"set mousemodel=popup

set hidden

set shell=bash\ --login

set autoindent

syntax on
set backspace=indent,eol,start whichwrap+=<,>,[,]

" By default, use spaced tabs.
set expandtab

" Display tabs as 4 spaces wide. When expandtab is set, use 4 spaces.
set shiftwidth=4
set softtabstop=4
set tabstop=4

" Pathogen stuff: https://github.com/tpope/vim-pathogen
"execute pathogen#infect()
filetype plugin indent on

" http://unix.stackexchange.com/questions/63196/in-vim-how-can-i-automatically-determine-whether-to-use-spaces-or-tabs-for-inde
" Determines whether to use spaces or tabs on the current buffer.
function TabsOrSpaces()
    if getfsize(bufname("%")) > 256000
        " File is very large, just use the default.
        return
    endif

    let numTabs=len(filter(getbufline(bufname("%"), 1, 250), 'v:val =~ "^\\t"'))
    let numSpaces=len(filter(getbufline(bufname("%"), 1, 250), 'v:val =~ "^ "'))

    if numTabs > numSpaces
        setlocal noexpandtab
        setlocal tabstop=8
        setlocal softtabstop=0
        setlocal shiftwidth=8
    endif
endfunction

" Call the function after opening a buffer
autocmd BufReadPost * call TabsOrSpaces()

set statusline=%<%f%h%m%r\ %b\ %{&encoding}\ 0x\ \ %l,%c%V\ %P 
set laststatus=2

set smartindent

set fo+=cr


" my funcitons
" function !MyComment()
"  let list = matchlist(getline("."), '^\(\ *\)\?\(#\)\?\(\ \)\?\(\ *\)\?\(.*\)')
"  if list[2] == "#"
"    call setline(".", list[1].list[4].list[5])
"  else
"    call setline(".", list[1]."# ".list[5])
"  endif
" endfunction

" jummp to last position when reopening file
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" hot keys
"vmap <C-z> u
"vmap <C-C> "+yi
"imap <C-V> <esc>"+gPi
"imap <C-C> <esc>:call Comment()<cr>o
"imap <C-C> <esc>:call MyComment()<cr>a<down>

map <S-Insert> <MiddleMouse>

"" F2
"nmap <F2> :w<cr>
"vmap <F2> <esc>:w<cr>i
"imap <F2> <esc>:w<cr>i
"
"" F3
"nmap <F3> :copen<cr>
"vmap <F3> <esc>:copen<cr>
"imap <F3> <esc>:copen<cr>
"
"" F9 make
"map <F9> :make<cr>
"vmap <F9> <esc>:make<cr>i
"imap <F9> <esc>:make<cr>i
"

" netrw file browser section from https://shapeshed.com/vim-netrw/
" change default fs view to tree
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 20
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END
