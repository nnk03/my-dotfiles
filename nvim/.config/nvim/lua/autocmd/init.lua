require('autocmd.clang-format-autocmd')
require('autocmd.sh-file-autocmd')
require('autocmd.rust-format-autocmd')

-- highlighting yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
   callback = function()
      vim.highlight.on_yank()
   end,
})

-- to enable the plugin automatically when opening markdown files
vim.api.nvim_create_autocmd("FileType", {
   pattern = "markdown",
   callback = function()
      require("render-markdown").enable()
   end,
})
