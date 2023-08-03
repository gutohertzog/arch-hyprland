" Desativa Espaço
nnoremap <Space> <Nop>
vnoremap <Space> <Nop>
let mapleader = " "

" Navegação Janelas
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

" Navegação Tabs
nnoremap <leader>tt :tabnew<CR>
nnoremap <leader>tw :tabclose<CR>
nnoremap <leader>tn :tabnext<CR>
nnoremap <leader>tp :tabprevious<CR>

" Navegação Buffers
nnoremap <leader>bw :w<CR> :bd<CR>
nnoremap <leader>bn :w<CR> :bnext<CR>
nnoremap <leader>bp :w<CR> :bprevious<CR>

" Navegação Arquivo
noremap J 5j
noremap K 5k
noremap H ^
noremap L $

" Remap Antigos
nnoremap <leader>j J

" Atalhos Rapidos
" nova linha no cursor
noremap <leader>k i<CR><Esc>
" apaga toda palavra
noremap <CR> ciw
" salva o arquivo
noremap <leader>w :w<CR>
" desativa o destaque da busca
noremap <leader>, :nohl<CR>

" Atalhos Terminal
" abre o terminal embaixo
noremap <leader><CR> :bel term<CR>
" sai do terminal
tnoremap <leader><leader><Esc> exit<CR>

" NERDTree
" abre e fecha o NERDTree
noremap <leader>e :NERDTreeToggle<CR>

