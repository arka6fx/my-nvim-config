-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("i", "jk", "<ESC>", { noremap = true, silent = true })
vim.keymap.set("i", "kj", "<ESC>", { noremap = true, silent = true })
-- Paste without losing original clipboard content
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set("n", "<leader>io", ":!feh %:S<CR>", { desc = "Open image in feh" })
