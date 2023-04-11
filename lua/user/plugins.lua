local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/plenary.nvim" -- Useful lua functions used by lots of plugins
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use "numToStr/Comment.nvim"
  use "kyazdani42/nvim-web-devicons"
  use { "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" }
  use { "akinsho/bufferline.nvim", requires = "kyazdani42/nvim-web-devicons" }
  use "nvim-lualine/lualine.nvim"
  use "lukas-reineke/indent-blankline.nvim"
  use { "goolord/alpha-nvim", requires = "kyazdani42/nvim-web-devicons" }
	use "folke/which-key.nvim"
  use { "Shatur/neovim-session-manager", requires = "nvim-lua/plenary.nvim" }
  use 'simrat39/symbols-outline.nvim'
	use "lewis6991/gitsigns.nvim"
	use "nvim-telescope/telescope.nvim" -- requires ripgrep, apt install ripgrep
	use "nvim-treesitter/nvim-treesitter"

	-- Colorschemes
  use "folke/tokyonight.nvim"
  use { "catppuccin/nvim", as = "catppuccin" }
  use 'navarasu/onedark.nvim'

	-- Snippets
  use "L3MON4D3/LuaSnip" --nvim-cmp snippet engine
	use "saadparwaiz1/cmp_luasnip" -- snippet completions, used by nvim-cmp to control cmp source
  use "rafamadriz/friendly-snippets" -- VS Code-like snippets, used by LuaSnip

	-- Cmp 
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions, nvim-cmp source
  use "hrsh7th/cmp-path" -- path completions, nvim-cmp source
	use "hrsh7th/cmp-nvim-lsp" -- nvim-cmp source

	-- LSP
	use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/mason.nvim" -- simple to use language server installer
  use "williamboman/mason-lspconfig.nvim" -- mason lsp config
	use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
  use "RRethy/vim-illuminate"


	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
