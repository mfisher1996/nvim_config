-- function for checking backspaces before tab

return {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "saadparwaiz1/cmp_luasnip",
    },
    keys = {
            "<C-k>", function() require("cmp").mapping.select_prev_item() end, desc = "Previous item",
            "<C-j>", function() require("cmp").mapping.select_next_item() end, desc = "Next item",
            "<C-b>", function() require("cmp").mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }) end, desc = "Scroll Floating Documentation Down",
            "<C-f>", function() require("cmp").mapping(cmp.mapping.scroll_docs(1), { "i", "c" }) end, desc = "Scroll Floating Documentation up",
            "<C-y>", function() require("cmp").config.disable() end, desc = "Disable", -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
            "<C-Space>", function() require("cmp").mapping(cmp.mapping.complete(), { "i", "c" }) end, desc = "Insert",
            "<C-e>", function() require("cmp").mapping({ i = cmp.mapping.abort(), c = cmp.mapping.close(), }) end, desc = "Cancel Completion",
            -- Accept currently selected item. If none selected, `select` first item.
            -- Set `select` to `false` to only confirm explicitly selected items.
            "<CR>", function() require("cmp").mapping.confirm { select = true } end, desc = "Complete",
            "<Tab>", function() require("cmp").mapping(function(fallback)
                    local check_backspace = function()
                      local col = vim.fn.col "." - 1
                      return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
                    end
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expandable() then
                        luasnip.expand()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    elseif check_backspace() then
                        fallback()
                    else
                        fallback()
                    end
                end, {
                "i",
                "s",
            }) end, desc = "Conditional Tab",
            "<S-Tab>", function() require("cmp").mapping(function(fallback)
                local check_backspace = function()
                  local col = vim.fn.col "." - 1
                  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
                end
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, 
            {
            "i",
            "s",
        }) end, desc = "Conditional Shift Tab",
    },
    opts = function()
        local defaults = require("cmp.config.default")()

        local cmp_status_ok, cmp = pcall(require, "cmp") 

        if not cmp_status_ok then
            print('no cmp: *****REMOVE ME FROM cmp.lua*****')
            return
        end

        local kind_icons = {
            Text = "",
            Method = "m",
            Function = "",
            Constructor = "",
            Field = "",
            Variable = "",
            Class = "",
            Interface = "",
            Module = "",
            Property = "",
            Unit = "",
            Value = "",
            Enum = "",
            Keyword = "",
            Snippet = "",
            Color = "",
            File = "",
            Reference = "",
            Folder = "",
            EnumMember = "",
            Constant = "",
            Struct = "",
            Event = "",
            Operator = "",
            TypeParameter = "",
        }

        return {
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "path" },
            },{
                { name = "buffer" },
            }),
            formatting = {
                fields = { "kind", "abbr", "menu" },
                format = function(entry, vim_item)
                    -- Kind icons
                    --vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
                    vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
                    vim_item.menu = ({
                        nvim_lsp = "[LSP]",
                        luasnip = "[Snippet]",
                        buffer = "[Buffer]",
                        path = "[Path]",
                    })[entry.source.name]
                    return vim_item
                end,
            },
            confirm_opts = {
                behavior = cmp.ConfirmBehavior.Replace,
                select = false,
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            experimental = {
                ghost_text = false,
                native_menu = false,
            },
        }
    end,
    config = function(_, opts)
        for _, source in ipairs(opts.sources) do
            source.group_index = source.group_index or 1 
        end
        require("cmp").setup(opts)
    end,

}

