return {
	"nvim-treesitter/nvim-treesitter-context",
	event = "VeryLazy",
	opts = {
		max_lines = 4,
		multiline_threshold = 10,
	},
	keys = {
		{
			"<leader>tc",
			function()
				require("treesitter-context").toggle()
			end,
			desc = "[T]oggle Treesitter [C]ontext",
		},
	},
}
