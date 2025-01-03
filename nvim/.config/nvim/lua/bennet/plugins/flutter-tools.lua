return {
	"akinsho/flutter-tools.nvim",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		local telescope = require("telescope")

		require("flutter-tools").setup({
			ui = {
				-- the border type to use for all floating windows, the same options/formats
				-- used for ":h nvim_open_win" e.g. "single" | "shadow" | {<table-of-eight-chars>}
				border = "rounded",
				-- This determines whether notifications are show with `vim.notify` or with the plugin's custom UI
				notification_style = "plugin",
			},
			decorations = {
				statusline = {
					-- set to false to disable the statusline decoration in the outline window
					app_version = true,
					device = true,
				},
			},
			widget_guides = {
				enabled = true,
				debug = false,
			},
			closing_tags = {
				highlight = "Comment",
				prefix = "// ",
				enabled = true,
			},
			lsp = {
				color = {
					enabled = true,
					background = true,
					virtual_text = true,
				},
				settings = {
					showTodos = true,
					completeFunctionCalls = true,
					enableSnippets = true,
					updateImportsOnRename = true,
				},
				-- capabilities = my_custom_capabilities -- e.g. lsp_status capabilities
				-- capabilities = require("cmp_nvim_lsp").default_capabilities(),
			},
			debugger = {
				enabled = true,
				run_via_dap = true,
				exception_breakpoints = {},
				register_configurations = function(_)
					require("dap").configurations.dart = {}
				end,
			},
			-- dev_log = {
			--     enabled = true,
			--     open_cmd = "tabedit", -- command to use to open the log buffer
			-- },
		})

		-- Keymaps
		local keymap = vim.keymap.set
		local opts = { noremap = true, silent = true }

		-- Flutter commands
		keymap("n", "<leader>Fc", ":FlutterRun<CR>", { desc = "Flutter Run" })
		keymap("n", "<leader>Fr", ":FlutterRestart<CR>", { desc = "Flutter Restart" })
		keymap("n", "<leader>Fq", ":FlutterQuit<CR>", { desc = "Flutter Quit" })
		keymap("n", "<leader>Fd", ":FlutterDevices<CR>", { desc = "Flutter Devices" })
		keymap("n", "<leader>Fe", ":FlutterEmulators<CR>", { desc = "Flutter Emulators" })

		-- Development commands
		keymap("n", "<leader>Fp", ":FlutterPubGet<CR>", { desc = "Flutter Pub Get" })
		keymap("n", "<leader>Fu", ":FlutterPubUpgrade<CR>", { desc = "Flutter Pub Upgrade" })
		keymap("n", "<leader>Fo", ":FlutterOutlineToggle<CR>", { desc = "Flutter Outline Toggle" })
		keymap("n", "<leader>Fs", ":FlutterSuper<CR>", { desc = "Flutter Super" })

		-- LSP commands
		keymap("n", "<leader>Fa", vim.lsp.buf.code_action, { desc = "Code Action" })
		keymap("n", "<leader>Fr", vim.lsp.buf.rename, { desc = "Rename" })
		keymap("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
		keymap("n", "gi", vim.lsp.buf.implementation, { desc = "Go to Implementation" })
		keymap("n", "gr", vim.lsp.buf.references, { desc = "Go to References" })
		keymap("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })

		-- Hot reload and restart
		keymap("n", "<leader>FH", ":FlutterReload<CR>", { desc = "Hot Reload" })
		keymap("n", "<leader>FR", ":FlutterRestart<CR>", { desc = "Hot Restart" })

		-- Debug commands
		keymap("n", "<leader>Fb", ":FlutterBreakpoints<CR>", { desc = "Flutter Breakpoints" })
		keymap("n", "<leader>FD", ":FlutterDevTools<CR>", { desc = "Flutter DevTools" })
		keymap("n", "<leader>Fl", ":FlutterLogClear<CR>", { desc = "Clear Log" })
	end,
}
