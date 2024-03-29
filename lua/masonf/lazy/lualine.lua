return {
	'nvim-lualine/lualine.nvim',
    dependencies = { 'AlexvZyl/nordic.nvim','nvim-tree/nvim-web-devicons', opt = true } ,
    opts = {
        options = {
            icons_enabled = true,
            theme = 'nordic',
            component_separators = { left = '', right = ''},
            section_separators = { left = '', right = ''},
            disabled_filetypes = {
                statusline = {},
                winbar = {},
            },
            ignore_focus = {},
            always_divide_middle = true,
            globalstatus = false,
            refresh = {
                statusline = 1000,
                tabline = 1000,
                winbar = 1000,
            }
        },
        sections = {
            lualine_a = {'mode'},
            lualine_b = {'branch', 'diff', 'diagnostics'},
            lualine_c = {'filename'},
            lualine_x = {'encoding', 'fileformat', 'filetype'},
            lualine_y = {"require('lsp-progress').progress()"},
            lualine_z = {'location'}
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {'filename'},
            lualine_x = {'location'},
            lualine_y = {},
            lualine_z = {}
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {}
    },
    init = function ()
        require("lsp-progress").setup()
        vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
        vim.api.nvim_create_autocmd("User LspProgressStatusUpdated", {
            group = "lualine_augroup",
            callback = require("lualine").refresh,
        })
    end
}
