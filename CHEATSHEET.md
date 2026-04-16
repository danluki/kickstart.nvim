# Neovim Cheatsheet

This is a practical guide to your current Neovim config in `/home/danluki/.config/nvim`.

Leader key: `<Space>`

Note: a few plugins were recently added in config and may require `:Lazy sync` before they are available locally:
- `harpoon`
- `trouble.nvim`
- `nvim-treesitter-context`
- `persistence.nvim`
- `lazydev.nvim`

## What This Config Is Optimized For

- Fast project navigation with `Neo-tree`, `Telescope`, bufferline, and Harpoon
- Language-aware editing with LSP, Treesitter, completion, and autoformatting
- Git-heavy terminal workflow with `gitsigns`, `LazyGit`, and ToggleTerm
- Low-noise diagnostics with inline diagnostics plus Trouble when you want a bigger view

## Installed / Configured Plugins

### Core UI

| Plugin | What it does |
|---|---|
| `shaunsingh/nord.nvim` | Main colorscheme. Transparent background toggle on `<leader>bg`. |
| `nvim-lualine/lualine.nvim` | Statusline with mode, branch, file, diagnostics, diff, encoding, filetype. |
| `akinsho/bufferline.nvim` | Buffer tabs across the top. Alt-number jumps to a buffer position. |
| `goolord/alpha-nvim` | Dashboard on empty start. |
| `folke/which-key.nvim` | Popup that shows leader-key groups and shortcuts. |
| `lukas-reineke/indent-blankline.nvim` | Indent guides. |

### File / Search / Navigation

| Plugin | What it does |
|---|---|
| `nvim-neo-tree/neo-tree.nvim` | File tree, buffer tree, git status tree. Main explorer. |
| `nvim-telescope/telescope.nvim` | Fuzzy file search, grep, buffer picker, help search, LSP search. |
| `nvim-telescope/telescope-fzf-native.nvim` | Faster Telescope sorting if `make` is available. |
| `nvim-telescope/telescope-ui-select.nvim` | Better UI for Telescope-powered selections. |
| `ThePrimeagen/harpoon` | Quick file marks for jumping between your working set. |
| `nvim-treesitter/nvim-treesitter-context` | Sticky context header for current function/class. |

### Editing / Syntax / Completion

| Plugin | What it does |
|---|---|
| `nvim-treesitter/nvim-treesitter` | Better parsing, highlighting, and indentation for many languages. |
| `neovim/nvim-lspconfig` | LSP setup for TS, Python, Go, Rust, Zig, Lua, HTML, CSS, Tailwind, Docker, SQL, Terraform, JSON, YAML. |
| `mason.nvim` | Installs LSP servers and tools. |
| `mason-lspconfig.nvim` | Bridges Mason packages to LSP config names. |
| `mason-tool-installer.nvim` | Ensures your selected tools stay installed. |
| `hrsh7th/nvim-cmp` | Completion menu. |
| `L3MON4D3/LuaSnip` | Snippets. |
| `rafamadriz/friendly-snippets` | Prebuilt snippets for common languages. |
| `folke/lazydev.nvim` | Better Lua completion for Neovim config/plugin work. |
| `windwp/nvim-autopairs` | Auto-closes quotes, brackets, etc. |
| `numToStr/Comment.nvim` | Toggle comments with Ctrl-based mappings. |
| `tpope/vim-sleuth` | Auto-detects indentation style from the file. |
| `norcalli/nvim-colorizer.lua` | Shows color previews inline. |

### Formatting / Diagnostics / Code Quality

| Plugin | What it does |
|---|---|
| `nvimtools/none-ls.nvim` | Hooks formatters/linters into the LSP-like pipeline. |
| `none-ls-extras.nvim` | Extra integrations, including Ruff. |
| `mason-null-ls.nvim` | Installs formatters/linters used by none-ls. |
| `rachartier/tiny-inline-diagnostic.nvim` | Inline diagnostics instead of noisy default virtual text. |
| `folke/trouble.nvim` | Dedicated diagnostics / symbols / quickfix panel. |
| `folke/todo-comments.nvim` | Highlights TODO/FIXME/NOTE comments. |
| `j-hui/fidget.nvim` | LSP progress notifications. |

### Git / Terminal / Workflow

| Plugin | What it does |
|---|---|
| `lewis6991/gitsigns.nvim` | Git change markers in the sign column. |
| `kdheepak/lazygit.nvim` | Opens LazyGit inside Neovim. |
| `akinsho/toggleterm.nvim` | Horizontal, vertical, and floating terminals. |
| `christoomey/vim-tmux-navigator` | Seamless movement between tmux panes and Neovim splits with Ctrl-hjkl. |
| `folke/persistence.nvim` | Session restore/save workflow. |
| `ellisonleao/glow.nvim` | Terminal Markdown preview using the external `glow` CLI. |

### Supporting Dependencies

