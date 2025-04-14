return {
	"kristijanhusak/vim-dadbod-ui",
	dependencies = {
		{ "tpope/vim-dadbod" },
		{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" } },
	},
	keys = { -- Mapping to toggle DBUI
		{ "<leader>db", "<cmd>DBUIToggle<CR>", desc = "Toggle DBUI" },
	},
}
