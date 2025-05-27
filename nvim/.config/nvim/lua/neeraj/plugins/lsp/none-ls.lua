-- previously it was null-ls, then it was deprecated by the owner
-- now none-ls is a community maintained fork of null-ls
-- the variables still use it as null-ls
return {
	"nvimtools/none-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		-- import null-ls plugin
		local null_ls = require("null-ls")

		local null_ls_utils = require("null-ls.utils")

		-- for conciseness
		local formatting = null_ls.builtins.formatting -- to setup formatters
		local diagnostics = null_ls.builtins.diagnostics -- to setup linters
		local completions = null_ls.builtins.completion -- to setup completions ?

		-- to setup format on save
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		-- configure null_ls
		null_ls.setup({
			-- add package.json as identifier for root (for typescript monorepos)
			root_dir = null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git", "package.json"),

			-- setup formatters & linters
			sources = {
				--  to disable file types use
				--  "formatting.prettier.with({disabled_filetypes: {}})" (see null-ls docs)

				-- make sure to install all necessary formatters and others after including the below things
				--
				formatting.prettier.with({
					extra_filetypes = { "svelte" },
				}), -- js/ts formatter

				-- lua formatter
				formatting.stylua,

				-- python formatter
				formatting.black,
				formatting.isort,

				require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim plugin

				-- diagnostics.eslint_d.with({ -- js/ts linter
				--   condition = function(utils)
				--     return utils.root_has_file({ ".eslintrc.js", ".eslintrc.cjs" }) -- only enable if root has .eslintrc.js or .eslintrc.cjs
				--   end,
				-- }),

				completions.spell,
			},

			-- do not install rustfmt using Mason, it was showing as deprecated
			-- install using rustup/Cargo
			--
			-- autoformat on save was not working for rust
			--
			-- Hence had to add autocmd in the main init.lua
			-- to apply rustfmt when saving rust file
			vim.api.nvim_create_autocmd("BufWritePost", {
				pattern = { "*.rs" },
				command = "silent ! rustfmt %",
			}),

			-- configure format on save
			on_attach = function(current_client, bufnr)
				-- '.' is the old style will be deprecated
				-- if current_client.supports_method("textDocument/formatting") then
				if current_client:supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({
								filter = function(client)
									--  only use null-ls for formatting instead of lsp server
									return client.name == "null-ls"
									-- return client.name == "lua_ls"
								end,
								bufnr = bufnr,
							})
						end,
					})
				end
			end,
		})

		vim.keymap.set("n", "<leader>fo", vim.lsp.buf.format, { desc = "Format the current file" })
	end,
}
