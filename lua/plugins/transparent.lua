return {
  'xiyaowong/transparent.nvim',
  config = function()
    require('transparent').setup {
      extra_groups = {
        -- General
        'NormalFloat',

        -- Lualine
        'lualine_a_normal',
        'lualine_a_insert',
        'lualine_a_visual',
        'lualine_a_replace',
        'lualine_a_command',
        'lualine_a_inactive',

        'lualine_b_normal',
        'lualine_b_visual',
        'lualine_b_replace',
        'lualine_b_command',
        'lualine_b_inactive',

        'lualine_c_normal',
        'lualine_c_insert',
        'lualine_c_visual',
        'lualine_c_replace',
        'lualine_c_command',
        'lualine_c_inactive',

        'lualine_x_normal',
        'lualine_x_insert',
        'lualine_x_visual',
        'lualine_x_replace',
        'lualine_x_command',
        'lualine_x_inactive',

        'lualine_x_diagnostics_error_normal',
        'lualine_x_diagnostics_error_insert',
        'lualine_x_diagnostics_error_visual',
        'lualine_x_diagnostics_error_replace',
        'lualine_x_diagnostics_error_command',
        'lualine_x_diagnostics_error_inactive',

        'lualine_x_diagnostics_warn_normal',
        'lualine_x_diagnostics_warn_insert',
        'lualine_x_diagnostics_warn_visual',
        'lualine_x_diagnostics_warn_replace',
        'lualine_x_diagnostics_warn_command',
        'lualine_x_diagnostics_warn_inactive',

        'lualine_x_diagnostics_info_normal',
        'lualine_x_diagnostics_info_insert',
        'lualine_x_diagnostics_info_visual',
        'lualine_x_diagnostics_info_replace',
        'lualine_x_diagnostics_info_command',
        'lualine_x_diagnostics_info_inactive',

        'lualine_x_diagnostics_hint_normal',
        'lualine_x_diagnostics_hint_insert',
        'lualine_x_diagnostics_hint_visual',
        'lualine_x_diagnostics_hint_replace',
        'lualine_x_diagnostics_hint_command',
        'lualine_x_diagnostics_hint_inactive',

        'lualine_y_normal',
        'lualine_y_insert',
        'lualine_y_visual',
        'lualine_y_replace',
        'lualine_y_command',
        'lualine_y_inactive',
        'lualine_y_diff',

        'lualine_y_diff_added_normal',
        'lualine_y_diff_added_insert',
        'lualine_y_diff_added_visual',
        'lualine_y_diff_added_replace',
        'lualine_y_diff_added_command',
        'lualine_y_diff_added_inactive',

        'lualine_y_diff_modified_normal',
        'lualine_y_diff_modified_insert',
        'lualine_y_diff_modified_visual',
        'lualine_y_diff_modified_replace',
        'lualine_y_diff_modified_command',
        'lualine_y_diff_modified_inactive',

        'lualine_y_diff_removed_normal',
        'lualine_y_diff_removed_insert',
        'lualine_y_diff_removed_visual',
        'lualine_y_diff_removed_replace',
        'lualine_y_diff_removed_command',
        'lualine_y_diff_removed_inactive',

        'lualine_z_normal',
        'lualine_z_insert',
        'lualine_z_visual',
        'lualine_z_replace',
        'lualine_z_command',
        'lualine_z_inactive',
      },
    }
  end,
}
