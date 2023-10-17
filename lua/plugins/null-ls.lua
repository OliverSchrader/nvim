return {
    'jose-elias-alvarez/null-ls.nvim',
    config = function()
      local sources = {
        require('null-ls').builtins.formatting.prettier,
      }

      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
      local on_attach = function(client, bufnr)
        if client.supports_method "textDocument/formatting" then
          vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
          -- vim.api.nvim_create_autocmd("BufWritePre", {
          --   group = augroup,
          --   buffer = bufnr,
          --   callback = function()
          --     vim.lsp.buf.format { async = false }
          --   end,
          -- })
        end
      end

      require('null-ls').setup({
        debug = true,
        sources = sources,
        on_attach = on_attach,
      })
    end,
    requires = { 'nvim-lua/plenary.nvim' }
  }
