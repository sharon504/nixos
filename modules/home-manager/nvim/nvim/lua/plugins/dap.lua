return {
	"mfussenegger/nvim-dap",
	recommended = true,
	desc = "Debugging support. Requires language specific adapters to be configured. (see lang extras)",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		-- virtual text for the debugger
		{
			"theHamsta/nvim-dap-virtual-text",
			opts = {},
		},
		-- Optional: Add plenary for JSON parsing if using VSCode launch configs
		"nvim-lua/plenary.nvim",
	},
  -- stylua: ignore
  keys = {
    { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
    { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
    { "<leader>dc", function() require("dap").continue() end, desc = "Run/Continue" },
    { "<leader>da", function() 
      local get_args = function()
        local args_string = vim.fn.input("Arguments: ")
        return vim.split(args_string, " ")
      end
      require("dap").continue({ before = get_args }) 
    end, desc = "Run with Args" },
    { "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
    { "<leader>dg", function() require("dap").goto_() end, desc = "Go to Line (No Execute)" },
    { "<leader>di", function() require("dap").step_into() end, desc = "Step Into" },
    { "<leader>dj", function() require("dap").down() end, desc = "Down" },
    { "<leader>dk", function() require("dap").up() end, desc = "Up" },
    { "<leader>dl", function() require("dap").run_last() end, desc = "Run Last" },
    { "<leader>do", function() require("dap").step_out() end, desc = "Step Out" },
    { "<leader>dO", function() require("dap").step_over() end, desc = "Step Over" },
    { "<leader>dP", function() require("dap").pause() end, desc = "Pause" },
    { "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
    { "<leader>ds", function() require("dap").session() end, desc = "Session" },
    { "<leader>dt", function() require("dap").terminate() end, desc = "Terminate" },
    { "<leader>dw", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
  },
	config = function()
		-- Define debug signs
		local dap_signs = {
			Breakpoint = { text = "●", texthl = "DiagnosticSignError", linehl = "", numhl = "" },
			BreakpointCondition = { text = "●", texthl = "DiagnosticSignWarn", linehl = "", numhl = "" },
			LogPoint = { text = "◆", texthl = "DiagnosticSignInfo", linehl = "", numhl = "" },
			Stopped = {
				text = "→",
				texthl = "DiagnosticSignWarn",
				linehl = "DapStoppedLine",
				numhl = "DapStoppedLine",
			},
			Rejected = { text = "✖", texthl = "DiagnosticSignHint", linehl = "", numhl = "" },
		}

		-- Set highlight for stopped line
		vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

		-- Register signs
		for name, sign in pairs(dap_signs) do
			vim.fn.sign_define(
				"Dap" .. name,
				{ text = sign.text, texthl = sign.texthl, linehl = sign.linehl, numhl = sign.numhl }
			)
		end

		-- Optional: Setup dap UI
		local dapui = require("dapui")
		dapui.setup()

		-- Auto open/close dapui
		local dap = require("dap")
		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end

		-- Setup dap config by VsCode launch.json file
		local vscode = require("dap.ext.vscode")
		local plenary_json = require("plenary.json")
		vscode.json_decode = function(str)
			return vim.json.decode(plenary_json.json_strip_comments(str))
		end

		-- You can add specific language adapters here
		-- For example:
		-- require("dap").adapters.python = {
		--   type = "executable",
		--   command = "path/to/debugpy/python",
		--   args = { "-m", "debugpy.adapter" }
		-- }
	end,
}
