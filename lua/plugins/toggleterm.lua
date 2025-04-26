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

    local float_term = Terminal:new({ direction = "float", hidden = true })

    local vertical_term = Terminal:new({ direction = "vertical", size = 80, hidden = true })
    function _VERTICAL_TERM_TOGGLE()
      vertical_term:toggle()
    end

    -- Custom toggles
    vim.api.nvim_set_keymap('n', '<leader>tv', '<cmd>lua _VERTICAL_TERM_TOGGLE()<CR>', opts)
  end
}


