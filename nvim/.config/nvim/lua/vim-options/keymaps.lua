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

-- Add double backslash at end of line (LaTeX)
vim.keymap.set("n", "<leader>\\", function()
    local line = vim.api.nvim_get_current_line()
    if not line:match("\\\\%s*$") then
        vim.api.nvim_set_current_line(line .. " \\\\")
    end
end, { desc = "Add double backslash at end of line (LaTeX)" })

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

-- -- haskell specific keymaps
-- local function open_ghci_split()
-- 	-- -- 1. Save the current file
-- 	-- vim.cmd("silent write")
--
-- 	-- 2. Get the current file path
-- 	local file = vim.fn.expand("%:p")
--
-- 	-- 3. Define the tmux commands
-- 	-- '-h 15' sets the height to 15 lines
-- 	-- 'ghci %s' runs ghci with the current file
-- 	local tmux_cmd = string.format("tmux split-window -v -l 15 'ghci %s'", file)
--
-- 	-- 4. Execute in system shell
-- 	os.execute(tmux_cmd)
-- end

-- vim.keymap.set("n", "<leader>gh", open_ghci_split, { desc = "Run GHCI in tmux split" })
--
-- local function send_to_ghci()
-- 	-- 1. Save the file
-- 	vim.cmd("silent write")
--
-- 	local file_path = vim.fn.expand("%:p")
--
-- 	-- 2. Try to send ':r' to the bottom pane.
-- 	-- If no bottom pane exists, tmux returns a non-zero exit code.
-- 	local reload_cmd = "tmux send-keys -t {bottom} ':r' C-m"
-- 	local success = os.execute(reload_cmd)
--
-- 	-- 3. If the reload failed (success is nil or not 0), the pane doesn't exist
-- 	if not success then
-- 		-- Create the split:
-- 		-- -v: vertical, -l 15: lines, -d: don't move cursor
-- 		local create_cmd = string.format("tmux split-window -v -l 15 -d 'ghci %s'", file_path)
-- 		vim.fn.system(create_cmd)
-- 		print("GHCI started")
-- 	else
-- 		print("GHCI reloaded")
-- 	end
-- end
--
-- vim.keymap.set("n", "<leader>gr", send_to_ghci, { desc = "Reload GHCI in tmux" })
