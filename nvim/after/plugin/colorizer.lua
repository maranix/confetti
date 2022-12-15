local colorizer = require('colorizer')

colorizer.setup({
  filetypes = {
    '*';
    css = {
      rbg_fn = true,
      hsl_fn = true,
    }
  }
})
