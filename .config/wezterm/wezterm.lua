local wezterm = require 'wezterm';
local config = wezterm.config_builder();

config.color_scheme = 'Solarized Dark (Gogh)';
config.use_ime = true;
config.font_size = 10.0;
config.window_decorations = 'RESIZE';

return config;

