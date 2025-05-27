-- enables undofile
vim.o.undofile = true

-- set mapleader before loading lazy
vim.g.mapleader = " "

-- contains the keymaps and options
require("neeraj.core")

-- contains plugins, lsp
require("neeraj.lazy")

--
-- local plugins = {}
-- local opts = {}

require("neeraj.autocmd")

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false -- Start with all folds open
vim.opt.foldlevel = 99 -- Don't auto-close any folds
