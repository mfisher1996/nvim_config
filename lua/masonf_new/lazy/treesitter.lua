return {
    'nvim-treesitter/nvim-treesitter', 
    build = ':TSUpdateSync',
    ops = {
        ensure_installed = 'all',
        sync_install = false,
        ignore_install = {""},
        highlight = {
            enable = true,
            disable = {""},
            aditional_vim_regex_highlighting = false,
        },
        indent = { 
            enable = true,
            disable = {}
        },
        rainbow = {
            enable = true,
            extend_mode = true,
            max_file_lines = nil,
        },
    }
}
