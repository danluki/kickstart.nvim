return {
	"ellisonleao/glow.nvim",
	ft = { "markdown" },
	cmd = { "Glow" },
	config = function()
		local glow_path = "/usr/bin/glow"
		if vim.fn.filereadable(glow_path) == 0 then
			glow_path = vim.fn.exepath("glow")
		end

		require("glow").setup({
			glow_path = glow_path,
			border = "rounded",
			width = 120,
		})
	end,
	keys = {
		{
			"<leader>gp",
			function()
				local glow_path = require("glow").config.glow_path
				if glow_path == "" or vim.fn.executable(glow_path) ~= 1 then
					vim.notify("`glow` binary not found. Expected `/usr/bin/glow` or a working `glow` in PATH.", vim.log.levels.WARN, {
						title = "glow.nvim",
					})
					return
				end

				vim.cmd("Glow")
			end,
			desc = "[G]low [P]review",
		},
	},
}
