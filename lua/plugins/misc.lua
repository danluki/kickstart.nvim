-- Standalone plugins with less than 10 lines of config go here
return {
	{
		-- Tmux & split window navigation
		"christoomey/vim-tmux-navigator",
	},
	{
		-- Detect tabstop and shiftwidth automatically
		"tpope/vim-sleuth",
	},
	{
		-- Hints keybinds
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			local wk = require("which-key")

			wk.setup()
			wk.add({
				{ "<leader>b", group = "Buffers" },
				{ "<leader>c", group = "Code" },
				{ "<leader>g", group = "Glow" },
				{ "<leader>m", group = "Harpoon" },
				{ "<leader>n", group = "Notes / Neo-tree" },
				{ "<leader>q", group = "Sessions / Diagnostics" },
				{ "<leader>s", group = "Search" },
				{ "<leader>t", group = "Terminal / Treesitter" },
				{ "<leader>u", group = "Toggles" },
				{ "<leader>x", group = "Diagnostics / Trouble" },
				{ "<leader>y", group = "Yank path" },
			})
		end,
	},
	{
		-- Autoclose parentheses, brackets, quotes, etc.
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		opts = {},
	},
	{
		-- Highlight todo, notes, etc in comments
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},
	{
		-- High-performance color highlighter
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
}
