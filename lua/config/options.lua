-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.o.guifont = "JetBrains Mono:h14"
vim.opt.swapfile = false
vim.opt.relativenumber = true

-- Disable animations
vim.g.snacks_animate = false


if vim.g.neovide then
  vim.o.guifont = "JetBrainsMono Nerd Font:h14"
end
-- Disable autoformat for lua files
