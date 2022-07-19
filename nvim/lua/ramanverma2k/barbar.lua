require'bufferline'.setup {
  -- Disable Icons
  icons = false,

  -- Configure icons on the bufferline.
  icon_close_tab = 'x',

  -- If true, new buffers will be inserted at the start/end of the list.
  -- Default is to insert after current buffer.
  insert_at_end = true,

  -- Enables/disable clickable tabs
  --  - left-click: go to buffer
  --  - middle-click: delete buffer
  clickable = true,
}
