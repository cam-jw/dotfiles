--return {
--    -- add gruvbox
--    { "wittyjudge/gruvbox-material.nvim" },
--
--    -- Configure LazyVim to load gruvbox
--    {
--        "LazyVim/LazyVim",
--        opts = {
--            colorscheme = "gruvbox-material",
--        },
--    },
--}
--{ "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opts = ...}
return {
    { "mcchrish/zenbones.nvim", dependencies = { "rktjmp/lush.nvim" } },
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "zenbones",
        },
    },
}
