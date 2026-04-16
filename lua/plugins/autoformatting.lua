return {
  'nvimtools/none-ls.nvim',
  dependencies = {
    'nvimtools/none-ls-extras.nvim',
    'jayp0521/mason-null-ls.nvim', -- ensure dependencies are installed
  },
  config = function()
    local null_ls = require 'null-ls'
    local formatting = null_ls.builtins.formatting -- to setup formatters
    local diagnostics = null_ls.builtins.diagnostics -- to setup linters
    vim.g.autoformat = true

    -- Formatters & linters for mason to install
    require('mason-null-ls').setup {
      ensure_installed = {
        'prettier', -- ts/js formatter
        'eslint_d', -- ts/js linter
        'shfmt', -- Shell formatter
        'checkmake', -- linter for Makefiles
        'golines',
        'ltrs',
        'stylua', -- lua formatter; Already installed via Mason
        'ruff', -- Python linter and formatter; Already installed via Mason
      },
      automatic_installation = true,
    }

    local sources = {
      diagnostics.checkmake,
      formatting.prettier.with { filetypes = { 'html', 'json', 'yaml', 'markdown' } },
      formatting.stylua,
      formatting.shfmt.with { args = { '-i', '4' } },
      formatting.terraform_fmt,
      require('none-ls.formatting.ruff').with { extra_args = { '--extend-select', 'I' } },
      require 'none-ls.formatting.ruff_format',
    }

    local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

    vim.api.nvim_create_user_command('FormatToggle', function(command_opts)
      if command_opts.bang then
        vim.b.autoformat = not vim.b.autoformat
        local state = vim.b.autoformat ~= false
        vim.notify('Buffer format on save ' .. (state and 'enabled' or 'disabled'), vim.log.levels.INFO, { title = 'nvim' })
        return
      end

      vim.g.autoformat = not vim.g.autoformat
      vim.notify('Global format on save ' .. (vim.g.autoformat and 'enabled' or 'disabled'), vim.log.levels.INFO, { title = 'nvim' })
    end, { bang = true })

    null_ls.setup {
      -- debug = true, -- Enable debug mode. Inspect logs with :NullLsLog.
      sources = sources,
      -- you can reuse a shared lspconfig on_attach callback here
      on_attach = function(client, bufnr)
        if client:supports_method 'textDocument/formatting' then
          vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
          vim.api.nvim_create_autocmd('BufWritePre', {
            group = augroup,
            buffer = bufnr,
            callback = function()
              if vim.g.autoformat == false or vim.b[bufnr].autoformat == false then
                return
              end
              vim.lsp.buf.format { async = false }
            end,
          })
        end
      end,
    }
  end,
}
