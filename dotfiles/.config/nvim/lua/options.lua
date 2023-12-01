-- Dica: use `:h <opcao>` para descobrir o que a função faz

-- variáveis para encurtar a chamada
local opt = vim.opt
local g = vim.g

-- define a tecla leader e local leader para espaço
g.mapleader = ' '
g.maplocalleader = ' '

-- Neovim
opt.autowrite = false                   -- desativa o salvamento automático
opt.clipboard = 'unnamedplus'           -- sincroniza com o clipboard do sistema
opt.completeopt = {'menu', 'menuone', 'noselect'}
opt.errorbells = false                  -- desativa sons de erros
--opt.inccommand = 'nosplit'              -- prévia incremental na substituição
opt.mouse = 'a'                         -- permite o uso do mouse no Neovim
opt.pumblend = 10                       -- tranparência do popup
opt.pumheight = 10                      -- altura máxima do popup
opt.splitbelow = true                   -- divide a tela horizontalmente para baixo
opt.splitright = true                   -- divide a tela verticalmente para direita
opt.termguicolors = true                -- ativa RGB de 24-bit no terminal
opt.wildmode = 'longest,list,full'      -- ativa autocomplete nos arquivos

-- Tabulação
opt.expandtab = true                    -- usa espaços nas tabulações
opt.shiftwidth = 4                      -- insere 4 espaços em uma tabulação
opt.smartindent = true                  -- mantém a indentação a partir da linha atual
opt.softtabstop = 4                     -- número de espaços internos quando editando
opt.tabstop = 4                         -- número de espaços inseridos por TAB

-- Interface
--opt.cmdheight = 0                     -- esconde a linha de comando quando fora de uso
opt.colorcolumn = '80,100'              -- adiciona as linhas à direita
opt.cursorline = true                   -- destaca a linha onde está o cursor
opt.cursorcolumn = true                 -- destaca a coluna onde está o cursor
opt.laststatus = 2                      -- ativa a barra inferior
opt.number = true                       -- mostra os números das linhas
opt.relativenumber = true               -- numeração das linhas de acordo com a posição do cursosr
opt.scrolloff = 1                       -- 999 para manter sempre centralizado na tela
opt.showmatch = true                    -- mostra os pares dos ()[]{}
opt.showmode = false                    -- não mostra o modo atual, pois usa lualine
opt.signcolumn = 'yes'                  -- mostra os sinais na barra da esquerda
opt.wrap = true                         -- ativa o wrap nas linhas
opt.list = true                         -- mostra caracteres invisíveis
opt.foldmethod = 'manual'               -- controla o fold

-- Busca
opt.ignorecase = true                   -- ignora Maiúsculas e minúsculas nas buscas por padrão
opt.incsearch = true                    -- busca enquando os caracteres são digitados
opt.hlsearch = true                     -- destaca os resultados da busca
opt.showmatch = true                    -- mostra a quantidade de matches e localização
opt.smartcase = true                    -- mas ativa novamente se uma letra maiúscula for usada

-- Histórico
opt.swapfile = false                    -- desativa o arquivo swap
opt.backup = false                      -- desativa o backup
opt.undofile = true                     --

--vim.api.nvim_set_option_value("colorcolumn", "80,100", {})
