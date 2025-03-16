return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- Optional but recommended
		"MunifTanjim/nui.nvim",
		-- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window
	},
	config = function()
		require("neo-tree").setup({
			filesystem = {
				filtered_items = {
					visible = true, -- Show hidden files
					--     hide_dotfiles = false,
					--     hide_gitignored = false,
				},
				-- follow_current_file = true, -- Keep the tree focused on the current file
				-- hijack_netrw = true, -- Replace netrw with neo-tree
				-- use_libuv_file_watcher = true, -- Auto-refresh when files change
				trash = {
					enabled = false, -- Permanently delete files instead of moving them to trash
				},
			},
			window = {
				position = "left",
				width = 30,
				mappings = {
					["<space>"] = "none",
					["d"] = "delete", -- Press `d` to delete permanently
				},
			},
			default_component_configs = {
				icon = {
					folder_closed = "",
					folder_open = "",
					folder_empty = "",
				},
				modified = {
					symbol = "[+]",
					highlight = "NeoTreeModified",
				},
				git_status = {
					symbols = {
						added = "✚",
						modified = "",
						deleted = "✖",
						renamed = "➜",
						untracked = "★",
						ignored = "◌",
						unstaged = "✗",
						staged = "✓",
						conflict = "",
					},
				},
			},
		})
	end,
}
