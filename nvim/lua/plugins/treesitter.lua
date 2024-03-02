return {

    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "bash",
                "vimdoc",
                "html",
                "json",
                "lua",
                -- "markdown",
                -- "markdown_inline",
                "rust",
                "python",
                "query",
                "regex",
                "vim",
                "yaml",
                "go",
                "bicep",
                "terraform",
            },
            -- Disable terraform treesitter on fixture files
            highlight = {},
        },
    },
}
