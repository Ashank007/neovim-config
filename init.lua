vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
vim.o.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.g.clipboard = {
	name = "wl-clipboard",
	copy = { ["+"] = "wl-copy", ["*"] = "wl-copy" },
	paste = { ["+"] = "wl-paste", ["*"] = "wl-paste" },
}
vim.o.wrap = true
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })

vim.cmd [[
  hi BufferLineFill guibg=NONE
  hi BufferLineBufferSelected guifg=#ffcc66 gui=bold
]]


-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git", "clone", "--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git", lazypath
	})
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")
require("keymaps")
