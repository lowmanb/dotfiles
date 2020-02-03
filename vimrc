" Compatable with vim and nvim
" Corresponding contents of ~/.config/nvim/init.vim:
"   set runtimepath^=~/.vim runtimepath+=~/.vim/after
"   let &packpath = &runtimepath
"   source ~/.vimrc
 
" PLUGINS

if exists('*minpac#init')
  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})
  call minpac#add('tpope/vim-commentary')         " comment-as-operator
  call minpac#add('tpope/vim-sleuth')             " heuristic whitespace setting
  call minpac#add('tpope/vim-surround')           " 'surroundings' operators
  call minpac#add('tpope/vim-repeat')             " repeat whole plugin maps
  call minpac#add('ludovicchabant/vim-gutentags') " automatic tag generation
  call minpac#add('dense-analysis/ale')           " async linting
  call minpac#add('sheerun/vim-polyglot')         " syntax file pack
  call minpac#add('lifepillar/vim-solarized8')    " colorscheme
  call minpac#add('justinmk/vim-dirvish')         " simple file browser that doesn't suck
endif

command! PackSync 
  \ packadd minpac |
  \ source $MYVIMRC |
  \ call minpac#update() |
  \ call minpac#clean()

" BASE

filetype plugin indent on
syntax on

set number
set backspace=2
set laststatus=2
set guicursor=
set title
set hidden
set wildmenu
set nocompatible
set path=.,**
silent! set wildoptions=pum
silent! set inccommand=nosplit

nnoremap <space> :
vnoremap <space> :
nnoremap <leader><leader> :noh<cr>

" find files, jump to tag
nnoremap <leader>p :find<space>
nnoremap <leader>e :find <c-r>=expand("%:p:h")<cr>/**/
nnoremap <leader>j :tjump<space>

" COLORSCHEME

if has('termguicolors') && $COLORTERM =~# '^\(truecolor\|24bit\)$' 
  set termguicolors
else
  let g:solarized_use16=1
endif
set background=light
let g:solarized_extra_hi_groups=1
silent! colorscheme solarized8_flat
 
" BACKUPS, SWAP, & PERSISTENT UNDO

set backup
set directory=~/.vim/swap//
set backupdir=~/.vim/backup//
set undodir=~/.vim/undo//

for dir in [ &directory, &backupdir, &undodir ]
  if !isdirectory(dir)
      call mkdir(dir, "p")
  endif
endfor

" RIPGREP

if executable('rg')
    set grepprg=rg\ --vimgrep
    set grepformat=%f:%l:%c:%m
    command! -nargs=+ Rg silent grep! <args> | copen 20 | redraw!
    nnoremap <leader>u :Rg<space>
    nnoremap <leader>k :Rg<space><c-r>=expand("<cword>")<cr><cr>
endif
