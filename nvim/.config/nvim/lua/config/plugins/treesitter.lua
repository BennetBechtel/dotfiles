return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			highlight = {
				enable = true,
			},

			indent = {
				enable = true,
			},

			ensure_installed = {
				"json",
				"javascript",
				"typescript",
				"svelte",
				"tsx",
				"yaml",
				"html",
				"css",
				"python",
				"markdown",
				"markdown_inline",
				"bash",
				"lua",
				"vim",
				"dockerfile",
				"gitignore",
				"query",
				"vimdoc",
				"c",
				"java",
			},

			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},

			additional_vim_regex_highlighting = false,
		},
	},

	-- Auto close & rename HTML/JSX tags
	{
		"windwp/nvim-ts-autotag",
		ft = {
			"html",
			"xml",
			"javascript",
			"typescript",
			"javascriptreact",
			"typescriptreact",
			"svelte",
		},
		opts = {
			enable_close = true,
			enable_rename = true,
			enable_close_on_slash = false,
		},
	},
}
