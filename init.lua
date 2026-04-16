require("core.options")
require("core.keymaps")

if vim.iter then
	vim.tbl_flatten = function(t)
		return vim.iter(t):flatten(math.huge):totable()
	end
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end

local rtp = vim.opt.rtp
rtp:prepend(lazypath)

require("lazy").setup({
	require("plugins.neotree"),
	require("plugins.colortheme"),
	require("plugins.bufferline"),
	require("plugins.lualine"),
	require("plugins.treesitter"),
	require("plugins.treesitter-context"),
	require("plugins.telescope"),
	require("plugins.lsp"),
	require("plugins.lazydev"),
	require("plugins.autocompletion"),
	require("plugins.autoformatting"),
	require("plugins.gitsigns"),
	require("plugins.alpha"),
	require("plugins.indent-blankline"),
	require("plugins.glow"),
	require("plugins.misc"),
	require("plugins.comment"),
	require("plugins.toggleterm"),
	require("plugins.inline"),
	require("plugins.trouble"),
	require("plugins.harpoon"),
	require("plugins.persistence"),
	require("plugins.lazygit"),
})
