return {
	"akinsho/toggleterm.nvim",
	config = function()
		require("toggleterm").setup({
			size = 10, -- Adjust the terminal height
			open_mapping = [[<C-\>]],
			direction = "horizontal", -- Opens at the bottom
			start_in_insert = true,
			persist_mode = false, -- Prevents closing when you switch buffers
		})

		-- Remove line numbers and cursorline in terminal mode
		vim.api.nvim_create_autocmd("TermOpen", {
			pattern = "*",
			callback = function()
				vim.cmd("setlocal nonumber norelativenumber nocursorline")
			end,
		})

		-- Keybindings
		local opts = { noremap = true, silent = true }

		-- Exit terminal mode with Esc
		vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", opts)

		-- Jump between terminal and normal buffer
		vim.api.nvim_set_keymap("n", "<C-t>", ":ToggleTerm<CR>", opts) -- Open/close terminal
		vim.api.nvim_set_keymap("t", "<C-t>", "<C-\\><C-n>:ToggleTerm<CR>", opts) -- Exit & toggle

		-- Move between windows easily
		vim.api.nvim_set_keymap("t", "<C-h>", "<C-\\><C-n><C-w>h", opts)
		vim.api.nvim_set_keymap("t", "<C-l>", "<C-\\><C-n><C-w>l", opts)
		vim.api.nvim_set_keymap("t", "<C-k>", "<C-\\><C-n><C-w>k", opts)
		vim.api.nvim_set_keymap("t", "<C-j>", "<C-\\><C-n><C-w>j", opts)

		-- Move up/down in terminal while in insert mode
		vim.api.nvim_set_keymap("t", "<C-Up>", "<C-\\><C-n><C-w>k", opts)
		vim.api.nvim_set_keymap("t", "<C-Down>", "<C-\\><C-n><C-w>j", opts)
	end,
}

