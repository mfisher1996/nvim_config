return {
    'ellisonleao/gruvbox.nvim',
    'shaunsingh/nord.nvim',
    {
        'AlexvZyl/nordic.nvim',
        config = function()
            local nord = require('nordic')
            nord.setup({})
            nord.load()
            vim.cmd [[
                highlight Normal guibg=none
                highlight NonText guibg=none
            ]]
        end
    },
}
