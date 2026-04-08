-- Editor Categorized Plugins (Navigation, Keymaps, Workflow)

-- Step 1: Snacks.nvim (Core Utilities)
vim.pack.add({ { src = "https://github.com/folke/snacks.nvim" } })
local ok_snacks, snacks = pcall(require, "snacks")
if ok_snacks then
  snacks.setup({
    animate = { enabled = false },
    bigfile = {
      enabled = true,
      size = 1.5 * 1024 * 1024, -- 1.5MB
      notify = true,
      setup = function(ctx)
        vim.cmd([[NoMatchParen]])
        snacks.util.wo(0, {
          foldmethod = "manual",
          statuscolumn = "",
          conceallevel = 0,
        })
        vim.b.minianimate_disable = true
        vim.schedule(function()
          vim.bo[ctx.buf].syntax = ""
        end)
      end,
    },
    explorer = { enabled = true },
    input = { enabled = true },
    notifier = { enabled = true },
    scope = { enabled = true },
    indent = { enabled = true },
    scroll = { enabled = true },
    words = { enabled = true },
    image = {
      enabled = true,
      doc = {
        render = "wezterm",
      },
    },
    picker = {
      enabled = true,
      ui_select = true,
      matcher = {
        fuzzy = true,
        smartcase = true,
        icons = true,
        fzf = true,
      },
      layout = {
        preset = "default",
      },
      win = {
        input = {
          keys = {
            ["<tab>"] = "toggle_preview",
          },
        },
      },
    },
  })

  -- Common Snacks Mappings
  vim.keymap.set("n", "<leader>e", function()
    snacks.explorer()
  end, { desc = "Toggle Explorer" })
  vim.keymap.set("n", "<leader><space>", function()
    snacks.picker.files({
      exclude = { "vendor", "node_modules", ".git", "dist", "build", "target" },
    })
  end, { desc = "Find Files" })
  vim.keymap.set("n", "<leader>ff", function()
    snacks.picker.files()
  end, { desc = "Find Files" })
  vim.keymap.set("n", "<leader>fw", function()
    snacks.picker.grep()
  end, { desc = "Find Grep" })
  vim.keymap.set("n", "<leader>fb", function()
    snacks.picker.buffers()
  end, { desc = "Find Buffers" })
  vim.keymap.set("n", "<leader>fh", function()
    snacks.picker.help()
  end, { desc = "Help Tags" })
  vim.keymap.set("n", "<leader>fm", function()
    snacks.picker.marks()
  end, { desc = "Marks" })
  vim.keymap.set("n", "<leader>fr", function()
    snacks.picker.registers()
  end, { desc = "Registers" })
  vim.keymap.set("n", "<leader>u", function()
    snacks.picker.undo()
  end, { desc = "Undo History" })
  vim.keymap.set("n", "<leader>:", function()
    snacks.picker.command_history()
  end, { desc = "Command History" })

  -- Git Snacks Mappings
  vim.keymap.set("n", "<leader>gg", function()
    snacks.lazygit()
  end, { desc = "Lazygit" })
  vim.keymap.set("n", "<leader>gl", function()
    snacks.lazygit.log()
  end, { desc = "Lazygit Log" })
  vim.keymap.set("n", "<leader>gf", function()
    snacks.lazygit.log_file()
  end, { desc = "Lazygit Log File" })
  vim.keymap.set("n", "<leader>gb", function()
    snacks.git.blame_line()
  end, { desc = "Git Blame Line" })
  vim.keymap.set("n", "<leader>gB", function()
    snacks.gitbrowse()
  end, { desc = "Git Browse" })
  vim.keymap.set("n", "<leader>gs", function()
    snacks.picker.git_status()
  end, { desc = "Git Status" })

  -- LSP Snacks Mappings
  vim.keymap.set("n", "gd", function()
    snacks.picker.lsp_definitions()
  end, { desc = "Goto Definition" })
  vim.keymap.set("n", "gD", function()
    snacks.picker.lsp_declarations()
  end, { desc = "Goto Declaration" })
  vim.keymap.set("n", "gr", function()
    snacks.picker.lsp_references()
  end, { nowait = true, desc = "References" })
  vim.keymap.set("n", "gI", function()
    snacks.picker.lsp_implementations()
  end, { desc = "Goto Implementation" })
  vim.keymap.set("n", "gy", function()
    snacks.picker.lsp_type_definitions()
  end, { desc = "Goto T[y]pe Definition" })
  vim.keymap.set("n", "<leader>ss", function()
    snacks.picker.lsp_symbols()
  end, { desc = "LSP Symbols" })
  vim.keymap.set("n", "<leader>sS", function()
    snacks.picker.lsp_workspace_symbols()
  end, { desc = "LSP Workspace Symbols" })

  -- Diagnostics Snacks Mappings
  vim.keymap.set("n", "<leader>ld", function()
    snacks.picker.diagnostics()
  end, { desc = "LSP Diagnostics" })
  vim.keymap.set("n", "<leader>lD", function()
    snacks.picker.diagnostics_buffer()
  end, { desc = "LSP Buffer Diagnostics" })
