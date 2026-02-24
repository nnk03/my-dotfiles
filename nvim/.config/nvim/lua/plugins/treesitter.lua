return {
	"nvim-treesitter/nvim-treesitter",
   branch = 'master',
	lazy = false,
	build = ":TSUpdate",
	config = function()
		-- import nvim-treesitter plugin
      -- install tree-sitter-cli via npm or cargo ?
		local treesitter = require("nvim-treesitter.configs")
		require("ts_context_commentstring").setup({})
		vim.g.skip_ts_context_commentstring_module = true

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
				"go",
				"cpp",
			},
			-- enable nvim-ts-context-commentstring plugin for commenting tsx and jsx
			-- context_commentstring = {
			--   enable = true,
			--   enable_autocmd = false,
			-- },
			-- auto install above language parsers
			auto_install = true,
		})
	end,
}
