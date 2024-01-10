return {
    {
        "neovim/nvim-lspconfig",
        init = function()
            local keys = require("lazyvim.plugins.lsp.keymaps").get()
            keys[#keys + 1] = { "gd", function() vim.lsp.buf.definition() end}
            keys[#keys + 1] = { "K", function() vim.lsp.buf.hover() end}
            keys[#keys + 1] = { "<leader>vws", function() vim.lsp.buf.workspace_symbol() end}
            keys[#keys + 1] = { "<leader>a", function() vim.lsp.buf.code_action() end}
            keys[#keys + 1] = { "<leader>vrr", function() vim.lsp.buf.references() end}
            keys[#keys + 1] = { "<leader>vrn", function() vim.lsp.buf.rename() end}
            keys[#keys + 1] = { "<C-h>", function() vim.lsp.buf.signature_help() end}
        end,
    }
}
