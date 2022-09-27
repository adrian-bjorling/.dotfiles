--[[ opts.lua ]]
local opt = vim.opt
local cmd = vim.api

-- [[ Context ]]
opt.colorcolumn = '120'           -- str:  Show col for max line length
opt.number = true                -- bool: Show line numbers
opt.scrolloff = 8                -- int:  Min num lines of context
opt.signcolumn = "yes"           -- str:  Show the sign column
opt.mouse = "a"

-- [[ Filetypes ]]
opt.encoding = 'utf8'            -- str:  String encoding to use
opt.fileencoding = 'utf8'        -- str:  File encoding to use

-- [[ Theme ]]
opt.syntax = "ON"                -- str:  Allow syntax highlighting
opt.termguicolors = true         -- bool: If term supports ui color then enable
cmd.nvim_command('colorscheme gruvbox')
-- Highlight the region on yank
cmd.nvim_create_autocmd('TextYankPost', {
    group = num_au,
    callback = function()
        vim.highlight.on_yank({ higroup = 'Visual', timeout = 120 })
    end,
})

---- [[ Search ]]
opt.ignorecase = true            -- bool: Ignore case in search patterns
opt.smartcase = true             -- bool: Override ignorecase if search contains capitals
opt.incsearch = true             -- bool: Use incremental search
opt.hlsearch = false             -- bool: Highlight search matches

-- [[ Whitespace ]]
opt.expandtab = true             -- bool: Use spaces instead of tabs
opt.shiftwidth = 2               -- num:  Size of an indent
opt.softtabstop = 2              -- num:  Number of spaces tabs count for in insert mode
opt.tabstop = 2                  -- num:  Number of spaces tabs count for
opt.smarttab = true
opt.cindent = true
opt.autoindent = true
opt.wrap = true
opt.textwidth = 300
opt.list = true
opt.listchars = 'trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂'
-- opt.listchars = 'eol:¬,space:·,lead: ,trail:·,nbsp:◇,tab:→-,extends:▸,precedes:◂,multispace:···⬝,leadmultispace:│   ,'
-- opt.formatoptions = 'qrn1'

-- [[ Splits ]]
opt.splitright = true            -- bool: Place new window to right of current one
opt.splitbelow = true            -- bool: Place new window below the current one
