--[[ init.lua ]]

vim.g.mapleader = " "
vim.g.localleader = "\\"

-- IMPORTS
require('vars')  -- Variables
require('opts')  -- Options
require('keys')  -- Keymaps
require('plug')  -- Plugins

-- PLUGINS: Add this section
require('nvim-tree').setup{}
require('lualine').setup {
  options = {
    theme = 'everforest'
  }
}
require('nvim-autopairs').setup{}
