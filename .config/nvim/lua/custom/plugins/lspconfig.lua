local vim = vim
local M = {}

M.setup_lsp = function(attach, capabilities)
    local lspconfig = require "lspconfig"

    lspconfig.tsserver.setup {
        on_attach = function(client, bufnr)
            client.resolved_capabilities.document_formatting = false
            vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>fm",
                                        "<cmd>lua vim.lsp.buf.formatting()<CR>",
                                        {})
        end
    }

    -- lspservers with default config
    local servers = {
        "pyright", "bashls", "clangd", "sumneko_lua", "rust_analyzer", "html",
        "cssls", "dockerls", "emmet_ls", "eslint", "gopls", "gradle_ls",
        "java_language_server", "racket_langserver", "sqlls"
    }
    for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup {
            on_attach = attach,
            capabilities = capabilities,
            flags = {debounce_text_changes = 150}
        }
    end

end

return M
