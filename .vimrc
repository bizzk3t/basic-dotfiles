if empty(glob('~/.vim/autoload/plug.vim'))
        silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged/')
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'tyru/caw.vim'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
call plug#end()

set nocompatible

let mapleader="\<Space>"
set background=dark
set termguicolors
set t_Co=256

filetype plugin indent on
syntax on

colorscheme will

set completeopt=menu,menuone,popup
set shortmess-=S
set autochdir
set autoread
set autowrite
set backspace=indent,eol,start
set formatoptions=croqlj
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set history=1000
set noerrorbells
set noshowmode
set nowrap
set nostartofline
set cmdheight=2
set showtabline=2
set cmdheight=1
set laststatus=2
set display+=lastline
set ruler
set number
set incsearch
set hlsearch
set ignorecase
set smartcase

set mouse=a

set sidescrolloff=5
set scrolloff=1

set shiftround
set shiftwidth=8
set shiftround

set autoindent
set cindent
set smartindent

set expandtab
set smarttab
set softtabstop=8
set tabstop=8
set textwidth=0

set splitbelow
set splitright

set title

set wildmenu
set wildignorecase

set timeoutlen=1000
set ttimeoutlen=100
set ttyfast
set ttimeout

let &t_ZH = "\e[3m"   
let &t_ZR = "\e[23m"  
let &t_EI = "\e[2 q"
let &t_SR = "\e[3 q" 
let &t_SI = "\e[5 q" 

iabbrev funciton function
iabbrev funv func
iabbrev funviton function
iabbrev funvtion function
iabbrev functnion function
iabbrev funciotn function
iabbrev italix italic
iabbrev somethign something
iabbrev aslisi alias
iabbrev aslias alias
iabbrev aslisi alias
iabbrev slias alias
iabbrev aslis alias
iabbrev alisa alias
iabbrev teh the

function! Redir(cmd, rng, start, end)
        for win in range(1, winnr('$'))
                if getwinvar(win, 'scratch')
                        execute win . 'windo close'
                endif
        endfor
        if a:cmd =~ '^!'
                let cmd = a:cmd =~' %'
                        \ ? matchstr(substitute(a:cmd, ' %', ' ' . expand('%:p'), ''), '^!\zs.*')
                        \ : matchstr(a:cmd, '^!\zs.*')
                if a:rng == 0
                        let output = systemlist(cmd)
                else
                        let joined_lines = join(getline(a:start, a:end), '\n')
                        let cleaned_lines = substitute(shellescape(joined_lines), "'\\\\''", "\\\\'", 'g')
                        let output = systemlist(cmd . " <<< $" . cleaned_lines)
                endif
        else
                redir => output
                execute a:cmd
                redir END
                let output = split(output, "\n")
        endif
        vnew
        let w:scratch = 1
        setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile
        call setline(1, output)
endfunction
command! -nargs=1 -complete=command -bar -range Redir silent call Redir(<q-args>, <range>, <line1>, <line2>)
command! FormatJSON %!python3 -m json.tool
command! JsonSort exe 'normal :%!jq --sort-keys .<CR>'

function! SyntaxItem() abort
        return synIDattr(synID(line('.'), col('.'), 1), 'name') . ' -> '
                                \ . synIDattr(synID(line('.'), col('.'), 0), 'name') . ' -> '
                                \ . synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
endfunction
nnoremap <Leader>hi :echo SyntaxItem()<CR>

nnoremap n nzz
nnoremap N Nzz

nnoremap <C-o> <C-o>zz
nnoremap <C-i> <C-i>zz
nnoremap <C-]> <C-]>zz
inoremap <C-j> <Nop>

nnoremap <Leader>q q
nnoremap q <Nop>
map Q gq

cnoremap <C-p> <Up>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>

vnoremap > >gv
vnoremap < <gv
vnoremap gu <Nop>
vnoremap gU <Nop>
vnoremap <Leader>gu gu
vnoremap <Leader>gU gU
nnoremap <Leader>ff :ALEFix<CR>

nnoremap <Leader>K K
map K <Nop>
nnoremap <silent> <Leader>no :set hlsearch!<CR>

noremap <Leader>pp "*p
noremap <Leader>yy "*y
nnoremap <Leader>Y "*Y

nnoremap <Leader>pi :PlugInstall<CR>
nnoremap <Leader>pc :PlugClean!<CR>
nnoremap <Leader>pu :PlugUpdate<CR>

inoremap jl <Esc>
inoremap jk <Esc>
inoremap jK <Esc>
inoremap Jk <Esc>
inoremap JK <Esc>

nnoremap <silent> <CR> za

augroup filetype_help
        autocmd!
        au Filetype help nnoremap <nowait><buffer> d <C-d>
        au Filetype help nnoremap <nowait><buffer> u <C-u>
        au Filetype help nnoremap <silent> <buffer>   <Tab> /\('\zs\k\+'\\|[<Bar>]\zs\k\+[<Bar>]\)<CR>:set nohlsearch<CR>
        au FileType help nnoremap <silent> <buffer> <S-Tab> ?\('\zs\k\+'\\|[<Bar>]\zs\k\+[<Bar>]\)<CR>:set nohlsearch<CR>
        au FileType help nnoremap <silent> <buffer> <BS> <C-o>
        au FileType help nnoremap <silent> <buffer> <CR> <C-]>
        au FileType help setlocal nohlsearch
        au Filetype help nnoremap <buffer> q :q<CR>
augroup END
