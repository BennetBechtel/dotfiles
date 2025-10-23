return {
	"lervag/vimtex",
	lazy = false, -- do not lazy-load VimTeX
	-- tag = "v2.15", -- uncomment to pin to a specific version
	init = function()
		-- Enable syntax highlighting and filetype plugins
		vim.cmd([[
      filetype plugin indent on
      syntax enable
    ]])

		-- Set local leader key (set in global config)
		-- vim.g.maplocalleader = ","

		-- Core VimTeX configuration
		vim.g.vimtex_view_method = "zathura" -- PDF viewer
		vim.g.vimtex_compiler_method = "latexmk" -- Compiler backend

		-- Optional but useful settings
		vim.g.vimtex_quickfix_mode = 0 -- don't open quickfix automatically
		vim.g.vimtex_complete_enabled = 1 -- enable completion
		vim.g.vimtex_indent_enabled = 1 -- enable smart indentation
		vim.g.vimtex_syntax_enabled = 1 -- syntax highlighting
		vim.g.vimtex_format_enabled = 1 -- enable auto-formatting
		vim.g.vimtex_view_forward_search_on_start = 0 -- disable auto forward search on start
	end,
}
