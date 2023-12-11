return {
  'gelguy/wilder.nvim',
  lazy = false,
  config = function()
    local wilder = require('wilder')
    wilder.setup({ modes = { ':', '/', '?' } })
    wilder.set_option(
      "renderer",
      wilder.popupmenu_renderer(wilder.popupmenu_palette_theme {
        highlighter = wilder.basic_highlighter(),
        highlights = {
          accent = wilder.make_hl('WilderAccent', 'Pmenu', { { a = 1 }, { a = 1 }, { foreground = '#3a6bff' } }),
        },
        border = "rounded",
        max_height = "40%",
        max_width = "40%",
        min_height = 0,
        prompt_position = "top",
        reverse = 0,
        left = { " ", wilder.popupmenu_devicons() },
        right = { " ", wilder.popupmenu_scrollbar() },
        pumblend = 20,
      })
    )
  end,
}
