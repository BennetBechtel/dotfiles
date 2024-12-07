return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
		"jayp0521/mason-null-ls.nvim", -- ensure dependencies are installed
	},
	config = function()
		local null_ls = require("null-ls")
		local formatting = null_ls.builtins.formatting
		local diagnostics = null_ls.builtins.diagnostics

		-- Mason setup for formatters and linters
		require("mason-null-ls").setup({
			ensure_installed = {
				"prettier", -- ts/js formatter
				"stylua", -- lua formatter
				"eslint_d", -- ts/js linter
				"shfmt", -- shell formatter
				"ruff", -- python formatter/linter
			},
			automatic_installation = true,
		})

		-- Configure formatting sources
		local sources = {
			-- Prettier with Tailwind CSS plugin support
			formatting.prettier.with({
				extra_args = { "--plugin", "prettier-plugin-tailwindcss" },
				filetypes = {
					"html",
					"json",
					"yaml",
					"markdown",
					"javascript",
					"javascriptreact",
					"typescript",
					"typescriptreact",
				},
			}),
			formatting.stylua,
			formatting.shfmt.with({ args = { "-i", "4" } }),
			formatting.terraform_fmt,
			require("none-ls.formatting.ruff").with({ extra_args = { "--extend-select", "I" } }),
			require("none-ls.formatting.ruff_format"),
		}

		-- Create format-on-save autocommand group
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		-- Setup none-ls
		null_ls.setup({
			-- debug = true,  -- Enable for troubleshooting
			sources = sources,
			on_attach = function(client, bufnr)
				-- Enable format on save for clients that support formatting
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ async = false })
						end,
					})
				end
			end,
		})

		-- Note: The following global format-on-save autocmd might be redundant
		-- since formatting is already handled in the on_attach function above
		-- Consider removing this if you don't need it
		-- vim.api.nvim_create_autocmd("BufWritePre", {
		--     pattern = "*",
		--     callback = function()
		--         vim.lsp.buf.format({ async = false })
		--     end,
		-- })
	end,
}
