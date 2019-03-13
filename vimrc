" Install vim-plug for both vim and nvim
if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!mkdir -p ~/.vim/autoload/'
    execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif
if empty(glob("~/.local/share/nvim/site/autoload/plug.vim"))
    execute '!mkdir -p ~/.local/share/nvim/site/autoload/'
    execute '!curl -fLo ~/.local/share/nvim/site/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif


call plug#begin()

" NERDTree
Plug 'scrooloose/nerdtree'

" GO integration
Plug 'fatih/vim-go'

" fuzzy search for files using ctrl+p
Plug 'kien/ctrlp.vim'

" Color scheme
Plug 'ayu-theme/ayu-vim'

" Statusbar
Plug 'vim-airline/vim-airline'

" Asyncronous linting
Plug 'w0rp/ale'

call plug#end()

" Install plugins on start
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif


set termguicolors     " enable true colors support
let ayucolor="dark"   " for dark version of theme
colorscheme ayu

syntax on
" filetype on
filetype plugin indent on

" show existing tab with 4 spaces width
set tabstop=2
" when indenting with '>', use 4 spaces width
set shiftwidth=2
" On pressing tab, insert 4 spaces
set expandtab

" set autoindent
set nu
set wildmode=longest,list
set timeoutlen=1000 ttimeoutlen=0
set winaltkeys=no
" Remove trailing whitespace
autocmd FileType python autocmd BufWritePre <buffer> %s/\s\+$//e


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


set backspace=indent,eol,start

let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("h")': ['<cr>'],
    \ }
let g:ctrlp_custom_ignore = {
  \ 'vcs' : '\v[\/]\.(git|hg|svn|)$',
  \ 'dir': 'venv\|node_modules',
  \ }

" Ale config
" Check Python files with pylint.
let b:ale_linters = ['pylint', 'mypy']
" Let airline show errors
let g:airline#extensions#ale#enabled = 1
" Only run linters on save
let g:ale_lint_on_text_changed = 'never'
" Imports are weird for now... disable them...
let g:ale_python_mypy_options = '--ignore-missing-imports'

" NerdTree
map <C-n> :NERDTreeToggle<CR>
autocmd vimenter * NERDTree
" Close vim if no other buffer than nerdtree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

set directory^=$HOME/.vim/tmp//
