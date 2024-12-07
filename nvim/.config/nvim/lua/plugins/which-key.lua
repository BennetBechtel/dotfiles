return {
	"folke/which-key.nvim",
	event = "VimEnter",
	opts = {
		icons = {
			mappings = vim.g.have_nerd_font,
			keys = vim.g.have_nerd_font and {} or {
				Up = "↑",
				Down = "↓",
				Left = "←",
				Right = "→",
				C = "⌃",
				M = "⌥",
				D = "⌘",
				S = "⇧",
			},
		},
		-- Document existing key chains
		spec = {
			{ "<leader>b", group = "[B]uffer" },
			{ "<leader>f", group = "[F]ind" },
			{ "<leader>g", group = "[G]it" },
			{ "<leader>l", group = "[L]SP" },
			{ "<leader>s", group = "[S]earch" },
			{ "<leader>t", group = "[T]oggle" },
			{ "<leader>w", group = "[W]indow" },

			-- Buffer commands
			{ "<leader>bn", "<cmd>enew<cr>", desc = "Create New Buffer" },
			{ "<leader>bx", "<cmd>Bdelete!<cr>", desc = "Delete Current Buffer" },
			{ "<leader>bg", desc = "Toggle Background Transparency" },

			-- Explorer
			{ "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle File Explorer" },

			-- Find commands
			{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files in Project" },
			{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Find Text in Project" },
			{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find Open Buffers" },
			{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Find Help Documentation" },

			-- Git commands
			{ "<leader>gf", "<cmd>Telescope git_files<cr>", desc = "Find Files in Git Project" },
			{ "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Switch Git Branch" },
			{ "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Browse Git Commits" },
			{ "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "View Git Status" },

			-- LSP commands
			{ "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Show Code Actions" },
			{ "<leader>ld", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Show Buffer Diagnostics" },
			{ "<leader>lf", "<cmd>lua vim.lsp.buf.format()<cr>", desc = "Format Current Buffer" },
			{ "<leader>li", "<cmd>LspInfo<cr>", desc = "Show LSP Information" },
			{ "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<cr>", desc = "Go to Next Diagnostic" },
			{ "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<cr>", desc = "Go to Previous Diagnostic" },
			{ "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename Symbol" },

			-- Search commands
			{ "<leader>sf", "<cmd>Telescope find_files<cr>", desc = "Search Project Files" },
			{ "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Search Help Documentation" },
			{ "<leader>sw", "<cmd>Telescope grep_string<cr>", desc = "Search Current Word" },
			{ "<leader>sg", "<cmd>Telescope live_grep<cr>", desc = "Search by Grep" },
			{ "<leader>sd", "<cmd>Telescope diagnostics<cr>", desc = "Search Diagnostics" },

			-- Toggle commands
			{ "<leader>tf", "<cmd>Telescope filetypes<cr>", desc = "Change File Type" },
			{ "<leader>tw", "<cmd>set wrap!<cr>", desc = "Toggle Word Wrap" },
			{ "<leader>ts", "<cmd>set spell!<cr>", desc = "Toggle Spell Check" },

			-- Window commands
			{ "<leader>ws", "<cmd>split<cr>", desc = "Split Window Horizontally" },
			{ "<leader>wv", "<cmd>vsplit<cr>", desc = "Split Window Vertically" },
			{ "<leader>ww", "<cmd>w<cr>", desc = "Save Current Buffer" },
			{ "<leader>wh", "<C-w>h", desc = "Move to Left Window" },
			{ "<leader>wj", "<C-w>j", desc = "Move to Window Below" },
			{ "<leader>wk", "<C-w>k", desc = "Move to Window Above" },
			{ "<leader>wl", "<C-w>l", desc = "Move to Right Window" },
			{ "<leader>wc", "<cmd>close<cr>", desc = "Close Current Window" },

			-- Number operations
			{ "<leader>+", "<C-a>", desc = "Increment Number" },
			{ "<leader>-", "<C-x>", desc = "Decrement Number" },

			-- Clipboard operations
			{ "<leader>y", [["+y]], desc = "Yank to System Clipboard" },
			{ "<leader>Y", [["+Y]], desc = "Yank Line to System Clipboard" },
		},
	},
}
