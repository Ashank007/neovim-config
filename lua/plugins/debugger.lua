return {
  -- DAP Core
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      -- REQUIRED: nvim-nio for dap-ui
      { "nvim-neotest/nvim-nio" },

      -- JS/TS Debug Adapter
      {
        "mxsdev/nvim-dap-vscode-js",
        config = function()
          require("dap-vscode-js").setup({
            node_path = "node", -- or "/usr/bin/node"
            debugger_path = vim.fn.stdpath("data") .. "/js-debug", -- clone path
            adapters = { "pwa-node" },
          })
        end,
      },

      -- DAP UI
      {
        "rcarriga/nvim-dap-ui",
        config = function()
          local dap, dapui = require("dap"), require("dapui")
          dapui.setup()
          dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
          end
          dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
          end
          dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
          end
        end,
      },
    },

    config = function()
      local dap = require("dap")

      for _, lang in ipairs({ "javascript", "typescript" }) do
        dap.configurations[lang] = {
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            cwd = "${workspaceFolder}",
          },
          {
            type = "pwa-node",
            request = "attach",
            name = "Attach to process",
            processId = require("dap.utils").pick_process,
            cwd = "${workspaceFolder}",
          },
        }
      end

      -- Keymaps
      local map = vim.keymap.set
      local opts = { noremap = true, silent = true }

      map("n", "<F5>", function() dap.continue() end, opts)
      map("n", "<F10>", function() dap.step_over() end, opts)
      map("n", "<F11>", function() dap.step_into() end, opts)
      map("n", "<F12>", function() dap.step_out() end, opts)
      map("n", "<Leader>b", function() dap.toggle_breakpoint() end, opts)
      map("n", "<Leader>B", function() dap.set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, opts)
      map("n", "<Leader>dr", function() dap.repl.open() end, opts)
      map("n", "<Leader>dl", function() dap.run_last() end, opts)
    end,
  },
}