| Plugin | What it does |
|---|---|
| `nvim-lua/plenary.nvim` | Lua helpers used by many plugins. |
| `nvim-tree/nvim-web-devicons` | File icons. |
| `MunifTanjim/nui.nvim` | UI primitives used by Neo-tree and others. |
| `3rd/image.nvim` | Optional image preview support for Neo-tree. |
| `s1n7ax/nvim-window-picker` | Window chooser for Neo-tree open actions. |
| `moll/vim-bbye` | Better buffer delete integration for bufferline. |

## Typical Flows

### 1. Open a project and start coding

1. Open nvim in the project root.
2. Use `<leader>e` to toggle the file tree.
3. Use `<leader>sf` to find files or `<leader>sg` to grep across the repo.
4. Open related files into the working set with `<leader>ma`.
5. Jump between active files with `<leader>m1`..`<leader>m5` or `<leader>mn` / `<leader>mp`.
6. Save with `<C-s>`.

### 2. Explore and edit code with LSP

1. Put cursor on a symbol.
2. `gd` for definition.
3. `gr` for references.
4. `gI` for implementation.
5. `<leader>rn` to rename.
6. `<leader>ca` for code actions.
7. `<leader>ds` for file symbols or `<leader>ws` for workspace symbols.

### 3. Search-heavy refactor flow

1. `<leader>sg` to live grep the repo.
2. `<leader>/` to fuzzy-search inside the current buffer.
3. `<leader><leader>` to switch buffers.
4. `n` / `N` to move through matches while keeping the cursor centered.

### 4. Diagnostics and fixing errors

1. `[d` / `]d` to move through diagnostics.
2. `<leader>d` to inspect the current diagnostic.
3. `<leader>xx` to open Trouble for all diagnostics.
4. `<leader>xX` to show diagnostics only for the current buffer.
5. `<leader>ud` to switch between inline diagnostics and classic virtual text.

### 5. Git workflow

1. `<leader>lg` to open LazyGit.
2. `<leader>ngs` for Neo-tree git status view.
3. Watch changed lines in the sign column from `gitsigns`.
4. Use the terminal or LazyGit for commit/push flow.

### 6. Terminal-heavy workflow

1. `<leader>tt` opens a horizontal terminal.
2. `<leader>tv` opens a vertical terminal.
3. `<leader>tf` opens a floating terminal.
4. In terminal mode use `<Esc>` or `jk` to get back to normal mode.
5. Use `<C-h>`, `<C-j>`, `<C-k>`, `<C-l>` to move between terminal panes and editor panes.

### 7. Session-based project workflow

1. Work normally.
2. Close Neovim.
3. Reopen and use `<leader>qs` to restore the session.
4. Use `<leader>qS` if you want to choose a session.
5. Use `<leader>ql` to load the last session.

### 8. Notes / scratch workflow

1. `<leader>nn` opens your notes file in `stdpath("data")/notes.md`.
2. `<leader>bs` opens a scratch buffer for temporary text.
3. Use this for quick SQL, JSON, logs, curl snippets, etc.

### 9. Markdown preview workflow

1. Open a Markdown buffer.
2. Run `:Glow` or press `<leader>gp`.
3. If nothing opens, install the `glow` CLI so `glow.nvim` can launch it.

## General Shortcut Helper

### Files, Search, Explorer

| Shortcut | Action |
|---|---|
| `<leader>e` | Toggle Neo-tree |
| `\` | Reveal current file in Neo-tree |
| `<leader>sf` | Find files |
| `<leader>sF` | Find git-tracked files |
| `<leader>sg` | Live grep project |
| `<leader>sw` | Search word under cursor |
| `<leader>s/` | Grep only open files |
| `<leader>/` | Fuzzy search current buffer |
| `<leader>sd` | Search diagnostics |
| `<leader>sr` | Resume last Telescope picker |
| `<leader>s.` | Recent files |
| `<leader>sc` | Recent files in current cwd |
| `<leader>sh` | Help tags |
| `<leader>sk` | Keymaps |
| `<leader><leader>` | Buffer picker |

### Buffers, Windows, Tabs

| Shortcut | Action |
|---|---|
| `<Tab>` / `<S-Tab>` | Next / previous buffer |
| `<leader>x` | Delete current buffer |
| `<leader>b` | New empty buffer |
| `<leader>bs` | New scratch buffer |
| `<A-1>`..`<A-9>` | Jump to bufferline slot |
| `<leader>v` | Vertical split |
| `<leader>h` | Horizontal split |
| `<leader>se` | Equalize split sizes |
| `<leader>xs` | Close current split |
| `<leader>to` | New tab |
| `<leader>tx` | Close tab |
| `<leader>tn` / `<leader>tp` | Next / previous tab |
| `<Up>/<Down>/<Left>/<Right>` | Resize split |
| `<C-h>/<C-j>/<C-k>/<C-l>` | Move across splits and tmux panes |

### LSP / Code Navigation

| Shortcut | Action |
|---|---|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gr` | References |
| `gI` | Implementation |
| `<leader>D` | Type definition |
| `<leader>ds` | Document symbols |
| `<leader>ws` | Workspace symbols |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code action |
| `<leader>th` | Toggle inlay hints |

### Diagnostics / Trouble

