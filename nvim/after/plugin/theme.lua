function ColorMeUp(theme)
  theme = theme or 'kanagawa'

  if theme == 'gruvbox-material' then
    vim.cmd('set background=dark')
    vim.g.gruvbox_material_background = 'hard'
    vim.g.gruvbox_material_foreground = 'original'
    vim.g.gruvbox_material_enable_bold = 1
    vim.g.gruvbox_material_transparent_background = 1
    vim.g.gruvbox_material_better_performance = 1
  end

  vim.cmd.colorscheme(theme)
end

ColorMeUp()