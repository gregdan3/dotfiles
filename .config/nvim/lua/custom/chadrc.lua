local userPlugins = require "custom.plugins"

local M = {}

M.ui = { theme = "chadracula" }

M.plugins = {
   default_plugin_config_replace = {
      nvim_treesitter = {
         ensure_installed = {
            "bash",
            "c",
            "cmake",
            "comment",
            "cpp",
            "css",
            "cuda",
            "dockerfile",
            "fish",
            "html",
            "javascript",
            "json",
            "lua",
            "make",
            "python",
            "regex",
            "rust",
            "toml",
            "vim",
            "yaml",
         },
         sync_install = false,
         highlight = { enable = true, use_languagetree = true },
      },
   },
   options = { lspconfig = { setup_lspconf = "custom.plugins.lspconfig" } },
   install = userPlugins,
}
return M
