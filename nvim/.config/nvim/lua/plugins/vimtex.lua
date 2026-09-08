return {
   "lervag/vimtex",
   lazy = false,
   -- tag = "v2.17",
   init = function()
      -- vim.g.vimtex_indent_ignored_envs = { 'document' }

      -- disable opening of quickfix every time, file is compiled
      -- we can still open the quickfix window using <localleader>le
      vim.g.vimtex_quickfix_open_on_warning = 0

      -- Disable VimTeX's version check to bypass the v0.11 false positive
      vim.g.vimtex_version_check = 0

      -- PDF viewer setup for Wayland / Niri
      -- vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_view_method = "zathura_simple"
   end,
}


-- return {
-- 	"lervag/vimtex",
-- 	lazy = false, -- Priority given to your un-lazy loading preference
-- 	init = function()
-- 		---------------------------------------------------------------------------
-- 		-- Your Original Preferences (Highest Priority)
-- 		---------------------------------------------------------------------------
-- 		-- Disable VimTeX's version check to bypass false positives
-- 		vim.g.vimtex_version_check = 0
--
-- 		-- PDF viewer setup for Wayland / Niri
-- 		vim.g.vimtex_view_method = "zathura_simple"
--
-- 		-- Disable opening QuickFix window automatically on warnings
-- 		-- (Access manually anytime via <localleader>le)
-- 		vim.g.vimtex_quickfix_open_on_warning = 0
--
-- 		-- vim.g.vimtex_indent_ignored_envs = { 'document' }
--
-- 		---------------------------------------------------------------------------
-- 		-- Added Recommended Settings
-- 		---------------------------------------------------------------------------
-- 		-- -- Native VimTeX syntax engine
-- 		-- vim.g.vimtex_syntax_enabled = 1
-- 		--
-- 		-- -- Compiler settings (latexmk continuous build)
-- 		-- vim.g.vimtex_compiler_method = "latexmk"
-- 		-- vim.g.vimtex_compiler_latexmk = {
-- 		-- 	aux_dir = "",
-- 		-- 	out_dir = "",
-- 		-- 	callback = 1,
-- 		-- 	continuous = 1,
-- 		-- 	executable = "latexmk",
-- 		-- 	hooks = {},
-- 		-- 	options = {
-- 		-- 		"-verbose",
-- 		-- 		"-file-line-error",
-- 		-- 		"-synctex=1",
-- 		-- 		"-interaction=nonstopmode",
-- 		-- 	},
-- 		-- }
-- 		--
-- 		-- -- Ignore common spammy warnings in the QuickFix buffer
-- 		-- vim.g.vimtex_quickfix_ignore_filters = {
-- 		-- 	"Underfull",
-- 		-- 	"Overfull",
-- 		-- 	"Specifying @yield is deprecated",
-- 		-- }
-- 		--
-- 		-- -- Automatically clean auxiliary build files (.aux, .log, etc.)
-- 		-- vim.g.vimtex_clean_enabled = 1
-- 	end,
-- }
