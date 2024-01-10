return {
    'nvim-lua/popup.nvim',
    'linrongbin16/lsp-progress.nvim',
    { 'nvim-telescope/telescope.nvim',keys={
        {'<leader>ff','<cmd>Telescope find_files<cr>',desc = "Find Files"},
        {'<leader>fs','<cmd>Telescope live_grep<cr>',desc = "Live Grep"},
        {'<leader>fh','<cmd>Telescope help_tags<cr>',desc = "Help"},
        {'<leader>fg','<cmd>Telescope git_files<cr>',desc = "Git Files"},
    }, dependencies = { 'nvim-lua/plenary.nvim', 'BurntSushi/ripgrep', 'nvim-tree/nvim-web-devicons' } },
    'p00f/nvim-ts-rainbow',
    'lewis6991/gitsigns.nvim',
    'windwp/nvim-autopairs',
    'norcalli/nvim-colorizer.lua',
    'ThePrimeagen/harpoon',
    'tpope/vim-fugitive',
    {
        'mbbill/undotree', keys = {
            {'<leader>u', '<cmd>UndotreeToggle<cr>', desc = "Undo Tree"},
        }
    },
    {
        'folke/trouble.nvim',
        keys = {
            {'<C-t>', function() require("trouble").next({skip_groups=true,jump=true}) end, desc = "Next trouble"},
            {'<C-T>', function() require("trouble").previous({skip_groups=true,jump=true}) end, desc = "Next trouble"},
        }
    },
    'tpope/vim-fugitive',
}
