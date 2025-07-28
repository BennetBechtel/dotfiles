return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" }, -- make sure it loads before saving
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
				python = { "isort", "black" },
				dart = { "dart_format" },
			},
			format_on_save = {
				lsp_fallback = true,
				timeout_ms = 2000,
			},
		})
	end,
}
