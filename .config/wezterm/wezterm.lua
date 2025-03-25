local wezterm = require("wezterm")
-- local background = require("backgrounds")
local mux = wezterm.mux

local config = wezterm.config_builder()

local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider

function tab_title(tab_info)
	local title = tab_info.tab_title
	if title and #title > 0 then
		return title
	end
	return tab_info.active_pane.title
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local edge_background = "#1a1b26"
	local background = "#24283b"
	local foreground = "#565f89"

	if tab.is_active then
		background = "#1a1b26"
		foreground = "#a9b1d6"
	end

	local edge_foreground = background

	local title = tab_title(tab)

	title = wezterm.truncate_right(title, max_width - 2)

	return {
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = SOLID_LEFT_ARROW },
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = title },
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = SOLID_RIGHT_ARROW },
	}
end)

config.enable_wayland = false
config.show_close_tab_button_in_tabs = false
config.use_fancy_tab_bar = false
config.show_new_tab_button_in_tab_bar = false
config.tab_max_width = 24
config.colors = {
	tab_bar = {
		background = "#1a1b26",
	},
}

config.color_scheme = "tokyonight_moon"
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

config.background = background
wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

return config
