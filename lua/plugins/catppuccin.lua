
return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            flavour = "mocha",
            background = { light = "latte", dark = "mocha" },
            transparent_background = true,
            term_colors = true,
            integrations = {
                cmp = true,
                gitsigns = true,
                nvimtree = true,
                treesitter = true,
                telescope = { enabled = true, style = "nvchad" },
                notify = true,
                mini = { enabled = true },
                which_key = true,
            },
            custom_highlights = function(colors)
                return {
                    Normal = { bg = nil }, -- Explicitly no background
                    LineNr = { fg = colors.overlay1 },
                    CursorLineNr = { fg = colors.peach, style = { "bold" } },
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

