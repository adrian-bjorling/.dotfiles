--[[ init.lua ]]

-- LEADER
vim.g.mapleader = " "
vim.g.localleader = " "

-- IMPORTS
require("vars")   -- Variables
require("opts")   -- Options
require("keys")   -- Keymaps
require("plug")   -- Plugins

-- PLUGINS
local db = require('dashboard')
local home = os.getenv('HOME')

db.default_banner = {
  '',
  '',
  ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
  ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
  ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
  ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
  ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
  ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
  '',
  ' [ TIP: To exit Neovim, just power off your computer. ] ',
  '',
}
db.preview_file_path = home .. '/.config/nvim/static/neovim.cat'
db.preview_file_height = 11
db.preview_file_width = 70
db.custom_center = {
      {icon = '  ',
      desc = 'Recently latest session                  ',
      shortcut = 'SPC s l',
      action =':SessionLoad'},
      {icon = '  ',
      desc = 'Recently opened files                   ',
      action =  ':Telescope oldfiles',
      shortcut = 'SPC f r'},
      {icon = '  ',
      desc = 'Find  File                              ',
      action = ':Telescope find_files',
      shortcut = 'SPC f f'},
      {icon = '  ',
      desc = 'Find  word                              ',
      action = ':Telescope live_grep',
      shortcut = 'SPC f w'},
      {icon = '  ',
      desc = 'Open Personal dotfiles                  ',
      action = ':Telescope dotfiles path=' .. home ..'/.dotfiles',
      shortcut = 'SPC f d'},
}

require("nvim-tree").setup{
  sort_by = "case_sensitive",
  git = {
    enable = true,
    ignore = false,
    timeout = 500,
  },
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
}
require("lualine").setup {
  options = {
    theme = "onedark",
  }
}
require("nvim-autopairs").setup{}
require("bufferline").setup{}
require("colorizer").setup()
