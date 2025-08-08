return {
	-- Autocompletion plugin
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		-- Sources for nvim-cmp
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-nvim-lsp",
		-- Snippet engine
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*", -- Use the latest v2 release
			build = "make install_jsregexp", -- Install optional dependencies
		},
		-- Snippet completions
		"saadparwaiz1/cmp_luasnip",
		-- Predefined snippets including React/React Native
		"rafamadriz/friendly-snippets",
		-- VSCode-like pictograms
		"onsails/lspkind.nvim",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")

		-- Load VSCode-style snippets (React/React Native included)
		require("luasnip.loaders.from_vscode").lazy_load({
			include = { "javascriptreact", "typescriptreact", "javascript", "typescript" },
		})

		cmp.setup({
			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},
			window = {
				documentation = {
					border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
				},
				completion = {
					border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
				},
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = false }),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp", priority = 1000 },
				{ name = "luasnip", priority = 750 },
				{ name = "buffer", priority = 500 },
				{ name = "path", priority = 250 },
			}),
			formatting = {
				format = lspkind.cmp_format({
					maxwidth = 30,
					ellipsis_char = "...",
				}),
			},
		})
	end,
}
