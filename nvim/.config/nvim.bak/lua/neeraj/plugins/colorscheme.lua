-- colorscheme catppuccin

return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		-- catppuccin
		require("catppuccin").setup({
			transparent_background = true, -- ← enable transparency
		})
		vim.cmd([[ colorscheme catppuccin ]])
	end,
}

-- colorscheme nightfly

-- return {
-- 	{
-- 		"bluz71/vim-nightfly-guicolors",
-- 		priority = 1000, -- make sure to load this before all the other start plugins
-- 		config = function()
-- 			-- load the colorscheme here
-- 			vim.cmd([[colorscheme nightfly]])
-- 		end,
-- 	},
-- }
