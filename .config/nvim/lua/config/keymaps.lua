-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- command on ; instead of :
vim.keymap.set({ "n", "v" }, ";", ":", { remap = true })

-- clear highlight on newline
vim.keymap.set({ "n" }, "<CR>", ":noh<CR><CR>", { silent = true })

-- disable arrow keys
vim.keymap.set({ "n", "i" }, "<Up>", "<NOP>", { silent = true })
vim.keymap.set({ "n", "i" }, "<Down>", "<NOP>", { silent = true })
vim.keymap.set({ "n", "i" }, "<Left>", "<NOP>", { silent = true })
vim.keymap.set({ "n", "i" }, "<Right>", "<NOP>", { silent = true })

-- disable help menu
vim.keymap.set({ "n", "v", "i" }, "<F1>", "<NOP>", { silent = true })

-- fast escape insert
vim.keymap.set({ "i" }, "jj", "<ESC>", { silent = true })
vim.keymap.set({ "i" }, "kj", "<ESC>", { silent = true })
vim.keymap.set({ "i" }, "jk", "<ESC>", { silent = true })
