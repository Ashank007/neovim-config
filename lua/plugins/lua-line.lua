return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = {
        theme = "auto",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_b = {
          { "branch", icon = "" },
          "diff",
        },
        lualine_c = {
          {
            "filename",
            path = 1, -- Show relative path
            icons_enabled = true, -- Enable icons
            file_status = true, -- Show file status
            newfile_status = false, -- Don't show [No Name]
          },
          {
            function()
              local recording = vim.fn.reg_recording()
              if recording ~= "" then
                return "Recording @" .. recording
              end
              return ""
            end,
            color = { fg = "#ff9e64", gui = "bold" },
          },
        },
        lualine_x = {
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            sections = { "error", "warn", "info", "hint" },
            symbols = { error = " ", warn = " ", info = " ", hint = " " },
            colored = true,
            update_in_insert = false,
            always_visible = false,
          },
          "encoding",
          "fileformat",
          {
            "filetype",
            icon_only = true,
            colored = true,
          },
        },
      },
    })
  end,
}


