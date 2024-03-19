---@mod visidata Plugin to render pandas dataframe in nvim-dap using visidata.

local M = {}
local dap = require("dap")

local function get_visual_selection()
	local _, line_start, col_start = unpack(vim.fn.getpos("v"))
	local _, line_end, col_end = unpack(vim.fn.getpos("."))
	local selection = vim.api.nvim_buf_get_text(0, line_start - 1, col_start - 1, line_end - 1, col_end, {})
	return selection
end

--- Visualize the selected dataframe.
function M.visualize_pandas_df()
	dap.repl.execute("import visidata")
	local selected_dataframe = get_visual_selection()[1]
	dap.repl.execute("visidata.vd.view_pandas(" .. selected_dataframe .. ")")
end

return M
