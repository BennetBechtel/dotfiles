return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				json = { "prettier" },
				html = { "prettier" },
				css = { "prettier" },
				markdown = { "prettier", "mdformat" },
				yaml = { "prettier" },
				lua = { "stylua" },
				python = { "isort", "black" },
				svelte = { "prettier" },
				nix = { "nixfmt" },
			},
			format_on_save = {
				lsp_fallback = true,
				timeout_ms = 2000,
			},
		})
	end,
}
