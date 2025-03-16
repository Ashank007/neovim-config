
	return {
		"nvimdev/lspsaga.nvim",
		event = "LspAttach",
		config = function()
			require("lspsaga").setup({
				ui = {
					border = "rounded",
					devicon = true,
				},
				symbol_in_winbar = {
					enable = true,
				},
				lightbulb = {
					enable = true,
				},
				finder = {
					keys = {
						jump_to = "p", -- Jump to definition in finder
					},
				},
				rename = {
					in_select = false, -- Disable inline rename
				},
			})
		end,
		dependencies = { "nvim-tree/nvim-web-devicons" },
	}

