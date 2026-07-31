vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.editorconfig = false

-- Disable legacy PHP scripts to force our custom indentation/treesitter
vim.g.loaded_php_syntax = 1
vim.g.did_indent_php = 1

-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.o.guifont = "JetBrains Mono:h14"
vim.opt.swapfile = false
vim.opt.relativenumber = true
vim.opt.number = true -- Also show absolute line number for the current line
vim.opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
vim.opt.timeoutlen = 300
vim.opt.termguicolors = true -- True color support
vim.opt.mouse = "a" -- Enable mouse support
vim.opt.clipboard = "unnamedplus" -- Sync with system clipboard
vim.opt.ignorecase = true -- Ignore case in search patterns
vim.opt.smartcase = true -- Don't ignore case with capitals
vim.opt.wrap = false
vim.opt.sidescrolloff = 8
vim.opt.scrolloff = 4 -- Minimal number of screen lines to keep above and below the cursor
vim.opt.laststatus = 3 -- Global statusline
vim.opt.cmdheight = 0 -- Hide command line when not in use
vim.opt.showmode = false -- Hide mode indicator (since lualine shows it)
vim.opt.pumheight = 10 -- Maximum number of items to show in the popup menu
vim.opt.conceallevel = 2 -- Hide * markup for bold and italic, but not markers with substitutions
vim.opt.updatetime = 200 -- Save swap file and trigger CursorHold
vim.opt.splitright = true -- Put new windows to the right of the current one
vim.opt.splitbelow = true -- Put new windows below the current one
vim.opt.inccommand = "nosplit" -- preview incremental substitute
vim.opt.cursorline = true -- Enable highlighting of the current line

-- Folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99

-- Custom fold text to show function/class name
_G.custom_foldtext = function()
  local start_line = vim.v.foldstart
  local end_line = vim.v.foldend
  local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)

  local line_to_show = ""
  local keywords = { "function%s+", "fn%s+", "func%s+", "def%s+", "class%s+", "interface%s+", "enum%s+" }

  -- 1. Try to find a line with a keyword
  for _, line in ipairs(lines) do
    local clean_line = vim.trim(line)
    for _, pattern in ipairs(keywords) do
      if clean_line:match(pattern) then
        line_to_show = line
        break
      end
    end
    if line_to_show ~= "" then
      break
    end
  end

  -- 2. Fallback to first non-blank, non-comment line
  if line_to_show == "" then
    for _, line in ipairs(lines) do
      local clean_line = vim.trim(line)
      if
        clean_line ~= ""
        and not clean_line:match("^%-%-")
        and not clean_line:match("^//")
        and not clean_line:match("^/%*")
        and not clean_line:match("^%*")
      then
        line_to_show = line
        break
      end
    end
  end

  -- 3. Absolute fallback to first line of the fold
  if line_to_show == "" then
    line_to_show = lines[1] or ""
  end

  local num_lines = end_line - start_line + 1
  local leading_whitespace = line_to_show:match("^(%s*)") or ""
  local clean_content = vim.trim(line_to_show)

  return leading_whitespace .. "󰁂  " .. clean_content .. "  (" .. num_lines .. " lines)"
end

vim.opt.foldtext = "v:lua.custom_foldtext()"

-- Indentation
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.shiftwidth = 2 -- Size of an indent
vim.opt.smartindent = true -- Insert indents automatically
vim.opt.tabstop = 2 -- Number of spaces tabs count for
vim.opt.softtabstop = 2 -- Number of spaces tabs count for in insert mode

-- Disable animations
vim.g.snacks_animate = false

if vim.g.neovide then
  vim.o.guifont = "JetBrainsMono Nerd Font:h14"
end

-- Diagnostic settings
local palette = {
  err = "#51202A",
  warn = "#3B3B1B",
  info = "#1F3342",
  hint = "#1E2E1E",
}

vim.api.nvim_set_hl(0, "DiagnosticErrorLine", { bg = palette.err, blend = 20 })
vim.api.nvim_set_hl(0, "DiagnosticWarnLine", { bg = palette.warn, blend = 15 })
vim.api.nvim_set_hl(0, "DiagnosticInfoLine", { bg = palette.info, blend = 10 })
vim.api.nvim_set_hl(0, "DiagnosticHintLine", { bg = palette.hint, blend = 10 })

vim.api.nvim_set_hl(0, "DapBreakpointSign", { fg = "#FF0000", bg = nil, bold = true })
vim.fn.sign_define("DapBreakpoint", {
  text = "●",
  texthl = "DapBreakpointSign",
  linehl = "",
  numhl = "",
})

local sev = vim.diagnostic.severity

vim.diagnostic.config({
  underline = true,
  severity_sort = true,
  update_in_insert = false,
  float = {
    border = "rounded",
    source = true,
  },
  signs = {
    text = {
      [sev.ERROR] = " ",
      [sev.WARN] = " ",
      [sev.INFO] = " ",
      [sev.HINT] = "󰌵 ",
    },
  },
  virtual_text = {
    spacing = 4,
    source = "if_many",
    prefix = "●",
  },
  -- NEW in 0.11 — dim whole line
  linehl = {
    [sev.ERROR] = "DiagnosticErrorLine",
    [sev.WARN] = "DiagnosticWarnLine",
    [sev.INFO] = "DiagnosticInfoLine",
    [sev.HINT] = "DiagnosticHintLine",
  },
})
