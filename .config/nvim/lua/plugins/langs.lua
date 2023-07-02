return {
	-- {
	-- 	"vimwiki/vimwiki",
	-- 	event = "BufEnter",
	-- 	ft = { "md" },
	-- 	init = function()
	-- 		vim.g.vimwiki_list = {
	-- 			{
	-- 				path = "~/notes/",
	-- 				syntax = "markdown",
	-- 				ext = ".md",
	-- 			},
	-- 		}
	-- 		vim.g.vimwiki_ext2syntax = {
	-- 			[".md"] = "markdown",
	-- 		}
	-- 	end,
	-- },
	{
		"edgedb/edgedb-vim",
		event = "BufEnter",
		ft = { "esdl", "edgeql" },
	},
	-- {
	-- 	"lervag/vimtex",
	-- 	event = "BufEnter",
	-- 	ft = { "tex", "latex" },
	-- 	config = function()
	-- 		vim.cmd([[let g:vimtex_view_method = 'zathura'
	--                let maplocalleader='\']])
	-- 	end,
	-- },
	{
		"iamcco/markdown-preview.nvim",
		event = "BufEnter",
		ft = { "md", "markdown" },
		config = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
}
