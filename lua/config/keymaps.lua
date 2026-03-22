-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = LazyVim.safe_keymap_set


vim.g.copilot_no_tab_map = true


-- vim.keymap.set("n", "<C-h>", "<cmd>:TmuxNavigateLeft<CR>")
-- vim.keymap.set("n", "<C-j>", "<cmd>:TmuxNavigateDown<CR>")
-- vim.keymap.set("n", "<C-k>", "<cmd>:TmuxNavigateUp<CR>")
-- vim.keymap.set("n", "<C-l>", "<cmd>:TmuxNavigateRight<CR>")
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

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", "\"_d")

vim.keymap.set("x", "p", [["_dP]])
-- 1. Le sélecteur de projet principal (Fuzzy finder)
-- Ouvre une popup tmux avec le moteur de recherche de tms
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux display-popup -E tms<CR>")

-- 2. Switcher entre les sessions ACTIVES
-- Très utile pour sauter rapidement entre les projets déjà ouverts
vim.keymap.set("n", "<leader>ta", "<cmd>silent !tmux display-popup -E 'tms switch'<CR>", { desc = "Switch sessions actives" })

-- 3. Lister les fenêtres de la session actuelle
-- Si tu as beaucoup de fenêtres dans une session, c'est un fzf pour tes windows
vim.keymap.set("n", "<leader>tw", "<cmd>silent !tmux display-popup -E 'tms windows'<CR>", { desc = "Switch windows" })

-- 4. Renommer la session actuelle proprement
-- tms rename synchronise le nom de la session avec le dossier
vim.keymap.set("n", "<leader>tr", ":!tms rename ", { desc = "Rename session" })

-- 5. "Refresh" (Générer des fenêtres pour les git worktrees)
-- Une des forces de ce binaire Rust : il détecte tes worktrees
vim.keymap.set("n", "<leader>tg", "<cmd>silent !tms refresh<CR>", { desc = "Refresh worktrees" })

-- close session
vim.keymap.set("n", "<leader>tc", "<cmd>silent !tms kill<CR>", { desc = "Close session" })
