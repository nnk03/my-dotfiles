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

-- to apply clang-format when saving cpp files and arduino files
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = { "*.cpp", "*.c", "*.h", "*.ino" },
	command = "silent ! clang-format -i %",
})

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
