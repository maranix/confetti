local wezterm = require('wezterm')

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.font = wezterm.font('JetBrains Mono')
config.font_size = 16.0
config.color_scheme = 'rose-pine'

wezterm.on('gui-startup', function ()
    local tab, pane, window = mux.spawn_window({})
    window:gui_window():maximize()
end)

return config
