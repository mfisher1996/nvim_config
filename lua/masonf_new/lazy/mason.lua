return {
    'VonHeikemen/lsp-zero.nvim', 
    dependencies = { 
        {'neovim/nvim-lspconfig'},
        {'williamboman/mason.nvim'},
        {'williamboman/mason-lspconfig.nvim'},
        {'hrsh7th/nvim-cmp'},
        {'Exafunction/codeium.vim'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'hrsh7th/cmp-buffer'},
        {'hrsh7th/cmp-path'},
        {'L3MON4D3/LuaSnip'},
        {'rafamadriz/friendly-snippets'},
        {'saadparwaiz1/cmp_luasnip'} 
    }, 
    init = function() 
        local zero_ok, zero = pcall(require, 'lsp-zero')
        if not zero_ok then 
            vim.notify('Zero missing')
            return
        end
        zero.preset('recommended')
    end
}
