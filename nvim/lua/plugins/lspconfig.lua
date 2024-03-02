return {
    {
        "neovim/nvim-lspconfig",
        ---@class PluginLspOpts
        opts = {
            ---@type lspconfig.options
            servers = {
                -- pyright will be automatically installed with mason and loaded with lspconfig
                -- pyright = {},
                bashls = {},
                -- gopls = {},
                bicep = {},
                yamlls = {},
                marksman = {},
                powershell_es = {},
                -- azure_pipelines_ls = {},
                terraformls = {},
                rust_analyzer = {},
                helm_ls = {},
            },
        },
    },
}
