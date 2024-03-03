-- Ensure this is placed in a file that's properly loaded by your Neovim setup, such as init.lua or a dedicated plugins.lua file that's sourced by init.lua.

return {
    {
        "kdheepak/lazygit.nvim",
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
}
