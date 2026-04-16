-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- For conciseness
local opts = { noremap = true, silent = true }
local user_group = vim.api.nvim_create_augroup("UserKeymaps", { clear = true })

-- Let vim-tmux-navigator own cross-pane navigation without redefining keys later.
vim.g.tmux_navigator_no_mappings = 1

-- save file
vim.keymap.set("n", "<C-s>", "<cmd> w <CR>", opts)

-- save file without auto-formatting
vim.keymap.set("n", "<leader>sn", "<cmd>noautocmd w <CR>", opts)
vim.keymap.set("n", "<leader>ww", "<cmd>w<CR>", { desc = "[W]rite buffer" })

-- quit file
vim.keymap.set("n", "<C-q>", "<cmd> q <CR>", opts)

-- delete single character without copying into register
vim.keymap.set("n", "x", '"_x', opts)

-- Vertical scroll and center
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)

-- Find and center
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)

-- Resize with arrows
vim.keymap.set("n", "<Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<Right>", ":vertical resize +2<CR>", opts)

-- Buffers
vim.keymap.set("n", "<Tab>", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", opts)
vim.keymap.set("n", "<leader>x", ":bdelete!<CR>", opts) -- close buffer
vim.keymap.set("n", "<leader>b", "<cmd> enew <CR>", opts) -- new buffer
vim.keymap.set("n", "<leader>bs", "<cmd>Scratch<CR>", { desc = "[B]uffer [S]cratch" })

-- Window management
vim.keymap.set("n", "<leader>v", "<C-w>v", opts) -- split window vertically
vim.keymap.set("n", "<leader>h", "<C-w>s", opts) -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", opts) -- make split windows equal width & height
vim.keymap.set("n", "<leader>xs", ":close<CR>", opts) -- close current split window

-- Navigate between splits
vim.keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>", opts)
vim.keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", opts)
vim.keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>", opts)
vim.keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>", opts)

-- Tabs
vim.keymap.set("n", "<leader>to", ":tabnew<CR>", opts) -- open new tab
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", opts) -- close current tab
vim.keymap.set("n", "<leader>tn", ":tabn<CR>", opts) --  go to next tab
vim.keymap.set("n", "<leader>tp", ":tabp<CR>", opts) --  go to previous tab

-- Toggle line wrapping
vim.keymap.set("n", "<leader>lw", "<cmd>set wrap!<CR>", opts)

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Keep last yanked when pasting
vim.keymap.set("v", "p", '"_dP', opts)

-- Diagnostic keymaps
vim.keymap.set("n", "[d", function()
	vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "Go to previous diagnostic message" })

vim.keymap.set("n", "]d", function()
	vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Go to next diagnostic message" })

vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- ToggleTerm
vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm direction=horizontal<CR>", { desc = "[T]erminal horizontal" })
vim.keymap.set("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical size=80<CR>", { desc = "[T]erminal [V]ertical" })
vim.keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", { desc = "[T]erminal [F]loat" })

for i = 1, 9 do
	vim.keymap.set("n", "<A-" .. i .. ">", function()
		require("bufferline").go_to(i, true)
	end, { silent = true })
end

function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
	vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
	vim.keymap.set("t", "<C-h>", [[<Cmd>TmuxNavigateLeft<CR>]], opts)
	vim.keymap.set("t", "<C-j>", [[<Cmd>TmuxNavigateDown<CR>]], opts)
	vim.keymap.set("t", "<C-k>", [[<Cmd>TmuxNavigateUp<CR>]], opts)
	vim.keymap.set("t", "<C-l>", [[<Cmd>TmuxNavigateRight<CR>]], opts)
	vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
end

vim.api.nvim_create_autocmd("TermOpen", {
	group = user_group,
	pattern = "term://*",
	callback = function()
		set_terminal_keymaps()
	end,
})

local function copy_to_clipboard(value, label)
	vim.fn.setreg("+", value)
	vim.fn.setreg('"', value)
	vim.notify(label .. " copied to clipboard", vim.log.levels.INFO, { title = "nvim" })
end

local function current_path(modifier)
	local path = vim.fn.expand("%:" .. modifier)
	if path == "" then
		vim.notify("Current buffer has no file path", vim.log.levels.WARN, { title = "nvim" })
		return nil
	end
	return path
end

vim.keymap.set("n", "<leader>yf", function()
	local path = current_path("t")
	if path then
		copy_to_clipboard(path, "Filename")
	end
end, { desc = "[Y]ank [F]ilename" })

vim.keymap.set("n", "<leader>yr", function()
	local path = current_path(".")
	if path then
		copy_to_clipboard(path, "Relative path")
	end
end, { desc = "[Y]ank [R]elative path" })

vim.keymap.set("n", "<leader>ya", function()
	local path = current_path("p")
	if path then
		copy_to_clipboard(path, "Absolute path")
	end
end, { desc = "[Y]ank [A]bsolute path" })

vim.api.nvim_create_user_command("Scratch", function()
	vim.cmd("enew")
	vim.bo.buftype = "nofile"
	vim.bo.bufhidden = "hide"
	vim.bo.swapfile = false
	vim.bo.buflisted = false
	vim.api.nvim_buf_set_name(0, "Scratch")
end, {})

local notes_path = vim.fs.joinpath(vim.fn.stdpath("data"), "notes.md")

vim.api.nvim_create_user_command("Notes", function()
	vim.cmd("edit " .. vim.fn.fnameescape(notes_path))
end, {})

vim.keymap.set("n", "<leader>nn", "<cmd>Notes<CR>", { desc = "[N]otes" })
vim.keymap.set("n", "<leader>uf", "<cmd>FormatToggle<CR>", { desc = "[U]I toggle [F]ormat on save" })
vim.keymap.set("n", "<leader>uF", "<cmd>FormatToggle!<CR>", { desc = "[U]I toggle buffer [F]ormat on save" })
vim.keymap.set("n", "<leader>ud", "<cmd>DiagnosticModeToggle<CR>", { desc = "[U]I toggle [D]iagnostic mode" })
