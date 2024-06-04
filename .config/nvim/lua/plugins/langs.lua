return {
	{
		"edgedb/edgedb-vim",
		event = "BufEnter",
		ft = { "esdl", "edgeql" },
	},
	{
		"epwalsh/obsidian.nvim",
		ft = "markdown",
		event = "BufReadPre",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			workspaces = {
				{ name = "personal", path = "~/vaults/personal/" },
			},
			notes_subdir = "scraps",
			daily_notes = {
				folder = "journal",
				template = nil,
			},
			templates = {
				subdir = "templates",
				date_format = "%Y-%m-%d",
				time_format = "%H:%M",
			},
			wiki_link_func = "prepend_note_id",
		},
	},
}
