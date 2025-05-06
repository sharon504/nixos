-- Filename: ~/github/dotfiles-latest/neovim/neobean/lua/plugins/copilot.lua
-- ~/github/dotfiles-latest/neovim/neobean/lua/plugins/copilot.lua

return {
	"zbirenbaum/copilot.lua",
	{
		"zbirenbaum/copilot-cmp",
		config = function()
			require("copilot_cmp").setup()
		end,
	},
	config = function()
		require("copilot").setup({
			suggestion = { enabled = false },
			panel = { enabled = false },
		})
	end,
}
