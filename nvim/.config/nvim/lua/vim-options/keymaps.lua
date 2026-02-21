-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- don't replace the paste register after pasting
keymap.set("v", "<leader>p", '"_dP', { desc = "Paste without replacing register" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- Add semicolon at the end
-- keymap.set("n", "<leader>;", "<Esc>A;<Esc>", { desc = "Add semicolon at the end of the current line" })
keymap.set("n", "<leader>;", function()
	local line = vim.api.nvim_get_current_line()
	if not line:match(";%s*$") then
		vim.api.nvim_set_current_line(line .. ";")
	end
end, { desc = "Add semicolon at end of line (if not present)" })

-- Add comma at the end
keymap.set("n", "<leader>,", function()
	local line = vim.api.nvim_get_current_line()
	if not line:match(",%s*$") then
		vim.api.nvim_set_current_line(line .. ",")
	end
end, { desc = "Add comma at end of line (if not present)" })

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- select all
keymap.set("n", "<leader>a", "<Esc>ggVG", { desc = "Select all in Visual Block" }) -- select all IN VISUAL BLOCK

-- exit all :qa
keymap.set("n", "<leader>ka", "<cmd>:qa<CR>", { desc = "Quit all" })

-- custom keybindings
keymap.set("n", "<leader>w", "<Esc>:w<CR>")
keymap.set("n", "<leader>q", "<Esc>:q<CR>")
keymap.set("n", "<leader>n", "<Esc>:bn<CR>")
keymap.set("n", "<leader>m", "<Esc>:bp<CR>")
keymap.set("n", "<leader>rf", "<Esc>:bufdo e!<CR>")

-- formatters/linters
-- for c/cpp
keymap.set("n", "<leader>bfc", "<Esc>:! clang-format -i % <CR>")
-- for python
keymap.set("n", "<leader>bfp", "<Esc>:! black % <CR>")
-- keymap.set("n", "<leader>bfp", "<Esc>:! ruff % <CR>")

-- compiling
-- make it specific for C++
keymap.set("n", "<leader>bcp", "<Esc>:! g++ %; ./a.out <CR>", { desc = "compile the current file (c++) and execute " })

-- for python code interpreting
-- make it specific for python
keymap.set("n", "<leader>bp", "<Esc>:! python3 %; <CR>", { desc = "Interpret current python code" })

-- set keymap to delete current file from buffer without closing windows
keymap.set(
	"n",
	"<leader>fd",
	"<cmd>bp<bar>sp<bar>bn<bar>bd<CR>",
	{ desc = "Remove current file from buffer without closing window " }
)
