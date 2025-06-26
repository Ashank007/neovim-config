-- Set leader key
vim.g.mapleader = " "  -- Space as leader


vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true }) -- Move line down
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true }) -- Move line upvalue

-- Telescope (Fuzzy Finder)
vim.keymap.set("n", "<leader>ff", function()
  require("telescope.builtin").find_files({
    path_display = { "truncate" }  -- 🪄 truncates the left side of the path
  })
end, { silent = true })
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", { silent = true })  -- Search text
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", { silent = true })  -- Switch buffers
vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>", { silent = true })  -- Search help docs
vim.api.nvim_set_keymap('n', '<leader>fk', '<cmd>Telescope lsp_definitions<cr>', { noremap = true, silent = true })
-- Window Management
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { silent = true })  -- Split window vertically
vim.keymap.set("n", "<leader>sh", ":split<CR>", { silent = true })  -- Split window horizontally
vim.keymap.set("n", "<leader>q", ":q<CR>", { silent = true })  -- Quit window
vim.keymap.set("n", "<leader>w", ":w<CR>", { silent = true })  -- Save file

vim.keymap.set("n", "h", "<C-w>h", { silent = true })  -- Move left
vim.keymap.set("n", "l", "<C-w>l", { silent = true })  -- Move right
vim.keymap.set("n", "j", "<C-w>j", { silent = true })  -- Move down
vim.keymap.set("n", "k", "<C-w>k", { silent = true })  -- Move up


-- Buffer Navigation
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { silent = true })  -- Next buffer
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { silent = true })  -- Previous buffer

vim.keymap.set("n", "<leader>bd", function()
  local current_buf = vim.api.nvim_get_current_buf()
  local bufs = vim.tbl_filter(function(buf)
    return vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].buflisted
  end, vim.api.nvim_list_bufs())

  if #bufs > 1 then
    vim.cmd("bnext") -- Switch to the next buffer
  end

  -- Delete the original buffer
  vim.cmd("bdelete " .. current_buf)
end, { silent = true })


-- Smooth Scrolling (Requires 'neoscroll.nvim')
vim.keymap.set("n", "<C-d>", "<C-d>zz", { silent = true })  -- Scroll down
vim.keymap.set("n", "<C-u>", "<C-u>zz", { silent = true })  -- Scroll up

-- LSP Keybindings
vim.keymap.set("n", "gd", ":lua vim.lsp.buf.definition()<CR>", { silent = true })  -- Go to definition
vim.keymap.set("n", "K", ":lua vim.lsp.buf.hover()<CR>", { silent = true })  -- Show hover info
vim.keymap.set("n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>", { silent = true })  -- Rename symbol
vim.keymap.set("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>", { silent = true })  -- Code action
vim.keymap.set("n", "[d", ":lua vim.diagnostic.goto_prev()<CR>", { silent = true })  -- Previous diagnostic
vim.keymap.set("n", "]d", ":lua vim.diagnostic.goto_next()<CR>", { silent = true })  -- Next diagnostic

-- Git Integration (Requires 'gitsigns.nvim')
vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { silent = true })  -- Git preview hunk
vim.keymap.set("n", "<leader>gb", ":Gitsigns blame_line<CR>", { silent = true })  -- Git blame
vim.keymap.set("n", "<leader>gr", ":Gitsigns reset_hunk<CR>", { silent = true })  -- Reset Git hunk
vim.keymap.set("n", "<leader>gs", ":Gitsigns stage_hunk<CR>", { silent = true })  -- Stage Git hunk

-- Remap arrow keys to behave like gk and gj (move through wrapped lines)
vim.api.nvim_set_keymap('n', '<Up>', 'gk', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Down>', 'gj', { noremap = true, silent = true })


