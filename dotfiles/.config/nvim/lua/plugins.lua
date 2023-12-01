-- Instala o gerenciador de pacotes Lazy se ainda não estiver instalado (Bootstraping)
-- Dica: concatenação de strings é feita com `..`
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- verifica se está ok a instalação
local status_ok, lazy = pcall(require, 'lazy')
if not status_ok then
    return
end

-- lista de plugins usados
local plugins = {
    'EdenEast/nightfox.nvim', -- tema para o programa
    'nvim-tree/nvim-tree.lua', -- explorador de arquivos
    'nvim-tree/nvim-web-devicons', -- ícones para o explorador de arquivos
    'nvim-lualine/lualine.nvim', -- barra inferior com várias informações
    -- "tiagovla/scope.nvim", -- mostra o número das tabs acima e a direita
    {
        'akinsho/bufferline.nvim', -- buffer em tabs
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons',
    },
}

lazy.setup(plugins, opts)
