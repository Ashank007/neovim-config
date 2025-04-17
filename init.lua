vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
vim.o.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.swapfile = false
vim.g.clipboard = {
	name = "wl-clipboard",
	copy = { ["+"] = "wl-copy", ["*"] = "wl-copy" },
	paste = { ["+"] = "wl-paste", ["*"] = "wl-paste" },
}
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = false,
    underline = true,
})
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

vim.cmd [[
  hi BufferLineFill guibg=NONE
  hi BufferLineBufferSelected guifg=#ffcc66 gui=bold
]]


-- Enhanced notify catcher
local notify_log = vim.fn.stdpath("cache") .. "/notify.log"

vim.notify = function(msg, level, opts)
  local hl = ({
    [vim.log.levels.ERROR] = "ErrorMsg",
    [vim.log.levels.WARN] = "WarningMsg",
    [vim.log.levels.INFO] = "Normal",
  })[level or vim.log.levels.INFO] or "Normal"

  -- Log to file
  local f = io.open(notify_log, "a")
  if f then
    f:write(("[%s] %s\n"):format(os.date("%Y-%m-%d %H:%M:%S"), msg))
    f:close()
  end

  -- Show in floating window
  vim.api.nvim_echo({ { msg, hl } }, true, {})
end

-- Shortcut to open notify log
vim.keymap.set("n", "<Leader>dn", function()
  vim.cmd("tabnew " .. notify_log)
end, { desc = "Open Notify Log" })


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
