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
  use "nvim-lua/plenary.nvim"  -- Useful lua functions used by lots of plugins
  use "numToStr/Comment.nvim"
  use "kyazdani42/nvim-web-devicons"
  use { "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" }
  use { "akinsho/bufferline.nvim", requires = "kyazdani42/nvim-web-devicons" }
  use "nvim-lualine/lualine.nvim"
  use "lukas-reineke/indent-blankline.nvim"
  use { "goolord/alpha-nvim", requires = "kyazdani42/nvim-web-devicons" }
  use "folke/which-key.nvim"
  use { "Shatur/neovim-session-manager", requires = "nvim-lua/plenary.nvim" }
  use "simrat39/symbols-outline.nvim"
  use "lewis6991/gitsigns.nvim"
  use "nvim-telescope/telescope.nvim" -- requires ripgrep, apt install ripgrep
  use "nvim-treesitter/nvim-treesitter"
  use "phaazon/hop.nvim"
  use "windwp/nvim-autopairs"

  -- Colorschemes
  use "navarasu/onedark.nvim"

  -- lsp
  use "neovim/nvim-lspconfig"
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "jose-elias-alvarez/null-ls.nvim"

  -- cmp
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "hrsh7th/nvim-cmp"
  -- snippets
  use "L3MON4D3/LuaSnip"
  use "saadparwaiz1/cmp_luasnip"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
