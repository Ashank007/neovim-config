return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            flavour = "mocha", -- latte, frappe, macchiato, mocha
            background = { light = "latte", dark = "mocha" }, -- Auto-switch between light and dark
            transparent_background = false, -- Set true for a transparent background
            term_colors = true, -- Use terminal colors
            integrations = {
                cmp = true,
                gitsigns = true,
                nvimtree = true,
                treesitter = true,
                telescope = {
                    enabled = true,
                    style = "nvchad", -- Options: classic, nvchad
                },
                notify = true,
                mini = { enabled = true },
                which_key = true,
            },
            custom_highlights = function(colors)
                return {
		    Normal = { bg = colors.base },
                    LineNr = { fg = colors.overlay1 },
                    -- Custom color for cursor line
                    CursorLineNr = { fg = colors.peach, style = { "bold" } },
                    -- Customize LSP diagnostics
                    DiagnosticError = { fg = colors.red },
                    DiagnosticWarn = { fg = colors.yellow },
                    DiagnosticInfo = { fg = colors.sky },
                    DiagnosticHint = { fg = colors.teal },
                }
            end
        })
        vim.cmd.colorscheme "catppuccin"
    end
}

