return {
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("gitsigns").setup()

			local keymap = vim.keymap

			keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "GitSign Preview Hunk" })
			keymap.set(
				"n",
				"<leader>gt",
				":Gitsigns toggle_current_line_blame<CR>",
				{ desc = "Toggle Current Line Blame" }
			)
		end,
	},
	{
		"tpope/vim-fugitive",
		config = function()
			-- require("vim-fugitive").setup()

			local keymap = vim.keymap

			keymap.set("n", "<leader>gs", ":Git <CR>", { desc = "Show Git Status" })
			keymap.set("n", "<leader>gc", ":Git commit<CR>", { desc = "Show Git Status" })
		end,
	},
}
