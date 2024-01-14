return {
    {
        'ellisonleao/gruvbox.nvim',
    },
    {
        'shaunsingh/nord.nvim',
    },
    {
        'folke/tokyonight.nvim',
    },
    {
        'AlexvZyl/nordic.nvim',
        config = function()
            local color = require('nordic')
            color.setup({})
            color.load()
            vim.cmd [[
                highlight Normal guibg=none
                highlight NonText guibg=none
            ]]
        end
    },
}
