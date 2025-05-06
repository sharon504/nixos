return {
	"mrcjkb/rustaceanvim",
	version = vim.fn.has("nvim-0.10.0") == 0 and "^4" or false,
	ft = { "rust" },
	opts = {
		server = {
			on_attach = function(_, bufnr)
				vim.keymap.set("n", "<leader>cR", function()
					vim.cmd.uire, "mason-registry")

		if has_mason then
			local package_path = require("mason-registry").get_package("codelldb"):get_install_path()
			local codelldb = package_path .. "/extension/adapter/codelldb"
			local library_path = package_path .. "/extension/lldb/lib/liblldb.dylib"
			local uname = io.popen("uname"):read("*l")
			if uname == "Linux" then
				library_path = package_path .. "/extension/lldb/lib/liblldb.so"
			end
			opts.dap = {
				adapter = require("rustaceanvim.config").get_codelldb_adapter(codelldb, library_path),
			}
		end

		vim.g.rustaceanvim = vim.tbl_deep_extend("keep", vim.g.rustaceanvim or {}, opts or {})

		if vim.fn.executable("rust-analyzer") == 0 then
			vim.notify(
				"**rust-analyzer** not found in PATH, please install it.\nhttps://rust-analyzer.github.io/",
				vim.log.levels.ERROR,
				{ title = "rustaceanvim" }
			)
		end
	end,
}
