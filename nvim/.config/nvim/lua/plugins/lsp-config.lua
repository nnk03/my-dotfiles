return {
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason-lspconfig").setup({
				-- after adding something here, make sure to go to nvim-lspconfig and add the necessary options
				ensure_installed = {
					-- if the below list is changed, also check the relevant parts under 'nvim-lspconfig' plugin
					"lua_ls",
					"rust_analyzer",
					"clangd",
					"ts_ls",
				},
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- local lspconfig = require( 'lspconfig' ) -- deprecated
			-- lspconfig.lua_ls.setup({})
			local lspconfig = vim.lsp.config
			local lspconfig_enable = vim.lsp.enable
			local cmp_nvim_lsp = require("cmp_nvim_lsp")
			local capabilities = cmp_nvim_lsp.default_capabilities()

			-- Optional: set highlight groups if you want custom colors
			vim.api.nvim_set_hl(0, "DiagnosticSignError", { fg = "#FF0000" }) -- Customize color as needed
			vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { fg = "#FFA500" })
			vim.api.nvim_set_hl(0, "DiagnosticSignHint", { fg = "#00BFFF" })
			vim.api.nvim_set_hl(0, "DiagnosticSignInfo", { fg = "#00FF00" })

			local keymap = vim.keymap -- for conciseness
			local opts = { noremap = true, silent = true }
			local on_attach = function(client, bufnr)
				opts.buffer = bufnr

				-- set keybinds
				opts.desc = "Show LSP references"
				keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

				opts.desc = "Go to declaration"
				keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

				opts.desc = "Show LSP definitions"
				keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

				opts.desc = "Show LSP implementations"
				keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

				opts.desc = "Show LSP type definitions"
				keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

				opts.desc = "See available code actions"
				keymap.set({ "n", "v" }, "<leader>vca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

				opts.desc = "See References ?"
				keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts) -- see references ??

				opts.desc = "Signature Help ?"
				keymap.set("i", "<C-h>", vim.lsp.buf.references, opts) -- see references ??

				opts.desc = "Smart rename"
				keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts) -- smart rename

				opts.desc = "Show buffer diagnostics"
				keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

				opts.desc = "Show line diagnostics"
				keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

				opts.desc = "Go to previous diagnostic"
				keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

				opts.desc = "Go to next diagnostic"
				keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

				opts.desc = "Show documentation for what is under cursor"
				keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

				opts.desc = "Restart LSP"
				keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
			end

			-- for lua
			lspconfig("lua_ls", {
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					on_attach(client, bufnr)
					client.server_capabilities.semanticTokensProvider = nil
				end,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})
			lspconfig_enable("lua_ls")

			-- for rust
			lspconfig("rust_analyzer", {
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					on_attach(client, bufnr)
					client.server_capabilities.semanticTokensProvider = nil
				end,
				settings = {
					["rust-analyzer"] = {
						cargo = {
							allFeatures = true,
						},
						checkOnSave = {
							command = "clippy",
						},
					},
				},
			})
			lspconfig_enable("rust_analyzer")

			-- for c/c++
			lspconfig("clangd", {
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					on_attach(client, bufnr)
					client.server_capabilities.semanticTokensProvider = nil
				end,
			})
			lspconfig_enable("clangd")

			-- for python
			lspconfig("pyright", {
				capabilities = capabilities,
				on_attach = on_attach,
			})
			lspconfig_enable("pyright")
		end,
	},
}
