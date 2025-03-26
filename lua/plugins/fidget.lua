return {
	"j-hui/fidget.nvim",
	event = "LspAttach",
	config = function()
		require("fidget").setup({
			-- Progress spinner and text
			-- Filter out formatting tasks
			progress = {
				ignore = { "Formatting" }, -- Suppress tasks matching this pattern
			},
			-- Notification behavior
			notification = {
				override_vim_notify = false, -- Don’t override vim.notify
			},
		})
	end,
}
