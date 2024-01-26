local icons = require('config.vars').icons

require('lualine').setup({
    options = {
        theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
            statusline = { 'dashboard', 'alpha' },
            winbar = {},
        },
        always_divide_middle = true,
        globalstatus = false,
    },
    sections = {
        --lualine_a = {'mode'},
        lualine_a = {'mode'},
        lualine_b = {'branch'},
        lualine_c = {
            {
                "diagnostics",
                symbols = {
                    error = icons.diagnostics.Error,
                    warn = icons.diagnostics.Warn,
                    info = icons.diagnostics.Info,
                    hint = icons.diagnostics.Hint,
                },
            },
            { 'filetype', icon_only = true, separator = '', padding = { left = 1, right = 0 } },
            {
                'filename',
                file_status = true,
                path = 1,
                symbols = {
                    modified = '[+]',
                    readonly = '[-]',
                    unnamed = '',
                    newfile = '',
                }
            },
        },
        lualine_x = {--'encoding', 'fileformat', 'filetype'},
            {
                "diff",
                symbols = {
                    added = icons.git.added,
                    modified = icons.git.modified,
                    removed = icons.git.removed,
                },
            },
        },
        lualine_y = {
            { 'progress', separator = ' ', padding = { left = 1, right = 0 } },
            { 'location', padding = { left = 0, right = 1 } },
        },
        lualine_z = {
            function()
                return ' ' .. os.date('%R')
            end,
        },
    },
    winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
            {'filename', path = 2}
        },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },
    inactive_winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
            {'filename', path = 2}
        },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },
    extensions = {'nvim-tree', 'lazy'}
})
