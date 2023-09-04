return {
  'lukas-reineke/indent-blankline.nvim',
  config = function()
    require("indent_blankline").setup {
      char = "│",
      show_trailing_blankline_indent = false,
      show_first_indent_level = true,
      char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
        "IndentBlanklineIndent7",
      }
    }
  end
}
