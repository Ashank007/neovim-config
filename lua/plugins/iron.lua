return {
  "hkupty/iron.nvim",
  config = function()
    local iron = require("iron.core")

    iron.setup({
      config = {
        scratch_repl = true,
        repl_definition = {
          sh = {
            command = { "zsh" },
          },
          python = {
            command = { "ipython" },
          },
        },
        repl_open_cmd = require("iron.view").right(80),
      },
      highlight = {
        italic = true,
      },
      ignore_blank_lines = true,
    })

    -- Map iron functions properly

    vim.keymap.set("n", "<space>wf", function() iron.send_file() end)
    vim.keymap.set("n", "<space>wl", function() iron.send_line() end)
    vim.keymap.set("n", "<space>s<cr>", function() iron.send(nil, {"\r"}) end) -- Enter
    vim.keymap.set("n", "<space>s<space>", function() iron.send(nil, {"\003"}) end) -- Ctrl
    vim.keymap.set("n", "<space>rc", function() iron.send_motion() end)
    vim.keymap.set("v", "<space>rc", function() iron.visual_send() end)
    vim.keymap.set("n", "<space>cl", function()
      iron.send(nil, {"clear"})  -- Sends the `clear` command to the REPL
    end)


        -- Iron commands
    vim.keymap.set("n", "<space>rs", "<cmd>IronRepl<cr>")
    vim.keymap.set("n", "<space>rr", "<cmd>IronRestart<cr>")
    vim.keymap.set("n", "<space>rf", "<cmd>IronFocus<cr>")
    vim.keymap.set("n", "<space>rh", "<cmd>IronHide<cr>")
    vim.keymap.set("n", "<space>rq", function()
      vim.cmd("IronFocus")
      vim.cmd("q")
         end)
  end,
}


