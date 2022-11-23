-- set leader key to space
vim.g.mapleader = " "

local map = vim.keymap -- for conciseness

---------------------
-- General Keymaps
---------------------

-- use jk to exit insert mode
map.set("i", "jk", "<ESC>")

-- clear search highlights
map.set("n", "<leader>nh", ":nohl<CR>")

-- delete single character without copying into register
map.set("n", "x", '"_x')

-- increment/decrement numbers
map.set("n", "<leader>+", "<C-a>") -- increment
map.set("n", "<leader>-", "<C-x>") -- decrement

-- window management
map.set("n", "<leader>sv", "<C-w>v") -- split window vertically
map.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
map.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
map.set("n", "<leader>sc", ":close<CR>") -- close current split window

map.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
map.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
map.set("n", "<S-l>", ":tabn<CR>") --  go to next tab
map.set("n", "<S-h>", ":tabp<CR>") --  go to previous tab

----------------------
-- Plugin Keybinds
----------------------

-- vim-maximizer
map.set("n", "<C-w>m", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
map.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer

-- telescope
map.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
map.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
map.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
map.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
map.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- telescope git commands (not on youtube nvim video)
map.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
map.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
map.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
map.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- restart lsp server (not on youtube nvim video)
map.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary
