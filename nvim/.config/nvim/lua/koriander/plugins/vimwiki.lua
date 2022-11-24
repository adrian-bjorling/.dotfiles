local command = "let g:vimwiki_list = [{'path': '~/doc/wiki/', 'syntax': 'markdown', 'ext': '.md'}]"

local status, _ = pcall(vim.cmd, command)
if not status then
	print("Colorscheme not found!")
	return
end
