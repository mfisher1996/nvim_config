local fn = vim.fn

local install_path = fn.stdpath "data".."/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system{
		"git","clone","--depth","1","https://github.com/wbthomason/packer.nvim",install_path
	}
	print "installing packer. Close and reopen neovim"
	vim.cmd[[packadd packer.nvim]]
end

vim.cmd [[
augroup packer _user_config
	autocmd!
	autocmd BufWritePost packer.lua source <afile> | PackerSync
augroup end
]]

local status_ok, packer = pcall(require,"packer")
if not status_ok then 
	vim.notify('packer not found. Is it installed?')
	return
end

packer.init {
	display = {
		open_fn = function()
			return require('packer.util').float {border = "rounded"}
		end,
	},
}

packer.startup( function(use) 
	use 'wbthomason/packer.nvim'
	use 'nvim-lua/popup.nvim'
	use {
		'nvim-lualine/lualine.nvim',
		requires = {
			'nvim-tree/nvim-web-devicons',opt = true
		}
	}
	use 'linrongbin16/lsp-progress.nvim'
	use 'ellisonleao/gruvbox.nvim'
	use {
		'nvim-telescope/telescope.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
			'BurntSushi/ripgrep',
			'nvim-tree/nvim-web-devicons'
		}
	}

	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}

	use 'p00f/nvim-ts-rainbow'
	use 'lewis6991/gitsigns.nvim'
	use 'windwp/nvim-autopairs'
    use 'AlexvZyl/nordic.nvim'
	use 'norcalli/nvim-colorizer.lua'
	use 'shaunsingh/nord.nvim'
	use 'ThePrimeagen/harpoon'

	use 'mbbill/undotree'
	use{ 'VonHeikemen/lsp-zero.nvim', requires = {
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
		}
	}

	if PACKER_BOOTSTRAP then
		require('packer').sync()
	end
end)
