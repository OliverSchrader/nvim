local clients_lsp = function()
  local clients = vim.lsp.get_clients()
  if next(clients) == nil then
    return ''
  end

  local c = {}
  for _, client in pairs(clients) do
    if client.name == 'lua_ls' then
      table.insert(c, '')
    elseif client.name == 'typos_lsp' then
      table.insert(c, '')
    elseif client.name == 'typescript-tools' then
      table.insert(c, '')
    elseif client.name == 'tailwindcss' then
      table.insert(c, '󱏿')
    elseif client.name == 'cssls' then
      table.insert(c, '')
    elseif client.name == 'eslint' then
      table.insert(c, '')
    elseif client.name == 'spring-boot' then
      table.insert(c, '') -- no icon
    elseif client.name == 'jdtls' then
      table.insert(c, '')
    elseif client.name == 'jsonls' then
      table.insert(c, '')
    else
      table.insert(c, client.name)
    end
  end
  return table.concat(c, ' ')
end

return {
  'nvim-lualine/lualine.nvim',
  opts = {
    options = {
      icons_enabled = true,
      theme = 'catppuccin',
      component_separators = { left = '', right = '' },
      section_separators = { left = '', right = '' },
      disabled_filetypes = { 'alpha' },
      globalstatus = true,
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = {
        {
          'filename',
          file_status = true,
          newfile_status = false,
          path = 0,
          symbols = {
            modified = '',
            readonly = '',
            unnamed = 'No Name',
            newfile = 'New',
          },
        },
        { clients_lsp },
      },
      lualine_c = {},
      lualine_x = { 'diagnostics' },
      lualine_y = {},
      lualine_z = { 'diff', 'branch' },
    },
    inactive_sections = {
      lualine_a = { 'filename' },
      lualine_b = {
        {
          'filetype',
          icon_only = true,
          icon = {
            align = 'left',
          },
        },
      },
      lualine_c = {},
      lualine_x = { 'diagnostics' },
      lualine_y = { clients_lsp },
      lualine_z = { 'diff', 'branch' },
    },
  },
}
