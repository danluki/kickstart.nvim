-- Easily comment visual regions/lines
return {
	"numToStr/Comment.nvim",
	config = function()
		local comment_ft = require("Comment.ft")
		comment_ft.set("toml", "#%s")

		require("Comment").setup({
			pre_hook = function()
				if vim.bo.filetype == "toml" then
					return "#%s"
				end
			end,
		})
		local opts = { remap = true, silent = true }

		vim.keymap.set("n", "<C-_>", "gcc", opts)
		vim.keymap.set("n", "<C-c>", "gcc", opts)
		vim.keymap.set("n", "<C-/>", "gcc", opts)
		vim.keymap.set("x", "<C-_>", "gc", opts)
		vim.keymap.set("x", "<C-c>", "gc", opts)
		vim.keymap.set("x", "<C-/>", "gc", opts)
	end,
}
