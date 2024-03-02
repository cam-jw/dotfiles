-- vim-based function to get the current and total lines
local function get_location()
    local current_line = vim.fn.line(".")
    local total_lines = vim.fn.line("$")
    return string.format("%d/%d", current_line, total_lines)
end

return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },

    opts = function(_, opts)
        opts.options = {
            icons_enabled = false,
            theme = "auto",
            component_separators = { left = "", right = "" },
            section_separators = { left = "", right = "" },
            disabled_filetypes = {
                statusline = {},
                winbar = {},
            },
            ignore_focus = {},
            always_divide_middle = true,
            globalstatus = vim.go.laststatus == 3,
            refresh = {
                statusline = 1000,
                tabline = 1000,
                winbar = 1000,
            },
        }

        opts.sections = {
            lualine_a = { "mode" },
            lualine_b = { "branch" },
            lualine_c = { { "filename", path = 1 } },
            lualine_x = {},
            lualine_y = {},
            lualine_z = {
                {
                    "location",
                    fmt = get_location,
                },
            },
        }
        opts.inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { { "filename", path = 1 } },
            lualine_x = {},
            lualine_y = {},
            lualine_z = {},
        }

        opts.tabline = {}
        opts.winbar = {}
        opts.inactive_winbar = {}
        opts.extensions = {}
    end,
}
