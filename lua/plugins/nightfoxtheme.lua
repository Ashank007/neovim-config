return {
  {
    "EdenEast/nightfox.nvim",
    config = function()
      require("nightfox").setup({
        groups = {
          all = {
            Normal = { bg = "NONE" }, -- Makes the main editor background transparent
            NormalNC = { bg = "NONE" }, -- Transparent for inactive windows
            EndOfBuffer = { bg = "NONE" }, -- Hide '~' at the end of buffer
            SignColumn = { bg = "NONE" }, -- Transparent sign column (left margin)
            CursorLine = { bg = "NONE" }, -- Transparent cursor line
            StatusLine = { bg = "NONE" }, -- Transparent statusline
          },
        }
      })

      -- Set the colorscheme
      vim.cmd("colorscheme duskfox") -- Change this to any Nightfox theme
    end
  }
}


