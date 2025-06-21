return {
	"ThePrimeagen/harpoon",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set(
			"n",
			"<leader>ha",
			"<cmd>lua require('harpoon.mark').add_file()<cr>",
			{ desc = "Mark file with harpoon" }
		)
		keymap.set(
			"n",
			"<leader>hn",
			"<cmd>lua require('harpoon.ui').nav_next()<cr>",
			{ desc = "Go to next harpoon mark" }
		)

		keymap.set(
			"n",
			"<leader>hp",
			"<cmd>lua require('harpoon.ui').nav_prev()<cr>",
			{ desc = "Go to previous harpoon mark" }
		)

		keymap.set("n", "<leader>hh", '<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>', {
			desc = "Toggle Harpoon Menu",
		})

		keymap.set("n", "<leader>h1", '<cmd>lua require("harpoon.ui").nav_file(1)<CR>', {
			desc = "Go to harpoon file number 1",
		})
		keymap.set("n", "<leader>h2", '<cmd>lua require("harpoon.ui").nav_file(2)<CR>', {
			desc = "Go to harpoon file number 2",
		})
	end,
}
