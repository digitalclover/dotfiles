local bg_dir = "/home/digclo/Pictures/Terminal Background/"
local backgrounds = {
	{
		{
			source = {
				Gradient = {
					colors = { "#24283b", "#1a1b26" },
					orientation = { Radial = { cx = 0.5, cy = 0.5, radius = 0.95 } },
				},
			},
			height = "100%",
			width = "100%",
			opacity = 1,
		},
	},
	{
		{
			source = {
				File = { path = bg_dir .. "2471393.gif", speed = 2 },
			},
		},
		{
			source = {
				Gradient = {
					colors = { "#999", "#0f0c29" },
					orientation = { Radial = { cx = 0.88, cy = 0.16, radius = 0.15 } },
				},
			},
			height = "100%",
			width = "100%",
			opacity = 0.75,
		},
		{
			source = {
				Gradient = {
					colors = { "#361111", "#0f0c29" },
					orientation = { Radial = { cx = 0.41, cy = 0.9, radius = 0.15 } },
				},
			},
			height = "100%",
			width = "100%",
			opacity = 0.75,
		},
	},
	{
		{
			source = {
				File = {
					path = bg_dir .. "tumblr_n5tuyw0G8S1tah9pwo1_r1_640.gif",
					speed = 2,
				},
			},
		},
		{
			source = {
				Gradient = {
					colors = { "#111", "#282C34", "#111" },
					orientation = { Linear = { angle = 0 } },
				},
			},
			height = "100%",
			width = "100%",
			opacity = 0.93,
		},
	},
	{
		{
			source = {
				File = {
					path = bg_dir .. "twin_wp_both.jpg",
				},
			},
			vertical_offset = "-20%",
		},
		{
			source = {
				Gradient = {
					colors = { "#24283b", "#1a1b26" },
					orientation = { Radial = { cx = 0.5, cy = 0.5, radius = 0.95 } },
				},
			},
			height = "100%",
			width = "100%",
			opacity = 0.95,
		},
	},
	{
		{
			source = {
				File = {
					path = bg_dir .. "Ggu0-ftWQAAZTpv.jpeg",
				},
			},
			vertical_offset = "-100%",
		},
		{
			source = {
				Gradient = {
					colors = { "#24283b", "#1a1b26" },
					orientation = { Radial = { cx = 0.5, cy = 0.5, radius = 0.95 } },
				},
			},
			height = "100%",
			width = "100%",
			opacity = 0.95,
		},
	},
}

return backgrounds
