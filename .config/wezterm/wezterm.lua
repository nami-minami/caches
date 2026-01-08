local wezterm = require 'wezterm';
local config = wezterm.config_builder();

config.color_scheme = 'Solarized Dark (Gogh)';
config.use_ime = true;
config.macos_forward_to_ime_modifier_mask = 'SHIFT|CTRL';
config.font_size = 10.0;
config.window_decorations = 'RESIZE';

return config;

