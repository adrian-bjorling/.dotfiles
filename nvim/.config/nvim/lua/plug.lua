-- [[ plug.lua ]]
local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "config" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use { 'wbthomason/packer.nvim' }
  use { 'kyazdani42/nvim-web-devicons' } 
  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use { 'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} }}

  -- [[ Dev ]]
  use { 'majutsushi/tagbar' }
  use { 'Yggdroot/indentLine' }
  use { 'tpope/vim-fugitive' }
  use { 'junegunn/gv.vim' }
  use { 'windwp/nvim-autopairs' }

  -- [[ Theme ]]
  use { 'mhinz/vim-startify' }
  use { 'DanilaMihailov/beacon.nvim' }
  use { 'sainnhe/everforest' }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
