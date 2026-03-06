-- highlighting yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
   callback = function()
      vim.highlight.on_yank()
   end,
})

vim.api.nvim_create_autocmd("FileType", {
   pattern = "sh",
   callback = function()
      vim.opt_local.expandtab = false
   end,
})

-- 1. Create a group to manage the autocommand
local clang_fmt_group = vim.api.nvim_create_augroup("ClangFormatGroup", { clear = true })

-- 2. Define the Autocommand
-- to apply clang-format when saving cpp files and arduino files
vim.api.nvim_create_autocmd("BufWritePost", {
   group = clang_fmt_group,
   pattern = { "*.cpp", "*.c", "*.h", "*.ino" },
   callback = function()
      -- Only run if skip_clang_format is NOT set for this buffer
      if not vim.b.skip_clang_format then
         vim.cmd("silent !clang-format -i " .. vim.fn.expand("%"))
         -- Force a redraw/reload so you see the changes immediately
         vim.cmd("checktime")
      end
   end,
})

-- 3. Create the User Command to toggle it
vim.api.nvim_create_user_command("ClangFormatToggle", function()
   -- Toggle the boolean value
   vim.b.skip_clang_format = not vim.b.skip_clang_format
   -- Provide feedback so you know the current state
   local state = vim.b.skip_clang_format and "DISABLED" or "ENABLED"
   print("Clang-Format is now " .. state .. " for this buffer.")
end, { desc = "Toggle clang-format for the current buffer" })

-- to enable the plugin automatically when opening markdown files
vim.api.nvim_create_autocmd("FileType", {
   pattern = "markdown",
   callback = function()
      require("render-markdown").enable()
   end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
   pattern = { "*.rs" },
   command = "silent ! rustfmt %",
})
