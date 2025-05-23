return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("bufferline").setup({
			options = {
				close_command = "bdelete! %d", -- Close buffer when clicking X
				right_mouse_command = "bdelete! %d",

				diagnostics = "nvim_lsp", -- Show LSP diagnostics in bufferline
				show_buffer_close_icons = false, -- Show close icons on each buffer
				show_close_icon = false, -- Hide the global close button
		},
		})
		-- Keybindings for buffer navigation
		vim.api.nvim_set_keymap("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<C-X>", "<Cmd>bdelete<CR>", { noremap = true, silent = true }) -- Close current buffer
		for i = 1, 9 do
			vim.api.nvim_set_keymap("n", "<M-" .. i .. ">", "<Cmd>BufferLineGoToBuffer " .. i .. "<CR>", { noremap = true, silent = true })
		end
	end,
}

