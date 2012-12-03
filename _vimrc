set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction


set guifont=Consolas:h11
syntax on
colorscheme desert
set number
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set nobackup
set autochdir
let NERDTreeChDirMode=2
let Tlist_Use_Right_Window=1
let Tlist_Show_One_File=1
nnoremap <silent> <SPACE> i<SPACE><ESC>w
nnoremap <silent> <TAB> i<TAB><ESC>
nnoremap <silent> <F8> :TlistToggle<CR>
nnoremap <silent> <F2> :NERDTreeFind<CR>
nnoremap <silent> <A-c> "zyiw
nnoremap <silent> <A-p> viw"zp
map <F3> :execute "noautocmd vimgrep /" . expand("<cword>") . "/gj **/*." .  expand("%:e") <Bar> cw<CR>
map <F4> :NERDTreeToggle<cr>
let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1 

" #u BufAdd,BufNewFile * nested tab sball
