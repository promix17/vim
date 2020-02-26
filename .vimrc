set nocompatible

set t_Co=256
"colorscheme default
colorscheme paper_color

syntax on

set noswapfile
set nobackup
set number
set nowrap
set autoindent
set smartindent

filetype on
filetype plugin on
filetype indent on

" set tabstop=4 softtabstop=0 noexpandtab shiftwidth=4
set shiftwidth=2 tabstop=2 expandtab

nnoremap <C-j> <C-w>j
nnoremap <C-h> <C-w>h
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <C-i> gT
nnoremap <C-o> gt

nnoremap <C-u> <C-u>
nnoremap <C-m> <C-d>

let mapleader = " "

nnoremap <leader>d :tab split<CR>
nnoremap <leader>v :vsp<CR>
nnoremap <leader>s :sp<CR>
nnoremap <leader>n :tabnew<CR>
nnoremap <leader>m :NERDTreeTabsToggle<CR>

nnoremap <leader>t :Tabularize /=<CR>
nnoremap <leader>= :Tabularize /=><CR>:Tabularize/\(:.*\)\@<!:\zs /l0<CR>

nnoremap <leader>0 :tabmove 0<CR>
nnoremap <leader>1 :tabmove 1<CR>
nnoremap <leader>2 :tabmove 2<CR>
nnoremap <leader>3 :tabmove 3<CR>
nnoremap <leader>4 :tabmove 4<CR>
nnoremap <leader>5 :tabmove 5<CR>
nnoremap <leader>6 :tabmove 6<CR>
nnoremap <leader>7 :tabmove 7<CR>
nnoremap <leader>8 :tabmove 8<CR>
nnoremap <leader>9 :tabmove 9<CR>

nnoremap <leader>l :IndentLinesToggle<CR>

let g:nerdtree_tabs_open_on_console_startup = 1
let g:indentLine_enabled = 0

autocmd FileType ruby   setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType groovy setlocal shiftwidth=4 tabstop=4 expandtab
autocmd FileType c      setlocal shiftwidth=4 tabstop=4 expandtab
autocmd FileType cpp    setlocal shiftwidth=4 tabstop=4 expandtab
autocmd FileType go     setlocal shiftwidth=4 tabstop=4 softtabstop=0 noexpandtab

nnoremap <leader><CR> a<CR><Esc>

" hightlight lines with len > 80
au BufWinEnter * let w:too_big_line_len     = matchadd('ErrorMsg', '\%>80v.\+', -1)
" highlight trailing spaces
au BufNewFile,BufRead * let w:trailing_ws   = matchadd('ErrorMsg', '\s\+$', -1)
" highlight tabs between spaces
au BufNewFile,BufRead * let w:tab_before_sp = matchadd('ErrorMsg', '\v(\t+)\ze( +)', -1)
au BufNewFile,BufRead * let w:tab_after_sp  = matchadd('ErrorMsg', '\v( +)\zs(\t+)', -1)


set pastetoggle=<F2>
nnoremap <silent> <F3> :%s/\s\+$//<CR>:let @/=''<CR>
nnoremap <silent> <F4> :retab<CR>
nnoremap <silent> <F5> :match Error /\t/<CR>

set wildignore+=*/coverage/**
set wildignore+=*/vendor/**
" Smart search
function! Find(word)
  tabnew
  execute ':vimgrep /'.a:word.'/gj ./**/*'
  execute ':cw'
  execute ':.cc'
  execute "normal! zR"
endfunction

" Search current word
function! FindCurrent()
  call Find(expand("<cword>"))
endfunction

:command! -nargs=1 Find call Find('<args>')
:command! -nargs=1 F    call Find('<args>')

nnoremap <leader>w :call FindCurrent()<CR>

nnoremap <leader>e :.cc<CR>zR
nnoremap <leader>j <C-w>jj:.cc<CR>zR
nnoremap <leader>k <C-w>jk:.cc<CR>zR

nnoremap <leader>c :set cursorline<CR>:set cursorcolumn<CR>

set foldmethod=indent

let g:bookmark_save_per_working_dir = 1
let g:bookmark_auto_save = 1

nnoremap <C-n> zr
nnoremap <C-b> zm

nnoremap <leader>z :CommandT<CR>
nnoremap <leader>x :RuboCop<CR>
nnoremap <leader>o $v%lohc<CR><CR><Up><C-r>"<Esc>:s/,/,\r/g<CR>:'[,']norm ==<CR>
nnoremap <leader>h :s/:\([^ ]*\)\(\s*\)=>/\1:/g<CR>
vnoremap <leader>h :s/:\([^ ]*\)\(\s*\)=>/\1:/g<CR>
nnoremap <leader>q :s/"/'/g<CR>
vnoremap <leader>q :s/"/'/g<CR>

nnoremap <leader>b :%!xxd<CR>
nnoremap <leader>B :%!xxd -r<CR>

execute pathogen#infect()
