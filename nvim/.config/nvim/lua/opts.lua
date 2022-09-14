--[[ opts.lua ]]
local opt = vim.opt
local cmd = vim.api.nvim_command

-- [[ Context ]]
opt.colorcolumn = '120'
opt.number = true
opt.scrolloff = 4
opt.signcolumn = "yes"

-- [[ Filetypes ]]
opt.encoding = 'utf8'
opt.fileencoding = 'utf8'

-- [[ Theme ]]
opt.syntax = "ON"
opt.termguicolors = true
cmd('colorscheme everforest')

-- [[ Search ]]
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = false

-- [[ Whitespace ]]
opt.expandtab = true
opt.shiftwidth = 2
opt.softtabstop = 2
opt.tabstop = 2

-- [[ Splits ]]
opt.splitright = true
opt.splitbelow = true
