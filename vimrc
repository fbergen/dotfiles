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

" GO integration
Plug 'fatih/vim-go'

" Rust stuff
Plug 'rust-lang/rust.vim'

" fuzzy search for files using ctrl+p
Plug 'kien/ctrlp.vim'

" Color scheme
Plug 'ayu-theme/ayu-vim'

" Statusbar
" Plug 'vim-airline/vim-airline'
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'

" Asyncronous linting
Plug 'w0rp/ale'

" jedi-vim
Plug 'davidhalter/jedi-vim'

" eunuch
Plug 'tpope/vim-eunuch'

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

set wildignore+=*/.git/*,*/tmp/*,*.swp

if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif


" Ale config
let g:ale_linters_explicit = 1
let g:ale_linters = {
\   'python': ['flake8', 'mypy'],
\  }

let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   'python': ['isort'],
\}

" Only run linters on save
let g:ale_lint_on_text_changed = 'never'
" mypy doesn't pick up modules in virtual env, and if I add the path it takes
" super long time, so ignore missing imports for now.
let g:ale_python_mypy_options = '--ignore-missing-imports'

" Statusbar
" Let airline show errors
" let g:airline#extensions#ale#enabled = 1
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'absolutepath', 'modified', 'helloworld' ] ],
      \   'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ],
      \             [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ]],
      \ },
      \ }


let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }

let g:lightline.component_type = {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left',
      \ }


let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_warnings = "\uf071"
let g:lightline#ale#indicator_errors = "\uf05e"
let g:lightline#ale#indicator_ok = "\uf00c"

" Rust config
let g:rustfmt_autosave = 1


" Jedi configs
" Disable autocompletions
let g:jedi#completions_enabled = 0
" Open definitions in new tabs
let g:jedi#use_tabs_not_buffers = 1


set directory^=$HOME/.vim/tmp//
