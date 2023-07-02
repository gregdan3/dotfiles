local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
	spec = {
		-- import LazyVim plugins
		{ "LazyVim/LazyVim", import = "lazyvim.plugins" },
		-- import/override with your plugins
		{ import = "plugins" },

		-- import any extras modules here
		-- { import = "lazyvim.plugins.extras.lang.typescript" },
		-- { import = "lazyvim.plugins.extras.lang.json" },
		-- 	{
		-- 		import = "lazyvim.plugins.extras.ui.mini-animate",
		-- 		opts = function()
		-- 			local animate = require("mini.animate")
		-- 			return {
		-- 				resize = { timing = animate.gen_timing.linear({ duration = 50, unit = "total" }) },
		-- 				scroll = { timing = animate.gen_timing.linear({ duration = 75, unit = "total" }) },
		-- 			}
		-- 		end,
		-- 		config = function(_, opts)
		-- 			require("mini.animate").setup(opts)
		-- 		end,
		-- 	},
	},
	defaults = {
		lazy = true, -- every plugin is lazy-loaded by default
		version = false,
	},
	install = { colorscheme = { "tokyonight" } },
	checker = { enabled = true }, -- automatically check for plugin updates
	performance = {
		rtp = {
			-- disable some rtp plugins
			disabled_plugins = {
				"gzip",
				-- "matchit",
				-- "matchparen",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})
