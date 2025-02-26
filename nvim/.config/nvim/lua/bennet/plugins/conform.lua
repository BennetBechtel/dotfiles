return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				dart = { "dart_format" },
				-- Add other filetypes and their formatters here
			},
			format_on_save = {
				lsp_fallback = true,
				timeout_ms = 5000,
			},
		})
	end,
}
