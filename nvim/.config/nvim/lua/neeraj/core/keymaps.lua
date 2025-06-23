-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------

-- use jk to exit insert mode
-- keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- don't replace the paste register after pasting
keymap.set("v", "<leader>p", '"_dP', { desc = "Paste without replacing register" })

-- delete single character without copying into register
-- keymap.set("n", "x", '"_x')

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

-- keymap.set("n", "<leader>a", function()
-- 	-- in order to bypass the asynchronous scrolling animation due to snacks nvim plugin
-- 	local bufnr = vim.api.nvim_get_current_buf()
-- 	local last_line = vim.api.nvim_buf_line_count(bufnr)
--
-- 	-- Move to top and start visual selection
-- 	vim.api.nvim_win_set_cursor(0, { 1, 0 })
-- 	vim.cmd("normal! V")
--
-- 	-- Move to last line (visually selecting everything)
-- 	vim.api.nvim_win_set_cursor(0, { last_line, 0 })
-- end, { desc = "Select entire buffer without triggering smooth scroll" })

-- exit all :qa
keymap.set("n", "<leader>ka", "<cmd>:qa<CR>", { desc = "Quit all" })

-- custom keybindings
keymap.set("n", "<leader>w", "<Esc>:w<CR>")
keymap.set("n", "<leader>q", "<Esc>:q<CR>")
keymap.set("n", "<leader>n", "<Esc>:bn<CR>")
keymap.set("n", "<leader>m", "<Esc>:bp<CR>")
keymap.set("n", "<leader>d", "<Esc>:bd<CR>")

-- formatters/linters
-- for c/cpp
keymap.set("n", "<leader>bfc", "<Esc>:! clang-format -i % <CR>")
-- for python
keymap.set("n", "<leader>bfp", "<Esc>:! black % <CR>")

-- compiling
-- make it specific for C++
keymap.set("n", "<leader>bcp", "<Esc>:! g++ %; ./a.out <CR>", { desc = "compile the current file (c++) and execute " })
-- keymap.set(
--   "n",
--   "<leader>bsml",
--   "<Esc>:! sml % > output.txt<CR>",
--   { desc = "Interpret current sml code and write it to output.txt" }
-- )
keymap.set(
	"n",
	"<leader>bml",
	"<Esc>:! ocamlc %; ./a.out > output.txt<CR>",
	{ desc = "compile and execute current ocaml code and write it to output.txt" }
)

-- for python code interpreting
-- make it specific for python
keymap.set("n", "<leader>bp", "<Esc>:! python3 %; <CR>", { desc = "Interpret current python code" })

-- set keymaps for toggle term
-- keymap.set("n", "<C-;>", "<cmd>ToggleTerm size=40 direction=float name=desktop<CR>", { desc = "Toggle term" })

-- set keymap to delete current file from buffer without closing windows
keymap.set(
	"n",
	"<leader>fd",
	"<cmd>bp<bar>sp<bar>bn<bar>bd<CR>",
	{ desc = "Remove current file from buffer without closing window " }
)

keymap.set("i", "<C-j>", "<Esc>o", {
	desc = "Jump to next line",
})

keymap.set("i", "<C-k>", "<Esc>O", {
	desc = "Jump to previous line",
})

-- Oil.nvim
-- keymap.set("n", "<leader>pd", "<Esc>:Oil<CR>", {
--   desc = "Open parent directory",
-- })

-- markdown-preview.nvim
-- keymap.set("n", "<leader>pmt", "<Esc>:MarkdownPreviewToggle<CR>", {
--   desc = "Toggle Markdown Preview",
-- })

-- The below functions can be achieved by using Shift+M or zz
-- keymap.set("n", "<leader>jj", function()
-- 	local current_line = vim.fn.line(".")
-- 	local win_height = vim.api.nvim_win_get_height(0)
-- 	local offset = math.floor(win_height * 0.75)
-- 	local target_line = current_line + offset
-- 	local last_line = vim.fn.line("$")
--
-- 	-- Clamp target_line to the last line of the file
-- 	if target_line > last_line then
-- 		local diff = last_line - current_line
-- 		offset = math.floor(diff * 0.75)
-- 		target_line = current_line + offset
--
-- 		if target_line > last_line then
-- 			target_line = last_line
-- 		end
-- 	end
--
-- 	-- Move to the target line and align it to the top of the screen
-- 	vim.cmd("normal! " .. target_line .. "Gzt")
-- end, { desc = "Move cursor 3/4 screen down and align to top" })
--
-- keymap.set("n", "<leader>kk", function()
-- 	local current_line = vim.fn.line(".")
-- 	local win_height = vim.api.nvim_win_get_height(0)
-- 	local offset = math.floor(win_height * 0.75)
-- 	local target_line = current_line - offset
--
-- 	-- Clamp target_line to the first line of the file
-- 	if target_line < 1 then
-- 		local diff = current_line - 1
-- 		offset = math.floor(diff * 0.75)
-- 		target_line = current_line - offset
--
-- 		if target_line < 1 then
-- 			target_line = 1
-- 		end
-- 	end
--
-- 	-- Move to the target line and align it to the top
-- 	vim.cmd("normal! " .. target_line .. "Gzt")
-- end, { desc = "Move cursor 3/4 screen up and align to top" })
