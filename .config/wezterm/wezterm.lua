local wezterm = require("wezterm")
local mux = wezterm.mux

local config = wezterm.config_builder()

function tab_title(tab_info)
	local title = tab_info.tab_title
	if title and #title > 0 then
		return title
	end
	return tab_info.active_pane.title
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local title = tab_title(tab)
	title = wezterm.truncate_right(title, max_width - 2)
end)

config.enable_wayland = true
config.use_fancy_tab_bar = false
config.show_new_tab_button_in_tab_bar = false
config.tab_max_width = 64
config.colors = {
	tab_bar = {
		background = "#1a1b26",
	},
}

config.window_padding = {
	bottom = 0,
}
-- config.color_scheme = "tokyonight_moon"
config.color_scheme = 'Gruvbox Material (Gogh)'
config.font = wezterm.font("SauceCodePro Nerd Font")
config.use_ime = true
if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	config.wsl_domains = {
		{
			name = "Debian",
			distribution = "Debian",
			default_cwd = "~",
		},
	}
	config.default_domain = "Debian"
end

config.window_background_opacity = 0.95

wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

return config
