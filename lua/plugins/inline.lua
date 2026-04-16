return {
	"rachartier/tiny-inline-diagnostic.nvim",
	event = "VeryLazy",
	priority = 1000,
	config = function()
		local tiny = require("tiny-inline-diagnostic")
		local diagnostic_modes = {
			inline = function()
				tiny.enable()
				vim.diagnostic.config({ virtual_text = false })
			end,
			virtual_text = function()
				tiny.disable()
				vim.diagnostic.config({ virtual_text = true })
			end,
		}

		tiny.setup()

		vim.g.diagnostic_display_mode = "inline"
		diagnostic_modes[vim.g.diagnostic_display_mode]()

		vim.api.nvim_create_user_command("DiagnosticModeToggle", function()
			if vim.g.diagnostic_display_mode == "inline" then
				vim.g.diagnostic_display_mode = "virtual_text"
			else
				vim.g.diagnostic_display_mode = "inline"
			end

			diagnostic_modes[vim.g.diagnostic_display_mode]()
			vim.notify("Diagnostic mode: " .. vim.g.diagnostic_display_mode, vim.log.levels.INFO, { title = "nvim" })
		end, {})
	end,
}
