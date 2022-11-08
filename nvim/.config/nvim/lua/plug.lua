-- [[ plug.lua ]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'nvim-tree/nvim-web-devicons'
  use 'nvim-tree/nvim-tree.lua'

  use 'DanilaMihailov/beacon.nvim'
  use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use 'akinsho/bufferline.nvim'
  use 'navarasu/onedark.nvim'
  use 'majutsushi/tagbar'
  use 'Yggdroot/indentLine'
  use 'tpope/vim-fugitive'
  use 'junegunn/gv.vim'
  use 'windwp/nvim-autopairs'
end)
