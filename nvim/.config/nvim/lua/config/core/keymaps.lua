vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opts = { noremap = true, silent = true }

-- Save
--vim.keymap.set({ "n", "i" }, "<leader>ww", "<cmd>w<CR>", { desc = "Save file" })
--vim.keymap.set("n", "<leader>wa", "<cmd>wa<CR>", { desc = "Save all buffers" })
--vim.keymap.set("n", "<leader>wn", "<cmd>noautocmd w<CR>", { desc = "Save without formatting" })

-- Quit
--vim.keymap.set({ "n", "i" }, "<leader>qq", "<cmd>q<CR>", { desc = "Quit file" })
--vim.keymap.set("n", "<leader>qa", "<cmd>qa<CR>", { desc = "Quit all" })
--vim.keymap.set("n", "<leader>q!", "<cmd>q!<CR>", { desc = "Force quit" })
--vim.keymap.set("n", "<leader>wq", "<cmd>wq<CR>", { desc = "Save and quit" })
--vim.keymap.set("n", "<leader>wrq", "<cmd>wqa<CR>", { desc = "Save all and quit" })

-- Motion
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "moves lines down in visual selection" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "moves lines up in visual selection" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "move down in buffer with cursor centered" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "move up in buffer with cursor centered" })

vim.keymap.set("n", "J", "mzJ`z")

-- Search
vim.keymap.set("n", "n", "nzzzv") -- jump to next search result
vim.keymap.set("n", "N", "Nzzzv") -- jump to previous search result

-- Intentation
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- The how it be paste
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Remember yanked
vim.keymap.set("v", "p", '"_dp', opts)

-- Leader d delete wont remember as yanked/clipboard when delete pasting
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Unmaps Q in normal mode
vim.keymap.set("n", "Q", "<nop>")

-- Stars new tmux session from in here
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Prevent x delete from registering when next paste
vim.keymap.set("n", "x", '"_x', opts)

-- Replace the word cursor is on globally
vim.keymap.set(
	"n",
	"<leader>s",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Replace word cursor is on globally" }
)

-- Executes shell command from in here making file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "makes file executable" })

-- Hightlight yanking
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Toggle Line Wrap
vim.keymap.set("n", "<leader>tw", function()
	vim.wo.wrap = not vim.wo.wrap
	print("Word wrap: " .. (vim.wo.wrap and "ON" or "OFF"))
end, { desc = "Toggle line wrap" })

-- Tab management
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current tab in new tab" })

-- Split management
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Copy filepath to the clipboard
vim.keymap.set("n", "<leader>fp", function()
	local filePath = vim.fn.expand("%:~") -- Gets the file path relative to the home directory
	vim.fn.setreg("+", filePath) -- Copy the file path to the clipboard register
	print("File path copied to clipboard: " .. filePath) -- Optional: print message to confirm
end, { desc = "Copy file path to clipboard" })

-- Toggle LSP diagnostics visibility
local isLspDiagnosticsVisible = true
vim.keymap.set("n", "<leader>lx", function()
	isLspDiagnosticsVisible = not isLspDiagnosticsVisible
	vim.diagnostic.config({
		virtual_text = isLspDiagnosticsVisible,
		underline = isLspDiagnosticsVisible,
	})
	print("LSP Diagnostics: " .. (isLspDiagnosticsVisible and "ON" or "OFF"))
end, { desc = "Toggle LSP diagnostics" })
