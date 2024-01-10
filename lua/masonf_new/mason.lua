local status_ok, mason = pcall(require, 'mason')

if not status_ok then 
    vim.notify('mason missing... yeah the module... obviously.')
    return
end

local zero_ok, zero = pcall(require, 'lsp-zero')

if not zero_ok then 
    vim.notify('Zero missing')
    return
end

mason.setup()
zero.preset('recommended')
zero.setup()
