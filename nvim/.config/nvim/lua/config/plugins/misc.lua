return {
	"nvim-lua/plenary.nvim", --lua functions that many plugins use
	"christoomey/vim-tmux-navigator", -- tmux & split window nav

	-- here only for wrapping html tags
	-- emmet_ls is already installed in mason
	"olrtg/nvim-emmet",
	config = function()
		vim.keymap.set({ "n", "v" }, "<leader>xe", require("nvim-emmet").wrap_with_abbreviation)
	end,

	-- vim-maximizer
	"szw/vim-maximizer",
	keys = {
		{ "<leader>sm", "<cmd>MaximizerToggle<CR>", desc = "Maximize/minimize a split" },
	},

	-- undotree
	"mbbill/undotree",
	config = function()
		vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
	end,
}
