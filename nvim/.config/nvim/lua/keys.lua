--[[ keys.lua ]]
local map = vim.api.nvim_set_keymap

-- remap the key used to leave insert mode
map('i', 'jk', '', {})

-- Toggle nvim-tree
map('n', '<leader>e', ':NvimTreeToggle<CR>', {})

map('n', '<leader>l', ':IndentLinesToggle<CR>', {})
map('n', '<leader>t', ':TagbarToggle<CR>', {})
map('n', '<leader>f', ':Telescope find_files<CR>', {})
