local colors = require("tomorrow-min.colors")

local tomorrow_min = {
	normal = {
		a = { fg = colors.base.white, bg = colors.vscode.dark_blue, gui = "bold" },
	},
	insert = {
		a = { fg = colors.base.white, bg = colors.bright.green, gui = "bold" },
	},
	visual = {
		a = { fg = colors.base.white, bg = colors.bright.orange, gui = "bold" },
	},
	command = {
		a = { fg = colors.base.white, bg = colors.bright.purple, gui = "bold" },
	},
	inactive = {
		a = { fg = colors.base.white, bg = colors.base.comment, gui = "bold" },
	},
	replace = {
		a = { fg = colors.base.white, bg = colors.bright.red, gui = "bold" },
	},
}
return tomorrow_min
