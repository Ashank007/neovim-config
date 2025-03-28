return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = { theme = "auto" },
			sections = {
				lualine_b = {
					"branch",
					{
						"filename",
						path = 1, -- Show relative path
						icons_enabled = true, -- Enable icons
						file_status = true, -- Show file status (like modified)
						newfile_status = false, -- Don't show [No Name]
					},
				},
				lualine_x = {
					"encoding",
					"fileformat",
					"filetype",
					{
						function()
							local recording = vim.fn.reg_recording()
							if recording ~= "" then
								return "Recording @" .. recording
							end
							return ""
						end,
						color = { fg = "#ff9e64", gui = "bold" }, -- Orange text
					},
				},
			},
		})
	end,
}


