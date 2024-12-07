return {
	{
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		priority = 1000,

		config = function()
			require("catppuccin").setup({
				transparent_background = true,
				no_blank_line_at_eof = true,
			})
			vim.cmd.colorscheme("catppuccin-mocha")
		end,
	},
}
