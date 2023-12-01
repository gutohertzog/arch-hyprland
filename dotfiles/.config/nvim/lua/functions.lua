-- ----------------------------------------------------------------------------
-- realiza o toggle dos números
-- NORMAL -> relativenumber on
-- INSERT -> relativenumber off
-- fonte: https://github.com/sitiom/nvim-numbertoggle
--local augroup = vim.api.nvim_create_augroup("numbertoggle", {})

--vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "CmdlineLeave", "WinEnter" }, {
--   pattern = "*",
--   group = augroup,
--   callback = function()
--      if vim.o.nu and vim.api.nvim_get_mode().mode ~= "i" then
--         vim.opt.relativenumber = true
--      end
--   end,
--})

--vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "CmdlineEnter", "WinLeave" }, {
--   pattern = "*",
--   group = augroup,
--   callback = function()
--      if vim.o.nu then
--         vim.opt.relativenumber = false
--         vim.cmd "redraw"
--      end
--   end,
--})


-- ----------------------------------------------------------------------------
-- destaca a seleção ao realizar um yank
-- Fonte: 
vim.api.nvim_create_autocmd('TextYankPost', {
    group = vim.api.nvim_create_augroup('highlight_yank', {}),
    desc = 'Destaca a seleção no yank',
    pattern = '*',
    callback = function()
        vim.highlight.on_yank { higroup = 'IncSearch', timeout = 250 }
    end,
})

