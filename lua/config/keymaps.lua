local map = vim.keymap.set

-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.g.copilot_no_tab_map = true

-- Original Keymaps
map("n", "<C-z>", "nop", { desc = "Disable suspend" })
map({ "n", "i", "v" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

map("n", "<leader>md", '$F"ci"@datetime@<Esc>', { desc = "Insert datetime" })
map("n", "<leader>mt", '$F"ci"@date@<Esc>', { desc = "Insert date" })
map("n", "<leader>ms", '$F"ci"@string@<Esc>', { desc = "Insert string" })

-- resize windows
-- windows
map("n", "<leader>ww", "<C-W>p", { desc = "Other window", remap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete window", remap = true })
map("n", "<leader>w-", "<C-W>s", { desc = "Split window below", remap = true })
map("n", "<leader>w|", "<C-W>v", { desc = "Split window right", remap = true })
map("n", "<leader>-", "<C-W>s", { desc = "Split window below", remap = true })
map("n", "<leader>|", "<C-W>v", { desc = "Split window right", remap = true })

map("n", "<leader>q", "<cmd>qa<CR>", { desc = "Quit all" })
map("n", "<leader>qq", "<cmd>qa<CR>", { desc = "Quit all" })
map("n", "<leader>ba", "<cmd>bufdo bd<CR>", { desc = "Delete all buffers" })
map("n", "<leader>bd", "<cmd>bd<CR>", { desc = "Delete buffer" })
map("n", "<leader>rn", ":IncRename ", { desc = "Incremental rename" })

-- LSP / LSP set keybinds
map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
map("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename" })
map("n", "<leader>ra", vim.lsp.buf.rename, { desc = "Rename" })
map("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
map("n", "gK", vim.lsp.buf.signature_help, { desc = "Signature Help" })
map("i", "<c-k>", vim.lsp.buf.signature_help, { desc = "Signature Help" })
map("n", "<leader>cl", "<cmd>LspInfo<cr>", { desc = "Lsp Info" })
map("n", "<leader>ro", "<cmd>LspRestart<CR>", { desc = "Restart LSP" })

-- Yank / Paste
map({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
map("n", "<leader>Y", [["+Y]], { desc = "Yank line to system clipboard" })
map({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without yanking" })
map("x", "p", [["_dP]], { desc = "Paste without yanking" })

-- Tmux / TMS Integration
map("n", "<C-f>", "<cmd>silent !tmux display-popup -E tms<CR>", { desc = "TMS Search Sessions" })
map("n", "<leader>ta", "<cmd>silent !tmux display-popup -E 'tms switch'<CR>", { desc = "Switch sessions actives" })
map("n", "<leader>tw", "<cmd>silent !tmux display-popup -E 'tms windows'<CR>", { desc = "Switch windows" })
map("n", "<leader>tr", ":!tms rename ", { desc = "Rename session" })
map("n", "<leader>tg", "<cmd>silent !tms refresh<CR>", { desc = "Refresh worktrees" })
map("n", "<leader>tc", "<cmd>silent !tms kill<CR>", { desc = "Close session" })

-- New Modern Diagnostic keymaps
local diagnostic_goto = function(next, severity)
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    vim.diagnostic.jump({ count = next and 1 or -1, float = true, severity = severity })
  end
end

map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
map("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
map("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
map("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
map("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
map("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
map("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })
