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
        text = {
          spinner = 'arc',
        },
        window = {
          blend = 0,
          border = 'rounded',
        },
      },
    },
    'folke/neodev.nvim',
  },
}
