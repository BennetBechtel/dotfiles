return {
	"stevearc/conform.nvim",
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
				markdown = { "prettier" },
				yaml = { "prettier" },
				lua = { "stylua" },
				dart = { "dart_format" },
			},
			format_on_save = {
				lsp_fallback = true,
				timeout_ms = 2000,
			},
		})
	end,
}
