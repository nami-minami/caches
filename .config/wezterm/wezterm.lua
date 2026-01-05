local wezterm = require 'wezterm';
local config = wezterm.config_builder();

return {
    color_scheme = 'Solarized Dark (Gogh)',
    use_ime = true,
    macos_forward_to_ime_modifier_mask = 'SHIFT|CTRL',
}
