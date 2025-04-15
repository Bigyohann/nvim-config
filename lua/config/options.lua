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

vim.diagnostic.config({
  underline = true,
  update_in_insert = false,
  virtual_text = {
    spacing = 4,
    source = "if_many",
    prefix = "●",
    -- this will set set the prefix to a function that returns the diagnostics icon based on the severity
    -- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
    -- prefix = "icons",
  },
  severity_sort = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = LazyVim.config.icons.diagnostics.Error,
      [vim.diagnostic.severity.WARN] = LazyVim.config.icons.diagnostics.Warn,
      [vim.diagnostic.severity.HINT] = LazyVim.config.icons.diagnostics.Hint,
      [vim.diagnostic.severity.INFO] = LazyVim.config.icons.diagnostics.Info,
    },
  },
})

-- Disable autoformat for lua files
