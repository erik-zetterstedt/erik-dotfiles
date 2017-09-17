set nocompatible

let mapleader = "\<Space>"
nnoremap <Leader>o :Files<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>f :Find 
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>c :bd<CR>
nnoremap <Leader>k mzgggqG`z
vnoremap <Leader>y :w !xsel --clipboard<CR><CR>

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

set relativenumber numberwidth=3
set tabstop=2 shiftwidth=2 softtabstop=0 expandtab
set hidden
set scrolloff=15
set ignorecase smartcase
" Pressing ESC and then O will cause a delay unless this is set to 0
set ttimeoutlen=0
set nowrap
set backupcopy=yes

set laststatus=2
set statusline=%f%=%l,%c\ %p%%

augroup vimrc_autocmds
	autocmd BufEnter * highlight WhiteSpaceTrailing ctermbg=darkred
	autocmd BufEnter * call matchadd('WhiteSpaceTrailing', '\s\+$', -1)
augroup END

set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

let g:fzf_layout = { }

command! -bang -nargs=* Find call fzf#vim#grep('rg -i --vimgrep '.shellescape(<q-args>), 1, <bang>0)

call plug#begin('~/.vim/plugged')

Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'w0rp/ale'
Plug 'chriskempson/base16-vim'
Plug 'ivalkeen/vim-simpledb'

call plug#end()

let base16colorspace=256
colorscheme base16-tomorrow-night

autocmd FileType markdown setlocal tw=79 fo+=t fo-=l
autocmd FileType rust setlocal tabstop=2 shiftwidth=2 softtabstop=0 noexpandtab
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd FileType javascript setlocal statusline=%f\ %{ALEGetStatusLine()}%=%l,%c\ %p%%
autocmd FileType javascript setlocal formatprg=prettier-standard
autocmd FileType json setlocal formatprg=jq\ '.'

autocmd BufEnter * sign define dummy
autocmd BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')

let g:ale_linters = {
\  'javascript': ['eslint'],
\}

highlight diffadd ctermbg=green ctermfg=black
highlight diffdelete ctermbg=red ctermfg=black
highlight diffchange ctermbg=blue ctermfg=black
highlight difftext ctermbg=green ctermfg=black cterm=none
highlight clear SignColumn
highlight clear LineNr
highlight StatusLine ctermbg=green ctermfg=black cterm=none
highlight StatusLineNC ctermbg=white ctermfg=black cterm=none
highlight MatchParen cterm=bold ctermbg=none ctermfg=green
highlight SpellBad cterm=none ctermbg=red ctermfg=black
