return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
        "jay-babu/mason-nvim-dap.nvim",
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        -- DAP UI setup
        dapui.setup()

        -- DAP UI listeners
        dap.listeners.before.attach.dapui_config = function() dapui.open() end
        dap.listeners.before.launch.dapui_config = function() dapui.open() end
        dap.listeners.before.event_terminated.dapui_config = function() 
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function() 
            dapui.close()
        end

        -- Enable verbose logging

        -- Node.js adapter configuration
        dap.adapters["pwa-node"] = {
            type = "server",
            host = "localhost",
            port = "${port}",
            executable = {
                command = "node",
                args = { vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js", "${port}" },
            },
        }

        -- JavaScript configuration

	dap.configurations.javascript = {
	    {
		name = "Launch Node.js",
		type = "pwa-node",
		request = "launch",
		program = "${file}",
		cwd = vim.fn.getcwd(),
		sourceMaps = false,
		protocol = "inspector",
		runtimeExecutable = "node",
		runtimeArgs = { "--inspect-brk" },  -- Add this
		console = "integratedTerminal",
		skipFiles = { "<node_internals>/**" },
		trace = true,
	    },
	}

       -- TypeScript configuration
        dap.configurations.typescript = {
            {
                name = "Launch TS File",
                type = "pwa-node",
                request = "launch",
                program = "${file}",
                cwd = "${workspaceFolder}",
                runtimeExecutable = "ts-node",
                sourceMaps = true,
                protocol = "inspector",
                console = "integratedTerminal",
                skipFiles = { "<node_internals>/**" },
                trace = true,
            },
        }

	-- Keymaps
	vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
	vim.keymap.set("n", "<Leader>dT", dap.clear_breakpoints, { desc = "Clear All Breakpoints" })
	vim.keymap.set("n", "<Leader>dc", dap.continue, { desc = "Continue Execution" })
	vim.keymap.set("n", "<Leader>dn", dap.step_over, { desc = "Step Over" })
	vim.keymap.set("n", "<Leader>di", dap.step_into, { desc = "Step Into" })
	vim.keymap.set("n", "<Leader>do", dap.step_out, { desc = "Step Out" })
	vim.keymap.set("n", "<Leader>dr", dap.repl.open, { desc = "Open REPL" })
	vim.keymap.set("n", "<Leader>dl", function() vim.cmd("DapShowLog") end, { desc = "Show DAP Log" })
	vim.keymap.set("n", "<Leader>dq", dap.terminate, { desc = "Terminate Debugging" })
	vim.keymap.set("n", "<Leader>du", dap.up, { desc = "Move Up Stack" })
	vim.keymap.set("n", "<Leader>dd", dap.down, { desc = "Move Down Stack" })
	vim.keymap.set("n", "<Leader>de", dapui.eval, { desc = "Evaluate Expression" })
	vim.keymap.set("n", "<Leader>ds", function() require("dap.ui.widgets").scopes() end, { desc = "Show Variable Scopes" })
	vim.keymap.set("n", "<Leader>df", function() require("dap.ui.widgets").frames() end, { desc = "Show Call Stack" })

    end,
}

