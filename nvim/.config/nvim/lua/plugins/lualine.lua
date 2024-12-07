-- Set lualine as statusline
return {
	"nvim-lualine/lualine.nvim",
	config = function()
		-- Catppuccin Mocha color palette
		local colors = {
			blue = "#89B4FA",
			green = "#A6E3A1",
			purple = "#CBA6F7",
			cyan = "#94E2D5",
			red = "#F38BA8",
			yellow = "#F9E2AF",
			fg = "#CDD6F4",
			bg = "#1E1E2E",
			gray1 = "#585B70",
			gray2 = "#45475A",
			gray3 = "#313244",
		}

		local catppuccin_theme = {
			normal = {
				a = { fg = colors.bg, bg = colors.blue, gui = "bold" },
				b = { fg = colors.fg, bg = colors.gray3 },
				c = { fg = colors.fg, bg = colors.bg },
			},
			insert = { a = { fg = colors.bg, bg = colors.green, gui = "bold" } },
			visual = { a = { fg = colors.bg, bg = colors.purple, gui = "bold" } },
			command = { a = { fg = colors.bg, bg = colors.yellow, gui = "bold" } },
			replace = { a = { fg = colors.bg, bg = colors.red, gui = "bold" } },
			terminal = { a = { fg = colors.bg, bg = colors.cyan, gui = "bold" } },
			inactive = {
				a = { fg = colors.gray1, bg = colors.bg, gui = "bold" },
				b = { fg = colors.gray1, bg = colors.bg },
				c = { fg = colors.gray1, bg = colors.bg },
			},
		}

		local mode = {
			"mode",
			fmt = function(str)
				return " " .. str
			end,
		}

		local filename = {
			"filename",
			file_status = true,
			path = 0,
			color = { fg = colors.fg },
		}

		local hide_in_width = function()
			return vim.fn.winwidth(0) > 100
		end

		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = catppuccin_theme,
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
				disabled_filetypes = { "alpha", "neo-tree", "Avante" },
				always_divide_middle = true,
			},
			sections = {
				lualine_a = { mode },
				lualine_b = {
					{ "branch", color = { fg = colors.purple } },
				},
				lualine_c = { filename },
				lualine_x = {
					{
						"diagnostics",
						sources = { "nvim_diagnostic" },
						sections = { "error", "warn" },
						symbols = { error = " ", warn = " " },
						colored = true,
						update_in_insert = false,
						always_visible = false,
						cond = hide_in_width,
						color = { fg = colors.red },
					},
					{
						"diff",
						colored = true,
						symbols = { added = " ", modified = " ", removed = " " },
						cond = hide_in_width,
						diff_color = {
							added = { fg = colors.green },
							modified = { fg = colors.yellow },
							removed = { fg = colors.red },
						},
					},
					{
						"encoding",
						cond = hide_in_width,
						color = { fg = colors.cyan },
					},
					{
						"filetype",
						cond = hide_in_width,
						color = { fg = colors.green },
					},
				},
				lualine_y = {
					{ "location", color = { fg = colors.yellow } },
				},
				lualine_z = {
					{ "progress", color = { fg = colors.blue } },
				},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {
					{
						"filename",
						path = 1,
						color = { fg = colors.gray1 },
					},
				},
				lualine_x = {
					{
						"location",
						padding = 0,
						color = { fg = colors.gray1 },
					},
				},
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			extensions = { "fugitive" },
		})
	end,
}
