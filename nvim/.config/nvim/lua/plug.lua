-- [[ plug.lua ]]
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plug.lua source <afile> | PackerSync
  augroup end
]])

return require('packer').startup(function(use)
  -- [[ Plugins Go Here ]]
  use "wbthomason/packer.nvim"

  use "glepnir/dashboard-nvim"

  use {
    "kyazdani42/nvim-tree.lua",
    requires = "kyazdani42/nvim-web-devicons"
  }
  use {
    "nvim-telescope/telescope.nvim",
    requires = { {"nvim-lua/plenary.nvim"} }
  }
  -- [[ Dev ]]
  use "tpope/vim-fugitive"    -- git integration
  use "junegunn/gv.vim"   -- commit history
  use "windwp/nvim-autopairs"

  -- [[ Theme ]]
  use "DanilaMihailov/beacon.nvim"    -- cursor jump
  use {
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons",
                opt = true }
  }
  use { "akinsho/bufferline.nvim", tag = "v2.*", requires = "kyazdani42/nvim-web-devicons" }
  use "ful1e5/onedark.nvim"
  use "ellisonleao/gruvbox.nvim"
end)
