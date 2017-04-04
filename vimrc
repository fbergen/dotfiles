set nocompatible
set smartindent

syntax on
" filetype on
filetype plugin on

set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set paste
set nu
set wildmode=longest,list
set timeoutlen=1000 ttimeoutlen=0
set winaltkeys=no

nmap <LEADER>d "_d
noremap H :tabp<CR>
noremap L :tabn<CR>
noremap <C-Up> :wincmd k<CR>
noremap <C-Down> :wincmd j<CR>
noremap <C-Left> :wincmd h<CR>
noremap <C-Right> :wincmd l<CR>
noremap <C-k> :wincmd k<CR>
noremap <C-j> :wincmd j<CR>
noremap <C-h> :wincmd h<CR>
noremap <C-l> :wincmd l<CR>
if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

nnoremap ,p "0p
nnoremap ,P "0P
nnoremap ,d "_d

