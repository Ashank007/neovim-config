return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
		},
		config = function()
			local telescope = require("telescope")

			telescope.setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
				defaults = {
					mappings = {
						i = { ["<C-x>"] = "delete_buffer" }, -- Delete buffer in insert mode
						n = { ["<C-x>"] = "delete_buffer" }, -- Delete buffer in normal mode
					},
				},
			})

			-- Load extensions
			telescope.load_extension("ui-select")

			-- Set keybindings
			vim.keymap.set(
				"n",
				"<leader>bb",
				"<cmd>Telescope buffers<CR>",
				{ silent = true, noremap = true, desc = "Show Buffers" }
			)
			vim.keymap.set(
				"n",
				"<leader>xx",
				"<cmd>Telescope diagnostics<CR>",
				{ silent = true, noremap = true, desc = "Show Diagnostics" }
			)
			vim.keymap.set(
				"n",
				"<leader>xq",
				"<cmd>Telescope quickfix<CR>",
				{ silent = true, noremap = true, desc = "Show Quickfix List" }
			)
			vim.keymap.set(
				"n",
				"<leader>xl",
				"<cmd>Telescope loclist<CR>",
				{ silent = true, noremap = true, desc = "Show Location List" }
			)
		end,
	},
}
