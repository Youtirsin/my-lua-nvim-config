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
  -- Have packer manage itself
  use "wbthomason/packer.nvim"

  -- widely used library
  use "nvim-lua/plenary.nvim"

  -- Colorschemes
  use "folke/tokyonight.nvim"
  
  -- nvim tree 
  use "nvim-tree/nvim-tree.lua"

  -- nvim icons
  use "nvim-tree/nvim-web-devicons"

  -- which key
  use "folke/which-key.nvim"

  -- telescope
  use "nvim-telescope/telescope.nvim"

  -- bufferline
  -- use { "akinsho/bufferline.nvim", commit = "83bf4dc7bff642e145c8b4547aa596803a8b4dc4" }
  use {'akinsho/bufferline.nvim', requires = 'nvim-tree/nvim-web-devicons'}

  -- lualine
  use "nvim-lualine/lualine.nvim"

  -- indentline
  use "lukas-reineke/indent-blankline.nvim"

  -- greeting window
  use "goolord/alpha-nvim"

  -- treesitter
  use "nvim-treesitter/nvim-treesitter"

  -- treesitter
  use "lewis6991/impatient.nvim"

  -- comment
  use "numToStr/Comment.nvim"

  -- autopairs
  use "windwp/nvim-autopairs"

  -- cmp
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"

  -- lsp
  use "neovim/nvim-lspconfig"
  use "williamboman/mason.nvim" -- lsp server manager
  use "williamboman/mason-lspconfig.nvim" -- mason lsp config
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
  -- automatically highlighting other uses of the word under the cursor using either LSP, Tree-sitter, or regex matching.
  use "RRethy/vim-illuminate"

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
end)