end

-- Step 2: Which-Key
vim.pack.add({ { src = "https://github.com/folke/which-key.nvim" } })
local ok_wk, wk = pcall(require, "which-key")
if ok_wk then
  wk.setup({
    preset = "modern",
    delay = function(ctx)
      return ctx.plugin and 0 or 200
    end,
    icons = { breadcrumb = "»", separator = "➜", group = "+" },
    win = { border = "single" },
  })

  wk.add({
    { "<leader>f", group = "file/find" },
    { "<leader>g", group = "git" },
    { "<leader>gh", group = "hunks" },
    { "<leader>t", group = "tmux/session" },
    { "<leader>b", group = "buffer" },
    { "<leader>W", group = "window/swap" },
    { "<leader>m", group = "meta/date" },
    { "<leader>a", group = "ai/gemini" },
    { "<leader>s", group = "search" },
    { "<leader>c", group = "code" },
    { "<leader>l", group = "lsp/diagnostics" },
    { "<leader>x", group = "diagnostics/trouble" },
    { "g", group = "goto" },
  })
end

-- Step 3: Smart Splits & Tmux
vim.pack.add({
  { src = "https://github.com/mrjones2014/smart-splits.nvim" },
  { src = "https://github.com/christoomey/vim-tmux-navigator" },
})

local ok_ss, ss = pcall(require, "smart-splits")
if ok_ss then
  ss.setup({ multiplexer_integration = "wezterm" })

  vim.keymap.set("n", "<A-h>", ss.resize_left, { desc = "Resize left" })
  vim.keymap.set("n", "<A-j>", ss.resize_down, { desc = "Resize down" })
  vim.keymap.set("n", "<A-k>", ss.resize_up, { desc = "Resize up" })
  vim.keymap.set("n", "<A-l>", ss.resize_right, { desc = "Resize right" })
  vim.keymap.set("n", "<C-h>", ss.move_cursor_left, { desc = "Move to left split" })
  vim.keymap.set("n", "<C-j>", ss.move_cursor_down, { desc = "Move to bottom split" })
  vim.keymap.set("n", "<C-k>", ss.move_cursor_up, { desc = "Move to top split" })
  vim.keymap.set("n", "<C-l>", ss.move_cursor_right, { desc = "Move to right split" })
  vim.keymap.set("n", "<leader>Wh", ss.swap_buf_left, { desc = "Swap buffer left" })
  vim.keymap.set("n", "<leader>Wj", ss.swap_buf_down, { desc = "Swap buffer down" })
  vim.keymap.set("n", "<leader>Wk", ss.swap_buf_up, { desc = "Swap buffer up" })
  vim.keymap.set("n", "<leader>Wl", ss.swap_buf_right, { desc = "Swap buffer right" })
