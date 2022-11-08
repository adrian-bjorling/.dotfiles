--[[ keys.lua ]]
local map = vim.api.nvim_set_keymap
local opt = { noremap = true }

-- Leader
vim.g.mapleader = " "
vim.g.localleader = " "

-- remap the key used to leave insert mode
map('i', 'jk', '', opt)

-- Toggle nvim-tree
map('n', '<leader>e', ':NvimTreeToggle<CR>', opt)

-- Toggle more plugins
map('n', '<leader>l', ":IndentLinesToggle<CR>", opt)
map('n', '<leader>t', ":TagbarToggle<CR>", opt)

-- Bufferline
map("n", "<S-l>", ":BufferLineCycleNext<CR>", opt)
map("n", "<S-h>", ":BufferLineCyclePrev<CR>", opt)

-- Dashboard
map("n", "<leader>sl", ":SessionLoad<CR>", opt)
map("n", "<leader>fh", ":SessionLoad<CR>", opt)

-- Keybindings for telescope
map("n", "<leader>fr", ":Telescope oldfiles<CR>", opt)
map("n", "<leader>ff", ":Telescope find_files<CR>", opt)
map("n", "<leader>fb", ":Telescope file_browser<CR>", opt)
map("n", "<leader>fw", ":Telescope live_grep<CR>", opt)
