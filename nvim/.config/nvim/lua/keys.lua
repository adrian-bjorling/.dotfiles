--[[ keys.lua ]]
local map = vim.api.nvim_set_keymap

-- remap the key used to leave insert mode
map('i', 'jk', '', {})

-- Toggle nvim-tree
map('n', '<leader>e', ':NvimTreeToggle<CR>', {})

map('n', '<leader>t', ':TagbarToggle<CR>', {})

-- Bufferline
map("n", "<S-l>", ":BufferLineCycleNext<CR>", {}) --go to next buffer
map("n", "<S-h>", ":BufferLineCyclePrev<CR>", {}) --go to previous buffer

-- [[Load recent sessions]]
map("n", "<leader>sl", ":SessionLoad<CR>", {})

-- Keybindings for telescope
map('n', '<leader>f', ':Telescope find_files<CR>', {})
map("n", "<leader>fr", ":Telescope oldfiles<CR>", {})
map("n", "<leader>ff", ":Telescope find_files<CR>", {})
map("n", "<leader>fb", ":Telescope file_browser<CR>", {})
map("n", "<leader>fw", ":Telescope live_grep<CR>", {})
