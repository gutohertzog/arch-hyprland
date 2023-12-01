-- Dica: veja `:h vim.map.set()`

---------------
-- Variáveis --
---------------

local map = vim.keymap.set

local opts = {
    noremap = true,     -- não recursivo
    silent = true,      -- não mostra mensagem
}

local function cmd(comando)
    return table.concat { '<cmd>', comando, '<CR>' }
end

--------------------
-- Mouse + Cursor --
--------------------
-- desativa clique direito
map({'n','v','i'}, '<RightMouse>', '<nop>')
map({'n','v','i'}, '<2-RightMouse>', '<nop>')
-- controla o cursor com a roda do mouse
map({'n','v'}, '<ScrollWheelLeft>', 'h')
map({'n','v'}, '<ScrollWheelDown>', 'j')
map({'n','v'}, '<ScrollWheelUp>', 'k')
map({'n','v'}, '<ScrollWheelRight>', 'l')
map({'n','v'}, '<S-ScrollWheelDown>', cmd 'keepj norm! }')
map({'n','v'}, '<S-ScrollWheelUp>', cmd 'keepj norm! {')
map('i', '<ScrollWheelLeft>', '<left>')
map('i', '<ScrollWheelRight>', '<right>')
map('i', '<ScrollWheelUp>', '<up>')
map('i', '<ScrollWheelDown>', '<down>')

--------------------------
-- Atalhos Substituição --
--------------------------
-- linha
--map({'n','v'}, '<leader>s', [[:s/<C-r><C-w>//gI<Left><Left><Left>]], { desc = 'Substitute Line' })
-- arquivo
--map({'n','v'}, '<leader>S', [[:%s//gI<Left><Left><Left>]], { desc = 'Substitute File' })

---------------------
-- Desativa Teclas --
---------------------
-- desativa o espaço
map({'n','v'}, '<Space>', '<Nop>')

----------
-- Tabs --
----------
-- navegação entre as Tabs
--map('n', '<leader>tt', cmd('tabnew'), { desc = 'Open New Tab' })
--map('n', '<leader>tw', cmd('tabclose'), { desc = 'Close Tab' })
map('n', '<leader><Tab>', cmd('tabnext'), { desc = 'Next Tab' })
map('n', '<leader><S-Tab>', cmd('tabprevious'), { desc = 'Previous Tab' })

------------
-- Janela --
------------
-- Melhor a navegação nas janelas
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)
-- Ajusta o tamanho das janelas com a tecla Alt + hjkl - delta: 2 linha
map('n', '<A-k>', cmd 'resize -2', opts)
map('n', '<A-j>', cmd 'resize +2', opts)
map('n', '<A-h>', cmd 'vertical resize -2', opts)
map('n', '<A-l>', cmd 'vertical resize +2', opts)

---------------
-- Navegação --
---------------
-- Melhora navegação no arquivo
map('n', 'J', '5j') -- move 5 linhas para baixo
map('n', 'K', '5k') -- mode 5 linhas para cima
map('n', 'H', '^') -- move o cursor para o primeiro caractere não vazio
map('n', 'L', '$') -- move o cursor para o final da linha
map('n', '<leader>j', 'J') -- junta a linha de baixo com a atual
map('n', '<leader>k', 'i<CR><Esc>') -- quebra de linha a partir do cursor
map('n', '<CR>', 'ciw') -- apaga a palavra e ativa o INSERT

--------------
-- Comandos --
--------------
--map('n', '<leader>/', cmd 'nohlsearch', { silent = true }) -- desativa destaque da busca
--map('n', '<leader><CR>', cmd 'sp <bar> terminal', { silent = true, desc = 'Neovim Terminal' })

----------
-- Misc --
----------
--map('n', ';', ':') -- também usa ; para entrar no modo comando

