let mapleader=","

""""""""""""
" Packages "
""""""""""""
if &compatible
  " `:set nocp` has many side effects. Therefore this should be done
  " only when 'compatible' is set.
  set nocompatible
endif

set packpath^=~/.vim
packadd minpac
call minpac#init()

call minpac#add('k-takata/minpac', {'type': 'opt'})

call minpac#add('dracula/vim', {'as': 'dracula'})
"call minpac#add('morhetz/gruvbox')
"call minpac#add('altercation/vim-colors-solarized')

call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-unimpaired')
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-commentary')
call minpac#add('machakann/vim-highlightedyank')
call minpac#add('airblade/vim-gitgutter')

call minpac#add('junegunn/fzf')
call minpac#add('junegunn/fzf.vim')
call minpac#add('mileszs/ack.vim')

call minpac#add('itchyny/lightline.vim')
call minpac#add('terryma/vim-multiple-cursors')
call minpac#add('scrooloose/nerdtree')
call minpac#add('moll/vim-bbye')
call minpac#add('junegunn/goyo.vim')
call minpac#add('mhinz/vim-startify')
call minpac#add('luochen1990/rainbow')
call minpac#add('Yggdroot/indentLine')

" Track the engine.
call minpac#add('SirVer/ultisnips')
" Snippets are separated from the engine. Add this if you want them:
call minpac#add('phux/vim-snippets')

call minpac#add('ncm2/ncm2')
call minpac#add('ncm2/ncm2-ultisnips')
call minpac#add('roxma/nvim-yarp')
call minpac#add('roxma/vim-hug-neovim-rpc')
call minpac#add('ncm2/ncm2-bufword')
call minpac#add('ncm2/ncm2-path')
call minpac#add('w0rp/ale')

" HTML
call minpac#add('othree/html5.vim')
call minpac#add('tpope/vim-ragtag')
call minpac#add('alvan/vim-closetag')

" CSS
call minpac#add('hail2u/vim-css3-syntax')
call minpac#add('ap/vim-css-color')
call minpac#add('cakebaker/scss-syntax.vim')
call minpac#add('groenewege/vim-less')
call minpac#add('othree/csscomplete.vim')

" Javascript
call minpac#add('prettier/vim-prettier', {'do': 'yarn install',
      \'for': [
      \'javascript', 'typescript', 'css', 'less', 'scss',
      \'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'
      \]})
call minpac#add('ncm2/ncm2-tern', {'do': 'yarn install'})

" PHP
"call minpac#add('StanAngeloff/php.vim', {'for': 'php'})
"call minpac#add('phpactor/phpactor', {'do': ':call phpactor#Update()', 'for': 'php'})
"call minpac#add('phpactor/ncm2-phpactor', {'for': 'php'})
"call minpac#add('adoy/vim-php-refactoring-toolbox', {'for': 'php'})
"call minpac#add('arnaud-lb/vim-php-namespace', {'for': 'php'})
"call minpac#add('alvan/vim-php-manual', {'for': 'php'})

" Python
call minpac#add('ncm2/ncm2-jedi', {'for': 'python'})

" R
call minpac#add('jalvesaq/Nvim-R')
call minpac#add('gaalcaras/ncm-R')

""""""""""
" Basics "
""""""""""
filetype plugin indent on
syntax enable
color dracula

set number relativenumber
set hidden
set encoding=utf-8
" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
set splitbelow splitright

" show existing tab with 2 spaces width
set tabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2
" On pressing tab, insert 2 spaces
set expandtab

set t_Co=256
set incsearch
set nojoinspaces
set scrolloff=3

" Auto save files when focus is lost
au FocusLost * silent! wa
" Save on buffer switch
set autowriteall

" Reload window
nnoremap <F5> :edit!<CR>

"search for the next occurrence of a select text
vnoremap // y/\V<C-r>=escape(@",'/\')<CR><CR>
nnoremap // yiw/\V<C-r>=escape(@",'/\')<CR><CR>
vnoremap <M-/> "hy:%s/<C-r>h//gc<left><left><left>
" Toggle the search highlighting state on or off persistently
nnoremap <F3> :set hlsearch! hlsearch?<CR>

" Source current file
nnoremap  <silent> <Leader>so  :so %<CR>

" Save / Quit
noremap  <silent> <Leader>s  :w<CR>
vnoremap <silent> <Leader>s  <C-C>:w<CR>
inoremap <silent> <Leader>s  <C-O>:w<CR>

