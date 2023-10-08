-- Pull in the wezterm API
local wezterm = require 'wezterm'
local mux = wezterm.mux
local act = wezterm.action

-- This table will hold the configuration.
local config = {}

wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

return {
  default_prog = { '/usr/bin/bash' },
  window_decorations = "RESIZE",
  color_scheme = "Gruvbox Material (Gogh)",
  font = wezterm.font_with_fallback({
    "JetBrains Mono",
    { family = "Symbols Nerd Font Mono", scale = 0.75 }
  }),
  use_cap_height_to_scale_fallback_fonts = true,
  font_size = 15,
  scrollback_lines = 5000,
  hide_tab_bar_if_only_one_tab = true,
  audible_bell = "Disabled",
  exit_behavior = "Close",
  window_background_opacity = 0.85,
  keys = {
    {
      key = 'l',
      mods = 'ALT',
      action = wezterm.action.SplitPane {
        direction = 'Right',
        size = { Percent = 50 },
      },
    },
    {
      key = 'j',
      mods = 'ALT',
      action = wezterm.action.SplitPane {
        direction = 'Down',
        size = { Percent = 50 },
      },
    },
    {
      key = 'h',
      mods = 'ALT',
      action = wezterm.action.SplitPane {
        direction = 'Left',
        size = { Percent = 50 },
      },
    },
    {
      key = 'k',
      mods = 'ALT',
      action = wezterm.action.SplitPane {
        direction = 'Up',
        size = { Percent = 50 },
      },
    },
    {
      key = 'w',
      mods = 'ALT',
      action = wezterm.action.CloseCurrentPane { confirm = false },
    },
    {
      key = 'l',
      mods = 'CTRL',
      action = wezterm.action.ActivatePaneDirection 'Next',
    },
    {
      key = 'l',
      mods = 'CTRL|SHIFT',
      action = wezterm.action.ActivatePaneDirection 'Prev',
    },
  },
}