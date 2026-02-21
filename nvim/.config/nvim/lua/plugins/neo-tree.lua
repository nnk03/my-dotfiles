
return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself
    config = function()
		-- disable netrw
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		require("neo-tree").setup({
			close_if_last_window = true,
			popup_border_style = "rounded",

			filesystem = {
				filtered_items = {
					hide_dotfiles = false,
					hide_gitignored = false,
					hide_by_name = {
						".DS_Store",
					},
				},
				follow_current_file = {
					enabled = true,
				},
			},

			window = {
				width = 35,
				mappings = {
					["<space>"] = "none",
				},
			},

			default_component_configs = {
				indent = {
					with_markers = true,
					indent_marker = "│",
					last_indent_marker = "└",
				},
				icon = {
					folder_closed = "",
					folder_open = "",
					folder_empty = "",
				},
				git_status = {
					symbols = {
						added     = "✚",
						modified  = "",
						deleted   = "✖",
						renamed   = "󰁕",
						untracked = "",
						ignored   = "",
						unstaged  = "󰄱",
						staged    = "",
						conflict  = "",
					},
				},
			},
		})

		-- keymaps (equivalent to yours)
		local keymap = vim.keymap

		keymap.set("n", "<leader>ee", "<cmd>Neotree toggle<CR>", { desc = "Toggle file explorer" })
		keymap.set("n", "<leader>ef", "<cmd>Neotree reveal toggle<CR>", { desc = "Toggle explorer on current file" })
		keymap.set("n", "<leader>ec", "<cmd>Neotree close<CR>", { desc = "Collapse file explorer" })
		keymap.set("n", "<leader>er", "<cmd>Neotree refresh<CR>", { desc = "Refresh file explorer" })
	end,
}
