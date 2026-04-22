-- PHP Indentation configuration (Modern Neovim 0.12 way)
-- Using cindent with custom cinoptions as requested.

local set = vim.opt_local

-- Indentation settings
set.shiftwidth = 4
set.tabstop = 4
set.softtabstop = 4
set.autoindent = true
set.smartindent = false
set.cindent = true
set.indentexpr = ""

vim.opt_local.indentkeys:remove("0#")
vim.opt_local.cinkeys:remove("0#")

set.cinoptions = "{0,(s,W4,m1,J1,f0,t0,i0,+0"
