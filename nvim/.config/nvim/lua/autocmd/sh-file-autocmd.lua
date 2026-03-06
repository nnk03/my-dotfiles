vim.api.nvim_create_autocmd("FileType", {
   pattern = "sh",
   callback = function()
      vim.opt_local.expandtab = false
   end,
})


