-- ~/.config/nvim/after/ftplugin/haskell.lua
local ht = require('haskell-tools')
local bufnr = vim.api.nvim_get_current_buf()
local opts = { noremap = true, silent = true, buffer = bufnr }

-- Helper function to merge descriptions
local function map_opts(desc)
  return vim.tbl_extend('force', opts, { desc = desc })
end

-- haskell-language-server relies heavily on codeLenses,
-- so auto-refresh (see advanced configuration) is enabled by default
vim.keymap.set('n', '<space>hcl', vim.lsp.codelens.run, map_opts('Haskell: Run code lens'))

-- Hoogle search for the type signature of the definition under the cursor
vim.keymap.set('n', '<space>hs', ht.hoogle.hoogle_signature, map_opts('Haskell: Hoogle signature search'))

-- Evaluate all code snippets
vim.keymap.set('n', '<space>hea', ht.lsp.buf_eval_all, map_opts('Haskell: Evaluate all snippets'))

-- Toggle a GHCi repl for the current package
vim.keymap.set('n', '<leader>hrr', ht.repl.toggle, map_opts('Haskell: Toggle Package REPL'))

-- Toggle a GHCi repl for the current buffer
vim.keymap.set('n', '<leader>hrf', function()
  ht.repl.toggle(vim.api.nvim_buf_get_name(0))
end, map_opts('Haskell: Toggle Buffer REPL'))

-- Quit the GHCi repl
vim.keymap.set('n', '<leader>hrq', ht.repl.quit, map_opts('Haskell: Quit REPL'))
