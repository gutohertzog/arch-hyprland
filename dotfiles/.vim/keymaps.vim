" Desativa Espaco
nnoremap <Space> <Nop>
vnoremap <Space> <Nop>
let mapleader = " "

" Navegacao Janelas
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

" Navegacao Tabs
nnoremap <leader>tt :tabnew<CR>
nnoremap <leader>tw :tabclose<CR>
nnoremap <leader>tn :tabnext<CR>
nnoremap <leader>tp :tabprevious<CR>

" Navegacao Buffers
nnoremap <leader>bw :bd<CR>
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>

" Navagacao Arquivo
noremap J 5j
noremap K 5k
noremap H ^
noremap L $

" Remap Antigos
nnoremap <leader>j J

" Atalhos Rapidos
noremap <leader>k i<CR><Esc>
noremap <CR> ciw
noremap <leader>w :w<CR>
noremap <leader>, :nohl<CR>

" Atalhos Terminal
noremap <leader><CR> :bel term<CR>
tnoremap <leader><leader><Esc> exit<CR>


