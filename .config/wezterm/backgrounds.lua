local background = {
	{
		source = {
			File = { path = "~/2471393.gif", speed = 2 },
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
}
-- local background = {
-- 	{
-- 		source = {
-- 			File = {
-- 				path = "~/tumblr_n5tuyw0G8S1tah9pwo1_r1_640.gif",
-- 				speed = 2,
-- 			},
-- 		},
-- 	},
-- 	{
-- 		source = {
-- 			Gradient = {
-- 				colors = { "#111", "#282C34", "#111" },
-- 				orientation = { Linear = { angle = 0 } },
-- 			},
-- 		},
-- 		height = "100%",
-- 		width = "100%",
-- 		opacity = 0.93,
-- 	},
-- }

return background
