-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.api.nvim_set_keymap("n", "<C-h>", "<Cmd>NvimTmuxNavigateLeft<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<Cmd>NvimTmuxNavigateDown<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<Cmd>NvimTmuxNavigateUp<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<Cmd>NvimTmuxNavigateRight<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<C-\\>", "<Cmd>NvimTmuxNavigateLastActive<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<C-Space>", "<Cmd>NvimTmuxNavigateNext<CR>", { silent = true, noremap = true })
