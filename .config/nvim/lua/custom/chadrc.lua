local userPlugins = require 'custom.plugins'

local M = {}

M.ui = {theme = "chadracula"}

M.plugins = {
    default_plugin_config_replace = {
        nvim_treesitter = {ensure_installed = "maintained"}
    },
    options = {lspconfig = {setup_lspconf = "custom.plugins.lspconfig"}},
    install = userPlugins
}
return M
