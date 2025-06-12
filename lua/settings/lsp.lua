vim.lsp.enable('lua_ls')
vim.lsp.enable('typos_lsp')
vim.lsp.enable('eslint')
vim.lsp.enable('cssls')
vim.lsp.enable('dockerls')
vim.lsp.enable('tailwindcss')
vim.lsp.enable('jsonls')
vim.lsp.enable('jdtls')

vim.lsp.config('typos_lsp', {
  init_options = {
    diagnosticSeverity = 'Hint',
  },
})

vim.lsp.config('lua_ls', {
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if path ~= vim.fn.stdpath('config') and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc')) then
        return
      end
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        version = 'LuaJIT',
        path = {
          'lua/?.lua',
          'lua/?/init.lua',
        },
      },
      workspace = {
        checkThirdParty = false,
        library = { vim.env.VIMRUNTIME },
      },
    })
  end,
  settings = {
    Lua = {},
  },
})

vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'LSP: Rename symbol' })
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'LSP: Code Action' })
