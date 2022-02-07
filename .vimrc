"============================================================
" Plugins
"============================================================
" List of plugins that I use:
" + ctrlp
" + vim-airline
" + dracula colour theme
" + nerdtree
" + vim-bufferline
" + pathogen
" + typescript-vim
" + vim-jsx-improve
" + vim-prettier

set runtimepath^=~/.vim/bundle/ctrlp.vim
set runtimepath^=~/.vim/bundle/vim-airline/plugin/airline.vim

"============================================================
" settings
"============================================================
set omnifunc=syntaxcomplete#Complete
syntax on
color dracula
set smartindent
set clipboard=unnamed " use os clipboard
set shiftwidth=2 " number of spaces when shift indenting
set tabstop=2 " number of visual spaces per tab
set softtabstop=2 " number of spaces in tab when editing
set number " show line numbers
set cursorline  " highlight current line
set showmatch " highlight matching [{()}]
set incsearch " search as characters are entered
set hlsearch " highlight matches
let g:ctrlp_working_path_mode = 'r'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/* " lol
let g:ctrlp_show_hidden=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " autoquit if only nerdtree is open
set noswapfile
let g:jsx_ext_required=0

let mapleader = ","

" 4 space indent for somes file types
"autocmd Filetype javascript setlocal ts=4 sts=4 sw=4
autocmd Filetype swift setlocal ts=4 sts=4 sw=4

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

" airline settings
"let g:airline_theme = 'base16-dracula'
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#branch#enabled = 1
let g:airline_left_sep = ' ❤  '
let g:airline_right_sep = ' 🟆  '
let g:airline_section_warning = ''
let g:airline_section_y = ''
let g:airline_section_x = ''
set laststatus=2 " for airline

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" move between buffers - not working yet
map <C-Left> <Esc>:bprev<CR>
map <C-Right> <Esc>:bnext<CR>
"nnoremap bh :bprev<CR>
"nnoremap bl :bnext<CR>

" Ctrl-b to toggle NERD Tree
map <C-b> :NERDTreeToggle<CR>

" switch to left / right split
map <C-h> <C-W>h
map <C-l> <C-W>l

"tab stuff
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap td  :tabclose<CR>
nnoremap tn  :tabnew<CR>
" open new tab and select a file to open
map <c-t> :tabnew<cr><c-p>

"ale settings
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier','eslint'],
\}
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1

"swift
nnoremap <leader>sb :!swift %<CR>

"syntax
let g:syntastic_swift_swiftlint_use_defaults = 1
"let g:syntastic_swift_checkers = ['swiftlint', 'swiftpm']
let g:syntastic_swift_checkers = ['swiftpm']

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" Coc Settings
" Then you can use :Prettier to format the current buffer.
command! -nargs=0 Prettier :CocCommand prettier.formatFile

vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-@> coc#refresh()
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" pathogen start
execute pathogen#infect()
call pathogen#helptags()

filetype plugin indent on

set noruler
set noshowmode
set hidden
