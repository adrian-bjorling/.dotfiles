--[[ opts.lua ]]
local set = vim.opt
local cmd = vim.api

-- [[ Context ]]
set.colorcolumn = "120"
set.number = true
set.scrolloff = 8
set.signcolumn = "yes"
set.mouse = "a"

-- [[ Filetypes ]]
set.encoding = "utf-8"
set.fileencoding = "utf-8"

-- [[ Theme ]]
set.syntax = "ON"
set.termguicolors = true
require('onedark').setup {
    style = 'darker'
}
require('onedark').load()
-- Highlight the region on yank
cmd.nvim_create_autocmd('TextYankPost', {
    group = num_au,
    callback = function()
        vim.highlight.on_yank({ higroup = 'Visual', timeout = 120 })
    end,
})

---- [[ Search ]]
set.ignorecase = true
set.smartcase = true
set.incsearch = true
set.hlsearch = false

-- [[ Whitespace ]]
set.expandtab = true
set.shiftwidth = 4
set.softtabstop = 4
set.tabstop = 4
set.smarttab = true
set.cindent = true
set.autoindent = true
set.wrap = true
set.textwidth = 300
set.list = true
set.listchars = 'trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂'

-- [[ Splits ]]
set.splitright = true
set.splitbelow = true
