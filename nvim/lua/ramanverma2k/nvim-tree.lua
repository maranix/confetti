require('nvim-tree').setup{
  disable_netrw = true,
  reload_on_bufenter = true,

  renderer = {
    icons = {
      webdev_colors = false,
      show = {
        file = false,
        folder = false,
        folder_arrow = false,
      }
    }
  }
}
