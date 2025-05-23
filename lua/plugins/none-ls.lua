return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
    local crlfmt = {
      method = null_ls.methods.FORMATTING,
      filetypes = { "go" },
      generator = null_ls.generator({
        command = "crlfmt",
        args = { "$FILENAME" },
        to_stdin = true,
        to_stdout = true,
        from_stderr = false,
        to_temp_file = true,
        from_temp_file = true,
        on_output = function(params, done)
          done({ { text = params.output } })  -- properly wrap output
        end,
      }),
    }
   null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
        crlfmt,
				null_ls.builtins.formatting.prettier.with({ extra_args = { "--single-quote", "--jsx-single-quote", "--tab-width", "1", "--semi", "false", "--trailing-comma", "none", "--arrow-parens", "avoid", "--print-width", "200" } }),
				null_ls.builtins.formatting.black,
			},
		})

		-- Set keybinding for formatting
		vim.keymap.set("n", "<F4>", vim.lsp.buf.format, {})
	end,
}


