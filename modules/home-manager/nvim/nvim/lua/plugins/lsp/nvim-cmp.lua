return {
	"hrsh7th/nvim-cmp",
	version = false, -- last release is way too old
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
	},
	-- Not all LSP servers add brackets when completing a function.
	-- To better deal with this, LazyVim adds a custom option to cmp,
	-- that you can configure. For example:
	--
	-- ```lua
	-- opts = {
	--   auto_brackets = { "python" }
	-- }
	-- ```
	opts = function()
		vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
		vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
		local cmp = require("cmp")
		local defaults = require("cmp.config.default")()
		local auto_select = true

		-- Local implementation to replace LazyVim.cmp functions
		local cmp_utils = {
			-- Confirm completion with behavior options
			confirm = function(opts)
				opts = opts or {}
				return function(fallback)
					if cmp.visible() then
						local confirm_opts = {
							behavior = opts.behavior or cmp.ConfirmBehavior.Insert,
							select = opts.select or false,
						}
						cmp.confirm(confirm_opts)
					else
						fallback()
					end
				end
			end,
			-- Handle mapping for snippets and AI
			map = function(actions, fallback)
				return function()
					if cmp.visible() then
						local entry = cmp.get_selected_entry()
						if not entry then
							cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
						else
							cmp.confirm({ select = true })
						end
					elseif vim.snippet and vim.snippet.active() and actions.snippet_forward then
						vim.snippet.jump(1)
					else
						fallback()
					end
				end
			end,
		}

		-- Icons for completion items
		local kind_icons = {
			Text = "󰉿 ",
			Method = "󰆧 ",
			Function = "󰊕 ",
			Constructor = " ",
			Field = " ",
			Variable = "󰀫 ",
			Class = "󰠱 ",
			Interface = " ",
			Module = " ",
			Property = "󰜢 ",
			Unit = "󰑭 ",
			Value = "󰎠 ",
			Enum = " ",
			Keyword = "󰌋 ",
			Snippet = " ",
			Color = "󰏘 ",
			File = "󰈙 ",
			Reference = "󰈇 ",
			Folder = "󰉋 ",
			EnumMember = " ",
			Constant = "󰏿 ",
			Struct = "󰙅 ",
			Event = " ",
			Operator = "󰆕 ",
			TypeParameter = "󰊄 ",
			Default = " ",
		}

		return {
			auto_brackets = {}, -- configure any filetype to auto add brackets
			completion = {
				completeopt = "menu,menuone,noinsert" .. (auto_select and "" or ",noselect"),
			},
			preselect = auto_select and cmp.PreselectMode.Item or cmp.PreselectMode.None,
			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
				["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
				["<C-Space>"] = cmp.mapping.complete(),
				["<CR>"] = cmp_utils.confirm({ select = auto_select }),
				["<C-y>"] = cmp_utils.confirm({ select = true }),
				["<S-CR>"] = cmp_utils.confirm({ behavior = cmp.ConfirmBehavior.Replace }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				["<C-CR>"] = function(fallback)
					cmp.abort()
					fallback()
				end,
				["<tab>"] = function(fallback)
					return cmp_utils.map({ "snippet_forward", "ai_accept" }, fallback)()
				end,
			}),
			sources = cmp.config.sources({
				{ name = "lazydev" },
				{ name = "nvim_lsp" },
				{ name = "path" },
			}, {
				{ name = "buffer" },
			}),
			formatting = {
				format = function(_, item)
					if kind_icons[item.kind] then
						item.kind = kind_icons[item.kind] .. item.kind
					end

					local widths = {
						abbr = vim.g.cmp_widths and vim.g.cmp_widths.abbr or 40,
						menu = vim.g.cmp_widths and vim.g.cmp_widths.menu or 30,
					}

					for key, width in pairs(widths) do
						if item[key] and vim.fn.strdisplaywidth(item[key]) > width then
							item[key] = vim.fn.strcharpart(item[key], 0, width - 1) .. "…"
						end
					end

					return item
				end,
			},
			experimental = {
				-- only show ghost text when we show ai completions
				ghost_text = vim.g.ai_cmp and {
					hl_group = "CmpGhostText",
				} or false,
			},
			sorting = defaults.sorting,
		}
	end,
	main = "lazyvim.util.cmp",
}