noremap <silent> <Leader>w   :Bdelete<CR>
noremap <silent> <Leader>q   :q<CR>

" Window navigation
tnoremap <ESC> <C-\><C-n>
tnoremap <M-h> <C-\><C-n><C-w>h
tnoremap <M-j> <C-\><C-n><C-w>j
tnoremap <M-k> <C-\><C-n><C-w>k
tnoremap <M-l> <C-\><C-n><C-w>l

nnoremap <M-h> <C-w>h
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-l> <C-w>l
nnoremap <M-S-h> <C-w>H
nnoremap <M-S-j> <C-w>J
nnoremap <M-S-k> <C-w>K
nnoremap <M-S-l> <C-w>L

" Tab navigation
nnoremap th  :tabfirst<CR>
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>

" Copy selected text to system clipboard (requires gvim/nvim/vim-x11 installed):
vnoremap <C-c> "+y
map <C-v> "+P

""""""""""
" minpac "
""""""""""
command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()
command! PackStatus packadd minpac | source $MYVIMRC | call minpac#status()

"""""""""""
" fzf.vim "
"""""""""""
let g:fzf_command_prefix = 'Fzf'
let g:fzf_layout = { 'down': '~30%' }

map <C-p> :FzfGFiles<CR>
map <C-o> :FzfBuffers<CR>

"""""""""""""
" lightline "
"""""""""""""
set laststatus=2
set showtabline=2
set noshowmode

" let g:lightline = {
"       \ 'colorscheme': 'gruvbox',
"       \ }

""""""""""""""""""""""""
" vim-multiple-cursors "
""""""""""""""""""""""""

""""""""""""
" nerdTree "
""""""""""""
map <C-e> :NERDTreeToggle<CR>
map <Leader>r :NERDTreeFind<CR>

""""""""
" goyo "
""""""""
map <Leader>f :Goyo \| set linebreak<CR>

""""""""""""
" startify "
""""""""""""
let g:startify_bookmarks = [
      \{'v': '~/dotfiles/.nvimrc'},
      \{'z': '~/dotfiles/.zshrc'},
      \{'i': '~/dotfiles/.i3/config'},
      \{'d': '~/dotfiles'},
      \]
let g:startify_files_number = 5

"""""""""""
" rainbow "
"""""""""""
let g:rainbow_active = 1

"""""""""""""
" utilsnips "
"""""""""""""
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-b>"
let g:UltiSnipsJumpBackwardTrigger="<C-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


" parameter expansion for selected entry via Enter
inoremap <silent> <expr> <CR> (pumvisible() ? ncm2_ultisnips#expand_or("\<CR>", 'n') : "\<CR>")

"let g:ultisnips_php_scalar_types = 1
"command! -nargs=1 silent execute ':silent !'.<q-args> | execute ':redraw!'
"map <C-F> <ESC>:w<CR>:silent php-cs-fixer fix %:p --config=~/.php_cs<CR>

""""""""
" ncm2 "
""""""""
let g:python_host_prog="/home/fnandogp/.pyenv/versions/nvim2/bin/python"
let g:python3_host_prog="/home/fnandogp/.pyenv/versions/nvim3/bin/python"

" enable ncm2 for all buffer
autocmd BufEnter * call ncm2#enable_for_buffer()
" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect
" supress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=c
" enable auto complete for `<backspace>`, `<C-w>` keys.
" known issue https://github.com/ncm2/ncm2/issues/7
"au TextChangedI * call ncm2#auto_trigger()
" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <C-c> <ESC>
" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
inoremap <expr> <CR> (pumvisible() ? "\<C-y>" : "\<CR>")
" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" wrap existing omnifunc
" Note that omnifunc does not run in background and may probably block the
" editor. If you don't want to be blocked by omnifunc too often, you could
" add 180ms delay before the omni wrapper:
"  'on_complete': ['ncm2#on_complete#delay', 180,
"               \ 'ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
au User Ncm2Plugin call ncm2#register_source({
      \ 'name' : 'css',
      \ 'priority': 9,
      \ 'subscope_enable': 1,
      \ 'scope': ['css','scss'],
      \ 'mark': 'css',
      \ 'word_pattern': '[\w\-]+',
      \ 'complete_pattern': ':\s*',
      \ 'on_complete': ['ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
      \ })

"""""""
" ale "
"""""""
let g:ale_fix_on_save = 1
let g:ale_fixers = {
      \   '*': ['trim_whitespace'],
      \}

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

"""""""""""""""""""
" csscomplete.vim "
"""""""""""""""""""
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS noci

