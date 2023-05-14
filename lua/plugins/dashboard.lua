local db = require("dashboard")

db.setup({
	theme = "doom",
	config = {
		header = {
			[[]],
			[[]],
			[[]],
			[[]],
			[[]],
			[[]],
			[[]],
			[[]],
			[[]],
			[[]],
			[[]],
		}, --your header
		center = {
			{
				icon = "    📝  ",
				desc = "Projects                             ",
				action = "Telescope projects",
				key = "z",
			},
			{
				icon = "    📅  ",
				desc = "Recently files                       ",
				action = "Telescope oldfiles",
				key = "x",
			},
			{
				icon = "    ⚙️   ",
				desc = "Edit Projects                        ",
				action = "edit" .. vim.fn.stdpath("data") .. "/project_nvim/project_history",
				key = "c",
			},
			{
				icon = "    ⌨️   ",
				desc = "Edit keybindings                     ",
				action = "edit" .. vim.fn.stdpath("config") .. "/lua/keymaps.lua",
				key = "v",
			},
		},
		footer = {
			"",
			"🚀 powered by neovim 🚀",
		}, --your footer
	},
})
