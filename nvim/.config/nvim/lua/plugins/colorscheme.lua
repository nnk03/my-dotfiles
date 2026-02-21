return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		-- require('name-of-plugin').setup() automatically called by lazy
		require( "catppuccin" ).setup(
			{
				transparent_background = true,
			}
		)
		vim.cmd.colorscheme "catppuccin"
	end
}
