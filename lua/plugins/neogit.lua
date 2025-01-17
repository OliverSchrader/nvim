return {
  'NeogitOrg/neogit',
  dependencies = {
    'sindrets/diffview.nvim',
    'ibhagwan/fzf-lua',
  },
  opts = {
    disable_hint = true,
    disable_context_highlighting = true,
    disable_signs = true,
    kind = 'tab',
    remember_settings = false,
    use_per_project_settings = false,
    fetch_after_checkout = true,
    process_spinner = false,
    commit_editor = {
      kind = 'tab',
      show_staged_diff = false,
    },
    sections = {
      recent = {
        folded = false,
      },
    },
  },
}
