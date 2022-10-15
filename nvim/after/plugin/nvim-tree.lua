require('nvim-tree').setup({
  open_on_setup = true,
  disable_netrw = true,
  sort_by = 'case-sensitive',
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
    icons = {
      webdev_colors = false,
      show = {
            file = false,
            folder = false,
            folder_arrow = false,
            git = true,
        },
    },
  },
  filters = {
    dotfiles = true,
    custom = {
      '^.git$',
      'node_modules'
    }
  },
})