end

-- Step 4: Auto-save & Bigfile
vim.pack.add({
  { src = "https://github.com/okuuva/auto-save.nvim" },
})

local ok_as, as = pcall(require, "auto-save")
if ok_as then
  as.setup({
    trigger_events = {
      immediate_save = { "BufLeave", "FocusLost", "QuitPre", "VimSuspend" },
      defer_save = { "InsertLeave", "TextChanged" },
      cancel_deferred_save = { "InsertEnter" },
    },
    condition = function(buf)
      local filetype = vim.fn.getbufvar(buf, "&filetype")
      return not vim.list_contains({ "harpoon" }, filetype)
    end,
  })
end

-- Step 5: Yanky (Better Yank)
vim.pack.add({ { src = "https://github.com/gbprod/yanky.nvim" } })
local ok_yanky, yanky = pcall(require, "yanky")
if ok_yanky then
  yanky.setup({
    highlight = { on_put = true, on_yank = true, timer = 200 },
  })

  vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
  vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
  vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
  vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")
  vim.keymap.set("n", "<c-p>", "<Plug>(YankyPreviousRingHistory)")
  vim.keymap.set("n", "<c-n>", "<Plug>(YankyNextRingHistory)")
  if snacks then
    vim.keymap.set("n", "<leader>p", function()
      snacks.picker.yanky()
    end, { desc = "Yank History" })
  end
end

-- Step 6: Flash (Fast Navigation)
vim.pack.add({ { src = "https://github.com/folke/flash.nvim" } })
local ok_flash, flash = pcall(require, "flash")
if ok_flash then
  flash.setup({})
  vim.keymap.set({ "n", "x", "o" }, "s", function()
    flash.jump()
  end, { desc = "Flash" })
  vim.keymap.set({ "n", "x", "o" }, "S", function()
    flash.treesitter()
  end, { desc = "Flash Treesitter" })
end

-- Step 7: Trouble (Better Diagnostics)
vim.pack.add({ { src = "https://github.com/folke/trouble.nvim" } })
local ok_trouble, trouble = pcall(require, "trouble")
if ok_trouble then
  trouble.setup({})
  vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
  vim.keymap.set(
    "n",
    "<leader>xX",
    "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
    { desc = "Buffer Diagnostics (Trouble)" }
  )
  vim.keymap.set("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Symbols (Trouble)" })
  vim.keymap.set(
    "n",
    "<leader>cl",
    "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
    { desc = "LSP Definitions / references / ... (Trouble)" }
  )
  vim.keymap.set("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List (Trouble)" })
  vim.keymap.set("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List (Trouble)" })
end

-- Step 8: Todo-comments
vim.pack.add({ { src = "https://github.com/folke/todo-comments.nvim" } })
local ok_todo, todo = pcall(require, "todo-comments")
if ok_todo then
  todo.setup({})
  vim.keymap.set("n", "]t", function()
    todo.jump_next()
  end, { desc = "Next Todo" })
  vim.keymap.set("n", "[t", function()
    todo.jump_prev()
  end, { desc = "Prev Todo" })
  vim.keymap.set("n", "<leader>st", "<cmd>TodoSnacks<cr>", { desc = "Todo (Snacks)" })
end

-- Step 9: Persistence (Session Management)
vim.pack.add({ { src = "https://github.com/folke/persistence.nvim" } })
local ok_persistence, persistence = pcall(require, "persistence")
if ok_persistence then
  persistence.setup({})
  vim.keymap.set("n", "<leader>qs", function()
    persistence.load()
  end, { desc = "Restore Session" })
  vim.keymap.set("n", "<leader>ql", function()
    persistence.load({ last = true })
  end, { desc = "Restore Last Session" })
  vim.keymap.set("n", "<leader>qd", function()
    persistence.stop()
  end, { desc = "Don't Save Current Session" })
end
