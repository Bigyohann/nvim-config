-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = LazyVim.safe_keymap_set

vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-j>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
vim.keymap.set("n", "<C-h>", "<cmd>:TmuxNavigateLeft<CR>")
vim.keymap.set("n", "<C-j>", "<cmd>:TmuxNavigateDown<CR>")
vim.keymap.set("n", "<C-k>", "<cmd>:TmuxNavigateUp<CR>")
vim.keymap.set("n", "<C-l>", "<cmd>:TmuxNavigateRight<CR>")
vim.keymap.set("n", "<C-z>", "nop")
vim.keymap.set("n","<leader>ff", "<cmd> FzfLua lsp_live_workspace_symbols<cr>")
vim.keymap.set("n","<leader><leader>", "<cmd> FzfLua files<cr>")
vim.keymap.set("n","<leader>fw", "<cmd> FzfLua live_grep<cr>")
vim.keymap.set("n","<leader>fb", "<cmd> FzfLua tabs<cr>")
-- resize windows
vim.keymap.set("n", "<A-Up>", "<cmd>:resize +2<CR>")
vim.keymap.set("n", "<A-Down>", "<cmd>:resize -2<CR>")
vim.keymap.set("n", "<A-Left>", "<cmd>:vertical resize -2<CR>")
vim.keymap.set("n", "<A-Right>", "<cmd>:vertical resize +2<CR>")

vim.keymap.set("n", "<leader>ba", "<cmd>:bufdo bd<CR>")
