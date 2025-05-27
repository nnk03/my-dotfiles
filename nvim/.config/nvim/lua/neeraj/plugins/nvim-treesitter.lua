-- treesitter
return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		dependencies = {
			"windwp/nvim-ts-autotag",
			-- newly added
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		config = function()
			-- import nvim-treesitter plugin
			local treesitter = require("nvim-treesitter.configs")

			-- configure treesitter
			treesitter.setup({ -- enable syntax highlighting
				highlight = {
					enable = true,
					-- disable = { "latex" },
				},
				-- enable indentation
				indent = { enable = true },
				-- enable autotagging (w/ nvim-ts-autotag plugin)
				autotag = { enable = true },
				-- ensure these language parsers are installed
				ensure_installed = {
					"json",
					"javascript",
					"typescript",
					"tsx",
					"yaml",
					"html",
					"css",
					"prisma",
					"markdown",
					"markdown_inline",
					"svelte",
					"graphql",
					"bash",
					"lua",
					"vim",
					"dockerfile",
					"gitignore",
				},
				-- enable nvim-ts-context-commentstring plugin for commenting tsx and jsx
				-- context_commentstring = {
				--   enable = true,
				--   enable_autocmd = false,
				-- },
				require("ts_context_commentstring").setup({}),
				vim.g.skip_ts_contex,
				t_commentstring_module = true,
				-- auto install above language parsers
				auto_install = true,
			})

			-- print("FOLDING CONFIGURE")
			-- configure folding
			-- vim.opt.foldmethod = "expr"
			-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
			-- vim.opt.foldenable = true
			-- vim.opt.foldlevel = 99
			-- vim.opt.foldlevelstart = 99
		end,
	},
}
