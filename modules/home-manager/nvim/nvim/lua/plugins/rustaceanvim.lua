return {
	"mrcjkb/rustaceanvim",
	version = "^5", -- Recommended
	lazy = false, -- This plugin is already lazy
	ft = "rust", -- Only load on Rust files
	init = function()
		vim.g.rustfmt_autosave = 1
	end,
}
