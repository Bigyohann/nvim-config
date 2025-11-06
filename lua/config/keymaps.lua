-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = LazyVim.safe_keymap_set


vim.g.copilot_no_tab_map = true


vim.keymap.set("n", "<C-h>", "<cmd>:TmuxNavigateLeft<CR>")
vim.keymap.set("n", "<C-j>", "<cmd>:TmuxNavigateDown<CR>")
vim.keymap.set("n", "<C-k>", "<cmd>:TmuxNavigateUp<CR>")
vim.keymap.set("n", "<C-l>", "<cmd>:TmuxNavigateRight<CR>")
vim.keymap.set("n", "<C-z>", "nop")

vim.keymap.set("n", "<leader>md", '$F"ci"@datetime@<Esc>')
vim.keymap.set("n", "<leader>mt", '$F"ci"@date@<Esc>')
vim.keymap.set("n", "<leader>ms", '$F"ci"@string@<Esc>')

-- resize windows
vim.keymap.set("n", "<A-Up>", "<cmd>:resize +2<CR>")
vim.keymap.set("n", "<A-Down>", "<cmd>:resize -2<CR>")
vim.keymap.set("n", "<A-Left>", "<cmd>:vertical resize -2<CR>")
vim.keymap.set("n", "<A-Right>", "<cmd>:vertical resize +2<CR>")

vim.keymap.set("n", "<leader>ba", "<cmd>:bufdo bd<CR>")
vim.keymap.set("n", "<leader>rn", ":IncRename ")

-- set keybinds

vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action) -- see available code actions, in visual mode will apply to selection
vim.keymap.set("n", "<leader>ra", vim.lsp.buf.rename) -- smart rename
vim.keymap.set("n", "K", vim.lsp.buf.hover) -- show documentation for what is under cursor
vim.keymap.set("n", "<leader>ro", ":LspRestart<CR>") -- mapping to restart lsp if necessary
