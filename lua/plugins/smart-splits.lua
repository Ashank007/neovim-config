return {
  "mrjones2014/smart-splits.nvim",
  lazy = false,
  opts = {},
  config = function()
    require("smart-splits").setup({})

    -- Move between splits
    vim.keymap.set("n", "<A-h>", require("smart-splits").move_cursor_left)
    vim.keymap.set("n", "<A-j>", require("smart-splits").move_cursor_down)
    vim.keymap.set("n", "<A-k>", require("smart-splits").move_cursor_up)
    vim.keymap.set("n", "<A-l>", require("smart-splits").move_cursor_right)

    -- Resize splits
    vim.keymap.set("n", "<A-H>", require("smart-splits").resize_left)
    vim.keymap.set("n", "<A-J>", require("smart-splits").resize_down)
    vim.keymap.set("n", "<A-K>", require("smart-splits").resize_up)
    vim.keymap.set("n", "<A-L>", require("smart-splits").resize_right)
  end,
}

