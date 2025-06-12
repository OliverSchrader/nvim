local util = require 'util'

local get_window_config = function()
  local window_height = vim.api.nvim_list_uis()[1].height
  local window_width = vim.api.nvim_list_uis()[1].width

  return {
    relative = 'editor',
    border = 'rounded',
    title = 'Note',
    title_pos = 'center',
    width = math.floor(0.70 * window_width),
    height = math.floor(0.75 * window_height),
    row = math.floor(0.12 * window_height),
    col = math.floor(0.15 * window_width),
  }
end

vim.keymap.set('n', '<leader>n', function()
  require('global-note').toggle_note 'project_local'
end, {
  desc = 'Toggle project note',
})

return {
  'backdround/global-note.nvim',
  config = function()
    require('global-note').setup {
      title = ' Notes 📓',
      window_config = get_window_config(),
      additional_presets = {
        project_local = {
          command_name = 'ProjectNote',
          filename = util.get_parent_project_name() .. '.md',
          title = ' Project Notes 📓 ',
        },
      },
    }
  end,
}
