return {
  -- { "rebelot/kanagawa.nvim" },
  { "ellisonleao/gruvbox.nvim", opts = { contrast = "hard" } },
  { "LazyVim/LazyVim", opts = { colorscheme = "gruvbox" } },
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        preset = "super-tab",
        ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
        ["<CR>"] = { "select_and_accept", "fallback" },
        ["<LF>"] = { "select_and_accept", "fallback" },
        ["<S-CR>"] = {},
      },
    },
  },
}
