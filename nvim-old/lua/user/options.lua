local options = {
	backup = false,
	clipboard = "unnamedplus",
	hlsearch = false,
	ignorecase = true,
	mouse = "a",
	showmode = false,
	smartindent = true,
	splitbelow = true,
	splitright = true,
	swapfile = false,
	termguicolors = true,
	undofile = true,
	expandtab = true,
	shiftwidth = 4,
	tabstop = 4,
	number = true,
	relativenumber = true,
    numberwidth = 4,
    signcolumn = "no",
    wrap = false,
    scrolloff = 8,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end


