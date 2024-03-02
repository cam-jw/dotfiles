-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
local colorscheme = require("lazyvim.plugins.colorscheme")
vim.o.termguicolors = true
vim.cmd("colorscheme zenbones")
