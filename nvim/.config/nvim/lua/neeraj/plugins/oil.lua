return {
	"stevearc/oil.nvim",
	-- Optional dependencies
	-- dependencies = { { "echasnovski/mini.icons", opts = {} } },
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
	opts = {},
	config = function()
		require("oil").setup({
			columns = { "icon" },
			-- default_file_explorer = true,
			keymaps = {
				["<C-h>"] = false,
				["<M-h>"] = "actions.select_split",
			},
			view_options = {
				show_hidden = true,
			},
		})
		-- vim.keymap.set("n", "<leader>oi", function()
		-- 	vim.cmd("vertical Oil")
		-- 	vim.cmd("wincmd H") -- move to far left
		-- end, { desc = "Open Oil in left split" })

		-- vim.keymap.set("n", "<leader>oop", "<CMD>Oil<CR>", { desc = "Open parent directory" })

		vim.keymap.set("n", "<leader>of", require("oil").toggle_float, { desc = "Toggle Oil Float" })
	end,
}
