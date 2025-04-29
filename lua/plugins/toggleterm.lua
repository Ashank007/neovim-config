return {
  "akinsho/toggleterm.nvim",
  config = function()
    require("toggleterm").setup({
      size = 4,
      open_mapping = [[<C-\>]],
      direction = "float",
      start_in_insert = true,
      persist_mode = false,
      float_opts = {
        border = "rounded",
        width = 120,
        height = 30,
      }
    })

    vim.api.nvim_create_autocmd("TermOpen", {
      pattern = "*",
      callback = function()
        vim.cmd("setlocal nonumber norelativenumber nocursorline")
      end,
    })

    local opts = { noremap = true, silent = true }

    vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", opts)
    vim.api.nvim_set_keymap("n", "<C-t>", ":ToggleTerm<CR>", opts)
    vim.api.nvim_set_keymap("t", "<C-t>", "<C-\\><C-n>:ToggleTerm<CR>", opts)

    vim.api.nvim_set_keymap("t", "<C-h>", "<C-\\><C-n><C-w>h", opts)
    vim.api.nvim_set_keymap("t", "<C-l>", "<C-\\><C-n><C-w>l", opts)
    vim.api.nvim_set_keymap("t", "<C-k>", "<C-\\><C-n><C-w>k", opts)
    vim.api.nvim_set_keymap("t", "<C-j>", "<C-\\><C-n><C-w>j", opts)

    vim.api.nvim_set_keymap("t", "<C-Up>", "<C-\\><C-n><C-w>k", opts)
    vim.api.nvim_set_keymap("t", "<C-Down>", "<C-\\><C-n><C-w>j", opts)

    -- === Custom Terminals ===
    local Terminal = require('toggleterm.terminal').Terminal

    -- Define the floating terminal
    local float_term = Terminal:new({ direction = "float", hidden = true })

    -- Define the vertical terminal (opens from right)
    local vertical_term = Terminal:new({
      direction = "vertical",
      size = 60,
      hidden = true,
      -- No position option in `toggleterm`, we will adjust the window manually
    })

    -- Function to toggle the vertical terminal and center it
    function _VERTICAL_TERM_TOGGLE()
      if vertical_term:is_open() then
        vertical_term:close()  -- Close the terminal if it's open
      else
        vertical_term:toggle()  -- Open the terminal if it's closed
        if vertical_term:is_open() then
          -- After opening, center the terminal from the right
          local screen_width = vim.o.columns
          local term_width = vertical_term.size
          local offset = (screen_width - term_width) / 2  -- Calculate the offset to center the terminal
          vim.cmd(string.format("vertical resize %d", term_width)) -- Set the terminal size
          vim.cmd(string.format("rightbelow vertical resize %d", term_width)) -- Position it from the right side
        end
      end
    end

    -- Custom toggles for vertical terminal
    vim.api.nvim_set_keymap('n', '<leader>tv', '<cmd>lua _VERTICAL_TERM_TOGGLE()<CR>', opts)
  end
}


