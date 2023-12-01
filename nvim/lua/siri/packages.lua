vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use { 
		"catppuccin/nvim", 
		as = "catppuccin", 
		config = function() 
			vim.cmd.colorscheme "catppuccin-mocha" 
		end 
	}
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.4',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use {'stevearc/dressing.nvim'}
	use { 
		'nvim-treesitter/nvim-treesitter', 
		run = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end,
	}
	-- I like looking at the AST sometimes I'm sure you understand
	use "nvim-treesitter/playground"
	use 'mbbill/undotree'
	use 'tpope/vim-fugitive'

	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			-- LSP Installation
			{'williamboman/mason.nvim'},
    			{'williamboman/mason-lspconfig.nvim'},
			-- LSP Support
			{'neovim/nvim-lspconfig'},
			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'L3MON4D3/LuaSnip'},
		}
	}
end)