| Shortcut | Action |
|---|---|
| `[d` / `]d` | Previous / next diagnostic |
| `<leader>d` | Diagnostic float |
| `<leader>q` | Diagnostics loclist |
| `<leader>xx` | Trouble: all diagnostics |
| `<leader>xX` | Trouble: current buffer diagnostics |
| `<leader>xl` | Trouble: loclist |
| `<leader>xq` | Trouble: quickfix |
| `<leader>cs` | Trouble: symbols |
| `<leader>cl` | Trouble: LSP panel |
| `<leader>ud` | Toggle diagnostic display mode |

### Terminal / Git

| Shortcut | Action |
|---|---|
| `<leader>tt` | Horizontal terminal |
| `<leader>tv` | Vertical terminal |
| `<leader>tf` | Floating terminal |
| `<leader>gp` | Preview current Markdown buffer with Glow |
| `<leader>lg` | LazyGit |
| `<leader>ngs` | Neo-tree git status |
| Terminal `jk` or `<Esc>` | Leave terminal insert mode |

### Harpoon

| Shortcut | Action |
|---|---|
| `<leader>ma` | Add current file to Harpoon |
| `<leader>mh` | Open Harpoon quick menu |
| `<leader>mn` / `<leader>mp` | Next / previous Harpoon file |
| `<leader>m1`..`<leader>m5` | Jump to Harpoon slot |

### Sessions, Notes, Utility

| Shortcut | Action |
|---|---|
| `<leader>qs` | Restore session |
| `<leader>qS` | Select session |
| `<leader>ql` | Restore last session |
| `<leader>qd` | Stop session saving |
| `<leader>nn` | Open notes file |
| `<leader>yf` | Copy filename |
| `<leader>yr` | Copy relative path |
| `<leader>ya` | Copy absolute path |
| `<leader>uf` | Toggle global format-on-save |
| `<leader>uF` | Toggle buffer-local format-on-save |
| `<leader>ww` | Write buffer |
| `<leader>sn` | Save without autocommands |
| `<C-s>` | Save |
| `<C-q>` | Quit |
| `<leader>lw` | Toggle wrap |
| `<leader>bg` | Toggle Nord transparent background |
| `<leader>tc` | Toggle Treesitter context |

### Commenting and Editing

| Shortcut | Action |
|---|---|
| `<C-/>`, `<C-_>`, `<C-c>` | Toggle comment line |
| Visual `<C-/>`, `<C-_>`, `<C-c>` | Toggle comment selection |
| `x` | Delete char without yanking |
| Visual `p` | Paste without overwriting yank register |
| Visual `<` / `>` | Reindent and keep selection |
| `n` / `N` | Next / previous search result centered |
| `<C-d>` / `<C-u>` | Half-page down/up centered |

## Neo-tree Local Keys

Use these when Neo-tree is focused.

| Shortcut | Action |
|---|---|
| `<CR>` or `l` | Open |
| `s` | Vertical split |
| `S` | Horizontal split |
| `t` | Open in new tab |
| `w` | Open with window picker |
| `P` | Float preview |
| `<space>` | Expand/collapse node |
| `C` | Close node |
| `z` | Close all nodes |
| `a` / `A` | Add file / add directory |
| `d` | Delete |
| `r` | Rename |
| `c` / `m` | Copy / move |
| `y` / `x` / `p` | Copy / cut / paste |
| `.` | Set root to current node |
| `<bs>` | Go up |
| `H` | Toggle hidden files |
| `/` | Fuzzy finder |
| `D` | Fuzzy finder for directories |
| `f` | Filter |
| `<c-x>` | Clear filter |
| `[g` / `]g` | Prev / next git-modified file |
| `R` | Refresh |
| `?` | Help |
| `i` | File details |

## Telescope Local Keys

Use these inside Telescope.

| Shortcut | Action |
|---|---|
| `<C-j>` / `<C-k>` | Move selection down / up |
| `<C-l>` | Open selection |
| `<C-/>` in insert mode | Telescope help |
| `?` in normal mode | Telescope help |

## Language Servers Enabled

These are configured in your LSP setup:

- `ts_ls`
- `ruff`
- `gopls`
- `rust_analyzer`
- `zls`
- `pylsp`
- `html`
- `cssls`
- `tailwindcss`
- `dockerls`
- `sqlls`
- `terraformls`
- `jsonls`
- `yamlls`
- `lua_ls`

## Formatters / Linters Wired In

- `prettier` for `html`, `json`, `yaml`, `markdown`
- `stylua`
- `shfmt`
- `terraform_fmt`
- `ruff`
- `ruff_format`
- `checkmake`

## Good Default Habits In This Setup

- Use Harpoon for the 3-5 files you keep bouncing between.
- Use Telescope for discovery, Neo-tree for structure.
- Use Trouble when diagnostics get noisy.
- Keep inline diagnostics on most of the time and switch with `<leader>ud` when needed.
- Use `<leader>sn` if a formatter or autocmd is getting in the way.
- Use sessions for bigger multi-file work instead of reopening everything manually.
