return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")

		harpoon:setup()

		vim.keymap.set("n", "<leader>ma", function()
			harpoon:list():add()
		end, { desc = "[H]arpoon [A]dd file" })

		vim.keymap.set("n", "<leader>mh", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "[H]arpoon menu" })

		vim.keymap.set("n", "<leader>mn", function()
			harpoon:list():next()
		end, { desc = "[H]arpoon [N]ext" })

		vim.keymap.set("n", "<leader>mp", function()
			harpoon:list():prev()
		end, { desc = "[H]arpoon [P]revious" })

		for i = 1, 5 do
			vim.keymap.set("n", "<leader>m" .. i, function()
				harpoon:list():select(i)
			end, { desc = "Harpoon file " .. i })
		end
	end,
}
