local icons = require 'art.ui.icons'.ui

return {
  attach_to_untracked = true,
  current_line_blame = true,
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'right_align',
    delay = 500,
    ignore_whitespace = false,
  },
  linehl					= false,
  max_file_length = 40000,
  numhl						= true,
  preview_config = {
    border		= 'single',
    style			= 'minimal',
    relative	= 'cursor',
    row				= 0,
    col				= 1
  },
  signcolumn = true,
  signs = {
    add          = { text = icons.BoldLineLeft },
    change       = { text = icons.BoldLineLeft },
    delete       = { text = icons.Triangle },
    topdelete    = { text = icons.Triangle },
    changedelete = { text = icons.BoldLineLeft },
  },
  sign_priority	= 6,
  status_formatter = nil,
  update_debounce = 100,
  watch_gitdir = {
    interval = 1000,
    follow_files = true
  },
  word_diff  = false,
  yadm = {
    enable = false
  },
}
