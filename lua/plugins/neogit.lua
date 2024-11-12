return {
  'NeogitOrg/neogit',
  dependencies = {
    'sindrets/diffview.nvim',
    'ibhagwan/fzf-lua',
  },
  opts = {
    disable_hint = true,
    kind = 'replace',
    fetch_after_checkout = true,
    process_spinner = false,
    commit_editor = {
      kind = 'vsplit',
    },
    sections = {
      recent = {
        folded = false,
      },
    },
  },
}
