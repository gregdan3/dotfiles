return {
   {
      "echasnovski/mini.nvim",
      after = "nvim-web-devicons",
      config = function()
         require("mini.sessions").setup()
         require("mini.surround").setup()
         require("mini.trailspace").setup()
      end,
   },
   -- {
   --     'williamboman/nvim-lsp-installer',
   --     after = 'nvim-lspconfig',
   --     config = function()
   --         require('nvim-lsp-installer').on_server_ready(function(server)
   --             local opts = {}
   --             server:setup(opts)
   --         end)
   --     end
   -- },
   {
      "jose-elias-alvarez/null-ls.nvim",
      after = "nvim-lspconfig",
      config = function()
         local null_ls = require "null-ls"
         null_ls.setup {
            sources = {
               null_ls.builtins.formatting.black,
               null_ls.builtins.formatting.clang_format,
               null_ls.builtins.formatting.eslint_d,
               null_ls.builtins.formatting.fish_indent,
               null_ls.builtins.formatting.gofumpt,
               null_ls.builtins.formatting.goimports,
               null_ls.builtins.formatting.google_java_format,
               null_ls.builtins.formatting.isort,
               null_ls.builtins.formatting.latexindent,
               null_ls.builtins.formatting.pg_format,
               null_ls.builtins.formatting.prettierd,
               null_ls.builtins.formatting.rustfmt,
               null_ls.builtins.formatting.shellharden,
               null_ls.builtins.formatting.shfmt,
               null_ls.builtins.formatting.sqlformat,
               null_ls.builtins.formatting.stylelint,
               null_ls.builtins.formatting.stylua,

               null_ls.builtins.diagnostics.checkmake,
               null_ls.builtins.diagnostics.chktex,
               null_ls.builtins.diagnostics.hadolint,

               null_ls.builtins.completion.spell,
            },
            on_attach = function(client)
               if client.resolved_capabilities.document_formatting then
                  vim.cmd [[
                      augroup LspFormatting
                          autocmd! * <buffer>
                          autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
                      augroup END
                    ]]
               end
            end,
         }
      end,
   },
   { "hrsh7th/cmp-cmdline", after = "cmp-path" },
   {
      "ggandor/lightspeed.nvim",
      event = "BufEnter",
      config = function()
         require "lightspeed"
      end,
   },
   {
      "ahmedkhalf/project.nvim",
      config = function()
         require("project_nvim").setup()
      end,
   },
   {
      "iamcco/markdown-preview.nvim",
      run = "cd app && yarn install",
      cmd = "MarkdownPreview",
   },
}
