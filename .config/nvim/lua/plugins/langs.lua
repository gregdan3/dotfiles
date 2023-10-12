return {
	-- {
	-- 	"iamcco/markdown-preview.nvim",
	-- 	-- event = "BufEnter",
	-- 	ft = { "md", "markdown" },
	-- 	cmd = { "MarkdownPreview" },
	-- 	config = function()
	-- 		vim.fn["mkdp#util#install"]()
	-- 	end,
	-- },
	{
		"edgedb/edgedb-vim",
		event = "BufEnter",
		ft = { "esdl", "edgeql" },
	},
}
