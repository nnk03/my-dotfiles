-- 1. Create a group to manage the autocommand
local rust_fmt_group = vim.api.nvim_create_augroup("RustFormatGroup", { clear = true })

-- 2. Define the Autocommand
-- to apply rust-format when saving cpp files and arduino files
vim.api.nvim_create_autocmd("BufWritePost", {
   group = rust_fmt_group,
   pattern = { "*.rs" },
   callback = function()
      -- Only run if skip_rust_format is NOT set for this buffer
      if not vim.b.skip_rust_format then
         vim.cmd("silent ! rustfmt " .. vim.fn.expand("%"))
         -- Force a redraw/reload so you see the changes immediately
         vim.cmd("checktime")
      end
   end,
})

-- 3. Create the User Command to toggle it
vim.api.nvim_create_user_command("RustFormatToggle", function()
   -- Toggle the boolean value
   vim.b.skip_rust_format = not vim.b.skip_rust_format
   -- Provide feedback so you know the current state
   local state = vim.b.skip_rust_format and "DISABLED" or "ENABLED"
   print("Rust-Format is now " .. state .. " for this buffer.")
end, { desc = "Toggle rust-format for the current buffer" })
