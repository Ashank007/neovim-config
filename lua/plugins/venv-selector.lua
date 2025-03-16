
	return {
		"linux-cultist/venv-selector.nvim",
		branch = "regexp", -- ✅ Ensure we use the new version
		dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim" },
		config = function()
			require("venv-selector").setup()

			vim.keymap.set(
				"n",
				"<leader>v",
				":VenvSelect<CR>",
				{ noremap = true, silent = true, desc = "Select Python Virtual Env" }
			)
		end,
	}

