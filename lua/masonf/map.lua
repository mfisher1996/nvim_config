local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

local function nokeymap(key,cmd,pts)
    keymap("n",key,cmd,pts)
end

local function vikeymap(key,cmd,pts)
    keymap("v",key,cmd,pts)
end

local function vxkeymap(key,cmd,pts)
    keymap("x",key,cmd,pts)
end

keymap("", "<Space>", "<Nop>",opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

nokeymap("<C-h>", "<C-w>h", opts)
nokeymap("<C-j>", "<C-w>j", opts)
nokeymap("<C-k>", "<C-w>k", opts)
nokeymap("<C-l>", "<C-w>l", opts)

nokeymap("<leader>e", ":E<CR>", opts)

nokeymap("<leader>y", '"*y', opts)
vikeymap("<leader>y", '"*y', opts)
nokeymap("<leader>Y", '"*Y', opts)
nokeymap("<leader>d", '"_d', opts)
nokeymap("<leader>D", '"_D', opts)

nokeymap("<C-Up>", ':resize -2<CR>', opts)
nokeymap("<C-Down>", ':resize +2<CR>', opts)
nokeymap("<C-Left>", ':vertical resize -2<CR>', opts)
nokeymap("<C-Right>", ':vertical resize +2<CR>', opts)

nokeymap('<S-l>',':bnext<cr>',opts)
nokeymap('<S-h>',':bprevious<cr>',opts)

vikeymap('<','<gv',opts)
vikeymap('>','>gv',opts)

vikeymap('<A-j>',":m '>+1<CR>==",opts)
vikeymap('<A-k>',":m '<-2<CR>==",opts)
vikeymap('p','"_dP',opts)

vxkeymap('J',":m '>+1<CR>gv-gv",opts)
vxkeymap('K',":m '<-2<CR>gv-gv",opts)
vxkeymap('<A-j>',":m '>+1<CR>gv-gv",opts)
vxkeymap('<A-k>',":m '<-2<CR>gv-gv",opts)

local status_ok, _ = pcall(require, 'telescope.builtin')

if not status_ok then
    vim.notify('Telescope not installed')
else
    nokeymap('<leader>ff',':Telescope find_files<cr>',opts)
    nokeymap('<leader>fs',':Telescope live_grep<cr>',opts)
    nokeymap('<leader>fh',':Telescope help_tags<cr>',opts)
    nokeymap('<leader>fg',':Telescope git_files<cr>',opts)

end

local codium_ok, _ = pcall(require, 'codeium')

if not codium_ok then
    vim.notify('Codeium not installed')
else
    vim.keymap.set('i','<C-s>',function () return vim.fn['codeium#Complete']() end, {expr = true})
    vim.keymap.set('i','<Right>',function () return vim.fn['codeium#Accept']() end, {expr = true})
    vim.keymap.set('i','<Left>',function () return vim.fn['codeium#CycleCompletions'](1) end, {expr = true})
end

local harp_ok, _ = pcall(require, 'harpoon')

if not harp_ok then
    vim.notify('Harpoon not installed')
else
    nokeymap('<leader>m',':lua require("harpoon.mark").add_file()<CR>',opts)
    nokeymap('<leader>h',':lua require("harpoon.ui").toggle_quick_menu()<CR>',opts)
    nokeymap('<C-k>',':lua require("harpoon.ui").nav_next()<CR>',opts)
    nokeymap('<C-j>',':lua require("harpoon.ui").nav_prev()<CR>',opts)
    nokeymap('<leader>t',':lua require("harpoon.tmux").gotoTerminal(1)<CR>',opts)
end
