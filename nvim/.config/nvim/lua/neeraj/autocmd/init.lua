-- for javascript files alone, setting some properties
-- vim.cmd([[
--   autocmd FileType javascript setlocal shiftwidth=2
--   autocmd FileType javascript setlocal softtabstop=2
--   autocmd FileType javascript setlocal tabstop=2
--   autocmd FileType javascript setlocal noexpandtab
-- ]])
vim.api.nvim_create_autocmd("FileType", {
	pattern = "javascript",
	callback = function()
		vim.opt_local.shiftwidth = 2
		vim.opt_local.softtabstop = 2
		vim.opt_local.tabstop = 2
		vim.opt_local.expandtab = true -- Use spaces instead of tabs
	end,
})

-- for shell scripts, do not expand tab
-- vim.cmd([[
--   autocmd FileType sh setlocal noexpandtab
-- ]])
vim.api.nvim_create_autocmd("FileType", {
	pattern = "sh",
	callback = function()
		vim.opt_local.expandtab = false
	end,
})

-- Automatically build and compile LaTeX files on save
-- vim.cmd([[
--   augroup LaTeXAutoCompile
--     autocmd!
--     autocmd BufWritePost *.tex :silent !pdflatex %:t
--   augroup END
-- ]])

-- to apply shfmt for shell script files
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = { "*.sh" },
	command = "silent ! shfmt -w %",
})

-- to apply clang-format when saving cpp files and arduino files
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = { "*.cpp", "*.c", "*.h", "*.ino" },
	command = "silent ! clang-format -i %",
})

-- black formatting is already done by none-ls
-- -- to apply black formatting when saving python files
-- vim.api.nvim_create_autocmd("BufWritePost", {
-- 	pattern = { "*.py" },
-- 	command = "silent ! black %",
-- })

-- to enable the plugin automatically when opening markdown files
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		require("render-markdown").enable()
	end,
})

-- vim.g.mkdp_echo_preview_url = 1

-- for folding
-- vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
-- 	callback = function()
-- 		vim.opt.foldmethod = "expr"
-- 		vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- 		vim.opt.foldenable = true
-- 		vim.opt.foldlevel = 99
-- 		vim.opt.foldlevelstart = 99
-- 	end,
-- })
