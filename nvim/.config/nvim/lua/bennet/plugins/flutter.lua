return {
	"nvim-flutter/flutter-tools.nvim",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim", -- optional for vim.ui.select
	},
	config = function()
		require("flutter-tools").setup({
			-- Your existing configuration
		})

		-- Define keybindings
		local opts = { noremap = true, silent = true }
		local keymap = vim.api.nvim_set_keymap
		keymap("n", "<leader>FR", ":FlutterRun<CR>", opts)
		keymap("n", "<leader>FD", ":FlutterDebug<CR>", opts)
		keymap("n", "<leader>FV", ":FlutterDevices<CR>", opts)
		keymap("n", "<leader>FE", ":FlutterEmulators<CR>", opts)
		keymap("n", "<leader>FH", ":FlutterReload<CR>", opts)
		keymap("n", "<leader>FS", ":FlutterRestart<CR>", opts)
		keymap("n", "<leader>FQ", ":FlutterQuit<CR>", opts)
		keymap("n", "<leader>FA", ":FlutterAttach<CR>", opts)
		keymap("n", "<leader>FT", ":FlutterDetach<CR>", opts)
		keymap("n", "<leader>FO", ":FlutterOutlineToggle<CR>", opts)
		keymap("n", "<leader>FP", ":FlutterOutlineOpen<CR>", opts)
		keymap("n", "<leader>FL", ":FlutterDevTools<CR>", opts)
		keymap("n", "<leader>FI", ":FlutterDevToolsActivate<CR>", opts)
		keymap("n", "<leader>FC", ":FlutterCopyProfilerUrl<CR>", opts)
		keymap("n", "<leader>FI", ":FlutterLspRestart<CR>", opts)
		keymap("n", "<leader>FU", ":FlutterSuper<CR>", opts)
		keymap("n", "<leader>FY", ":FlutterReanalyze<CR>", opts)
		keymap("n", "<leader>FN", ":FlutterRename<CR>", opts)
		keymap("n", "<leader>FX", ":FlutterLogClear<CR>", opts)
		keymap("n", "<leader>FO", ":FlutterLogToggle<CR>", opts)
	end,
}
