let mapleader=','

""""""""""""
" Packages "
""""""""""""
if &compatible
  " `:set nocp` has many side effects. Therefore this should be done
  " only when 'compatible' is set.
  set nocompatible
endif

set packpath^=~/.vim
set runtimepath^=~/.vim/UtilSnips

packadd minpac
call minpac#init()

call minpac#add('k-takata/minpac', {'type': 'opt'})

" Theme
call minpac#add('cocopon/iceberg.vim')

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
call minpac#add('ryanoasis/vim-devicons')
call minpac#add('moll/vim-bbye')
call minpac#add('junegunn/goyo.vim')
call minpac#add('mhinz/vim-startify')
call minpac#add('Yggdroot/indentLine')
call minpac#add('ludovicchabant/vim-gutentags')

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
call minpac#add('alvan/vim-closetag')
call minpac#add('Valloric/MatchTagAlways')
call minpac#add('mattn/emmet-vim')

" CSS
call minpac#add('hail2u/vim-css3-syntax')
call minpac#add('ap/vim-css-color')
" call minpac#add('cakebaker/scss-syntax.vim')
" call minpac#add('groenewege/vim-less')
call minpac#add('othree/csscomplete.vim')

" JSON
call minpac#add('elzr/vim-json')

" Javascript
call minpac#add('pangloss/vim-javascript', {'for': 'javascript'})
call minpac#add('mxw/vim-jsx', {'for': 'javascript'})
call minpac#add('ncm2/ncm2-tern', {
      \'for': 'javascript',
      \'do': 'yarn install && npm i -g tern'
      \})

" PHP
call minpac#add('StanAngeloff/php.vim', {'for': 'php'})
call minpac#add('phpactor/phpactor', {'do': 'composer install', 'for': 'php'})
call minpac#add('phpactor/ncm2-phpactor', {'for': 'php'})
"call minpac#add('adoy/vim-php-refactoring-toolbox', {'for': 'php'})
"call minpac#add('arnaud-lb/vim-php-namespace', {'for': 'php'})
call minpac#add('alvan/vim-php-manual', {'for': 'php'})

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
" color dracula
color iceberg

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

" Simulate Home and End keys
noremap  <Home> g^
inoremap <Home> <C-o>g^
noremap  <End>  g$
inoremap <End>  <C-o>g$
noremap  <C-h>  g^
inoremap <C-h>  <C-o>g^
noremap  <C-l>  g$
inoremap <C-l>  <C-o>g$

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

" Window resize
nnoremap <silent> <M-+> :resize +10 <CR>
nnoremap <silent> <M-_> :resize -10 <CR>
nnoremap <silent> <M-}> :vertical resize +10 <CR>
nnoremap <silent> <M-{> :vertical resize -10 <CR>

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

" Open terminal
nnoremap <Leader>term :vsp \| term<CR>i

""""""""""
" minpac "
""""""""""
command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()
command! PackStatus packadd minpac | source $MYVIMRC | call minpac#status()

"""""""""""
" fzf.vim "
"""""""""""
let $FZF_DEFAULT_COMMAND='fd --type=f --hidden --ignore-case --exclude=.git'
let g:fzf_command_prefix=''

map <C-p> :Files<CR>
map <C-o> :Buffers<CR>

autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" Command for git grep
" - fzf#vim#grep(command, with_column, [options], [fullscreen])
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   { 'dir': systemlist('git rev-parse --show-toplevel')[0] }, <bang>0)

" Override Colors command. You can safely do this in your .vimrc as fzf.vim
" will not override existing commands.
command! -bang Colors
  \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'}, <bang>0)

" Augmenting Ag command using fzf#vim#with_preview function
"   * fzf#vim#with_preview([[options], [preview window], [toggle keys...]])
"     * For syntax-highlighting, Ruby and any of the following tools are required:
"       - Bat: https://github.com/sharkdp/bat
"       - Highlight: http://www.andre-simon.de/doku/highlight/en/highlight.php
"       - CodeRay: http://coderay.rubychan.de/
"       - Rouge: https://github.com/jneen/rouge
"
"   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Ag! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

" Override Colors command. You can safely do this in your .vimrc as fzf.vim
" will not override existing commands.
command! -bang Colors
  \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'}, <bang>0)

" Augmenting Ag command using fzf#vim#with_preview function
"   * fzf#vim#with_preview([[options], [preview window], [toggle keys...]])
"     * For syntax-highlighting, Ruby and any of the following tools are required:
"       - Bat: https://github.com/sharkdp/bat
"       - Highlight: http://www.andre-simon.de/doku/highlight/en/highlight.php
"       - CodeRay: http://coderay.rubychan.de/
"       - Rouge: https://github.com/jneen/rouge
"
"   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Ag! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" Likewise, Files command with preview window
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

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
" nerdtree "
""""""""""""
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1

map <C-e> :NERDTreeToggle<CR>
"map <Leader>r :NERDTreeFind<CR>

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

nmap <Leader>S :Startify<CR>

"""""""""""""
" utilsnips "
"""""""""""""
let g:UltiSnipsSnippetDirectories=['UtilSnips']
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
let g:UltiSnipsEditSplit="vertical"


" parameter expansion for selected entry via Enter
inoremap <silent> <expr> <CR> (pumvisible() ? ncm2_ultisnips#expand_or("\<CR>", 'n') : "\<CR>")

"let g:ultisnips_php_scalar_types = 1
"command! -nargs=1 silent execute ':silent !'.<q-args> | execute ':redraw!'
"map <C-F> <ESC>:w<CR>:silent php-cs-fixer fix %:p --config=~/.php_cs<CR>

""""""""
" ncm2 "
""""""""
let g:python_host_prog='/home/fnandogp/.pyenv/versions/nvim2/bin/python'
let g:python3_host_prog='/home/fnandogp/.pyenv/versions/nvim3/bin/python'

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
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%][%severity%] %s'

nnoremap <Leader>f :ALEFix<CR>

""""""""""""""""
" vim-closetag "
""""""""""""""""
" These are the file extensions where this plugin is enabled.
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.php,*.jsx'

" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
let g:closetag_emptyTags_caseSensitive = 1

" Disables auto-close if not in a "valid" region (based on filetype)
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }

" Add > at current position without closing the current tag, default is ''
let g:closetag_close_shortcut = '<Leader>>'

"""""""""""""""""""
" csscomplete.vim "
"""""""""""""""""""
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS noci

""""""""""""""""""
" MatchTagAlways "
""""""""""""""""""
let g:mta_filetypes = {
    \'javascript.jsx': 1,
    \ 'html' : 1
    \}

"""""""""""""
" emmet.vim "
"""""""""""""
"let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
      \  'javascript.jsx' : {
      \      'extends' : 'jsx',
      \  },
      \}

""""""""""""
" vim-json "
""""""""""""
let g:vim_json_syntax_conceal = 0

"""""""""""
" vim-jsx "
"""""""""""
let g:jsx_ext_required = 1
