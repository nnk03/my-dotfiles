return {
	"rachartier/tiny-inline-diagnostic.nvim",
	event = "VeryLazy", -- Or `LspAttach`
	priority = 1000, -- needs to be loaded in first
	config = function()
		require("tiny-inline-diagnostic").setup()
		vim.diagnostic.config({ virtual_text = false }) -- Only if needed in your configuration, if you already have native LSP diagnostics
		vim.keymap.set("n", "<leader>cd", function()
			local diags = vim.diagnostic.get(0, { lnum = vim.fn.line(".") - 1 })
			local messages = {}
			for _, d in ipairs(diags) do
				table.insert(messages, d.message)
			end
			local result = table.concat(messages, "\n")
			vim.fn.setreg("+", result)
			print("Copied diagnostics to clipboard!")
		end, { desc = "Copy diagnostics on current line" })

		-- :lua print(vim.inspect(vim.diagnostic.get(0, {lnum = vim.fn.line('.') - 1})))
		-- :lua for _, d in ipairs(vim.diagnostic.get(0, {lnum = vim.fn.line('.') - 1})) do print(d.message) end
	end,
}
