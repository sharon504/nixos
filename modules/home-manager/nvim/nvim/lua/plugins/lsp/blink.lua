return {
	"saghen/blink.cmp",
	dependencies = {
		{ "saghen/blink.compat", opts = { enable_events = true } },
		{
		"Exafunction/codeium.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {},
		config = function()
			require("codeium").setup({})
		end,
		},
		"rafamadriz/friendly-snippets",
		{
			"giuxtaposition/blink-cmp-copilot",
		},
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			build = "make install_jsregexp",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
			end,
		},
		"onsails/lspkind.nvim", -- Add this for server icons
	},
	lazy = false,
	version = "v0.*",

	config = function()
		local blink = require("blink.cmp")
		local lspkind = require("lspkind")

		-- Define the formatting function separately
		local formatter = lspkind.cmp_format({
			mode = "symbol_text",
			menu = {
				copilot = "[Copilot]",
				codeium = "[Codeium]",
				lsp = "[LSP]",
				buffer = "[Buffer]",
				path = "[Path]",
				snippets = "[Snippet]",
			},
		})

		blink.setup({
			completion = {
				menu = {
					border = "rounded",
					max_height = 20,
				},
				documentation = {
					auto_show = true,
					window = {
						border = "rounded",
						max_height = 15,
						max_width = 80,
					},
				},
				ghost_text = {
					enabled = true,
				},
			},
			snippets = {
				preset = "luasnip",
				expand = function(snippet)
					require("luasnip").lsp_expand(snippet)
				end,
				active = function(filter)
					if filter and filter.direction then
						return require("luasnip").jumpable(filter.direction)
					end
					return require("luasnip").in_snippet()
				end,
				jump = function(direction)
					require("luasnip").jump(direction)
				end,
			},

			sources = {
				-- default = { "lsp", "path", "snippets", "buffer" },
				default = { "copilot", "codeium", "lsp", "path", "snippets", "buffer" },

				providers = {
					copilot = {
						name = "copilot",
						enabled = true,
						module = "blink-cmp-copilot",
						min_keyword_length = 0,
						score_offset = 100, -- Higher priority than codeium
						async = true,
					},
					codeium = {
						name = "codeium",
						module = "blink.compat.source",
						enabled = true,
						score_offset = 50, -- Higher than LSP but lower than Copilot
					},
					lsp = {
						name = "lsp",
						enabled = true,
						score_offset = 0,
					},
					buffer = {
						name = "buffer",
						enabled = true,
						score_offset = -50,
					},
					path = {
						name = "path",
						enabled = true,
						score_offset = -10,
					},
					snippets = {
						name = "snippets",
						enabled = true,
						score_offset = 0,
					},
				},
			},
			keymap = {
				["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
				["<C-e>"] = { "hide", "fallback" },

				["<C-l>"] = {
					function(cmp)
						if cmp.snippet_active() then
							return cmp.accept()
						elseif cmp.is_visible() then
							return cmp.select_and_accept()
						else
							return cmp.show()
						end
					end,
					"snippet_forward",
					"fallback",
				},
				["<S-Tab>"] = { "snippet_backward", "fallback" },

				["<C-k>"] = { "select_prev", "fallback" },
				["<C-j>"] = { "select_next", "fallback" },
				["<C-p>"] = { "select_prev", "fallback" },
				["<C-n>"] = { "select_next", "fallback" },

				["<C-u>"] = { "scroll_documentation_up", "fallback" },
				["<C-d>"] = { "scroll_documentation_down", "fallback" },

				["<C-y>"] = { "accept", "fallback" },
				["<Left>"] = { "show_signature", "hide_signature", "fallback" },
			},

			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "mono",
			},
		})

		-- Setup formatting separately after initialization if needed
		if blink.set_format then
			blink.set_format(formatter)
		end

		-- Make blink.cmp available globally for other plugins
		_G.blink_cmp = blink
	end,
	opts_extend = { "sources.default" },
}
