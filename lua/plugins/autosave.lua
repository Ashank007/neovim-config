return {
  "pocco81/auto-save.nvim",
  config = function()
    require("auto-save").setup {
      enabled = true,
      execution_message = {
        message = function()
          return ("AutoSaved at " .. vim.fn.strftime("%H:%M:%S"))
        end,
      },
      events = {"InsertLeave", "TextChanged"},
      conditions = {
        exists = true,
        modifiable = true
      },
      write_all_buffers = false,
    }
  end
}

