require("bufferline").setup{
    options = {
        always_show_bufferline = true,
        padded_slant = '',
        offsets = {
            {
                filetype = 'Nvim-tree',
                text = "Nvim-tree",
                highlight = "Directory",
                text_align = "left",
            },
        },
    },
}

vim.keymap.set('n', '<space>bn', ':bnext<CR>', {silent=false})
vim.keymap.set('n', '<space>bp', ':bprevious<CR>', {silent=false})

