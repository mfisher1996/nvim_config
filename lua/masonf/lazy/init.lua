return {
    "nvim-lua/popup.nvim",
    "linrongbin16/lsp-progress.nvim",
    {
        "nvim-telescope/telescope.nvim",
        keys = {
            { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
            { "<leader>fs", "<cmd>Telescope live_grep<cr>",  desc = "Live Grep" },
            { "<leader>fh", "<cmd>Telescope help_tags<cr>",  desc = "Help" },
            { "<leader>fg", "<cmd>Telescope git_files<cr>",  desc = "Git Files" },
        },
        dependencies = { "nvim-lua/plenary.nvim", "BurntSushi/ripgrep", "nvim-tree/nvim-web-devicons" },
    },
    "p00f/nvim-ts-rainbow",
    "lewis6991/gitsigns.nvim",
    "windwp/nvim-autopairs",
    "norcalli/nvim-colorizer.lua",
    {
        "ThePrimeagen/harpoon",
        keys = {
    		{'<leader>m',':lua require("harpoon.mark").add_file()<CR>',desc = 'Add harpoon file' },
    		{'<leader>h',':lua require("harpoon.ui").toggle_quick_menu()<CR>',desc = 'open harpoon' },
    		{'<C-k>',':lua require("harpoon.ui").nav_next()<CR>',desc = 'Next File' },
    		{'<C-j>',':lua require("harpoon.ui").nav_prev()<CR>',desc = 'Previous File' },
    		{'<leader>b',':lua require("harpoon.tmux").gotoTerminal(1)<CR>',desc = 'tmux' },
        },
    },
    "tpope/vim-fugitive",
    {
        "mbbill/undotree",
        keys = {
            { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Undo Tree" },
        },
    },
    {
        "folke/trouble.nvim",
        keys = {
            {
                "<leader>tt",
                function()
                    require("trouble").toggle()
                end,
                desc = "Open Trouble",
            },
            {
                "<leader>tn",
                function()
                    require("trouble").next({ skip_groups = true, jump = true })
                end,
                desc = "Next trouble",
            },
            {
                "<leader>tp",
                function()
                    require("trouble").previous({ skip_groups = true, jump = true })
                end,
                desc = "Next trouble",
            },
        },
        opts = {},
    },
    {
        'Exafunction/codeium.vim',
        keys = {
            { '<C-s>',  function() vim.fn['codium#Complete']() end, desc = 'Suggest Completion' },
            { '<Right>',function() vim.fn['codium#Accept']() end,   desc = 'Accept Completion' },
        },
    },
    "tpope/vim-fugitive",
}
