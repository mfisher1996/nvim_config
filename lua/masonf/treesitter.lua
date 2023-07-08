local status, configs = pcall(require,'nvim-treesitter.configs')
if not status then
    vim.notify('treesitter not installed')
    return
end

configs.setup {
    ensure_installed = 'all',
    sync_install = false,
    ignore_install = {""},
    highlight = {
        enable = true,
        disable = {""},
        aditional_vim_regex_highlighting = true,
    },
    indent = { 
        enable = true,
        disable = {'yaml'}
    },
    rainbow = {
        enable = true,
        extend_mode = true,
        max_file_lines = nil,
    },
}

