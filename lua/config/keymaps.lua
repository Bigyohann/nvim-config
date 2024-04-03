-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = LazyVim.safe_keymap_set

map("n", "<leader>fr", "<cmd> Telescope lsp_dynamic_workspace_symbols <cr>", { desc = "Find Workspace symbols" })
map("n", "<leader>ff", "<cmd> Telescope find_files <cr>", { desc = "Find files" })
map("n", "<leader>fw", "<cmd> Telescope live_grep<cr>", { desc = "Find grep" })
map("n", "<leader>fb", "<cmd> Telescope buffers <cr>", { desc = "Find buffers" })
