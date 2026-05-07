-- 1. Create a group to manage the autocommand
local clang_fmt_group = vim.api.nvim_create_augroup("ClangFormatGroup", { clear = true })

-- 2. Define the Autocommand
-- to apply clang-format when saving cpp files and arduino files
vim.api.nvim_create_autocmd("BufWritePost", {
   group = clang_fmt_group,
   pattern = { "*.cpp", "*.c", "*.h", "*.ino" },
   callback = function()
      -- Only run if skip_clang_format is NOT set for this buffer
      if not vim.b.skip_rust_format then
         vim.cmd("silent !clang-format -i " .. vim.fn.expand("%"))
         -- Force a redraw/reload so you see the changes immediately
         vim.cmd("checktime")
      end
   end,
})

-- 3. Create the User Command to toggle it
vim.api.nvim_create_user_command("ClangFormatToggle", function()
   -- Toggle the boolean value
   vim.b.skip_rust_format = not vim.b.skip_rust_format
   -- Provide feedback so you know the current state
   local state = vim.b.skip_rust_format and "DISABLED" or "ENABLED"
   print("Clang-Format is now " .. state .. " for this buffer.")
end, { desc = "Toggle clang-format for the current buffer" })


vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp" },
  callback = function()
    vim.opt_local.cindent = true
  end,
})
