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
						i = { ["<C-x>"] = "delete_buffer" },
						n = { ["<C-x>"] = "delete_buffer" },
					},
          hidden = true,
          no_ignore = true,
          file_ignore_patterns = { "node_modules","dist/"},
				},
			})

			telescope.load_extension("ui-select")
			-- 🔥 Functions only: const/let async or arrow

			vim.keymap.set("n", "<leader>fs", function()
				require("telescope.builtin").current_buffer_fuzzy_find({
					prompt_title = "Arrow Functions in Current Buffer",
					fuzzy = false,
					previewer = true,
					-- Narrow results with a simple function pattern
					default_text = "const =>",
				})
			end, { desc = "Find Arrow Functions in Current Buffer" })

			-- Buffers
			vim.keymap.set(
				"n",
				"<leader>fb",
				"<cmd>Telescope buffers<CR>",
				{ silent = true, noremap = true, desc = "Show Buffers" }
			)

			-- Diagnostics
			vim.keymap.set(
				"n",
				"<leader>fx",
				"<cmd>Telescope diagnostics<CR>",
				{ silent = true, noremap = true, desc = "Show Diagnostics" }
			)

			-- Quickfix
			vim.keymap.set(
				"n",
				"<leader>fq",
				"<cmd>Telescope quickfix<CR>",
				{ silent = true, noremap = true, desc = "Show Quickfix List" }
			)

			-- Loclist
			vim.keymap.set(
				"n",
				"<leader>fl",
				"<cmd>Telescope loclist<CR>",
				{ silent = true, noremap = true, desc = "Show Location List" }
			)
		end,
	},
}
