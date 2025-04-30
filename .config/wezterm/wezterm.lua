local wezterm = require("wezterm")
local mux = wezterm.mux

local config = wezterm.config_builder()
local backgrounds = require("backgrounds")

function tab_title(tab_info)
	local title = tab_info.tab_title
	if title and #title > 0 then
		return title
	end
	return tab_info.active_pane.title
end

function generateRandomIndex(backgrounds)
	local len = #backgrounds
	if len == 0 then
		return 0
	end
	local index = math.floor(math.random(len))
	return index
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local title = tab_title(tab)
	title = wezterm.truncate_right(title, max_width - 2)
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

local bg_index = generateRandomIndex(backgrounds)
config.background = backgrounds[bg_index]

wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

return config
