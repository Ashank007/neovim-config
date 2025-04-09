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
      popup_border_style = "rounded",

      filesystem = {
        filtered_items = {
          visible = true, -- Show hidden files
        },
        follow_current_file = {
          enabled = true, -- Focus the current file in the tree
        },
        use_libuv_file_watcher = true, -- Auto-refresh when files change
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
        indent = {
          with_expanders = true,
          expander_collapsed = "",
          expander_expanded = "",
          expander_highlight = "NeoTreeExpander",
        },
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

      diagnostics = {
        enabled = true,
        symbols = {
          hint = "",
          info = "",
          warn = "",
          error = "",
        },
      },

      event_handlers = {
        {
          event = "neo_tree_buffer_enter",
          handler = function()
            vim.wo.number = true
            vim.wo.relativenumber = true
          end,
        },
      },
    })

    -- Optional custom highlights (adjust to match your colorscheme)
    vim.cmd([[
      highlight NeoTreeNormal guibg=#1e1e2e
      highlight NeoTreeNormalNC guibg=#1e1e2e
      highlight NeoTreeCursorLine guibg=#313244
    ]])
  end,
}


