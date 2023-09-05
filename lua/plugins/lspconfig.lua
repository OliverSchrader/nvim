return {
  'neovim/nvim-lspconfig',
  dependencies = {
    {
      'williamboman/mason.nvim',
      config = true,
    },
    'williamboman/mason-lspconfig.nvim',
    {
      'j-hui/fidget.nvim',
      tag = 'legacy',
      opts = {
        window = {
          blend = 0,
        }
      }
    },
    'folke/neodev.nvim',
  },
}
