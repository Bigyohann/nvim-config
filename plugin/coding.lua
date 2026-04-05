-- Coding Categorized Plugins (Completion, Formatting, Snippets, AI)

-- Step 1: Completion (Cmp)
vim.pack.add({
  { src = "https://github.com/hrsh7th/nvim-cmp" },
  { src = "https://github.com/hrsh7th/cmp-buffer" },
  { src = "https://github.com/hrsh7th/cmp-path" },
  { src = "https://github.com/hrsh7th/cmp-nvim-lsp" },
  { src = "https://github.com/saadparwaiz1/cmp_luasnip" },
  { src = "https://github.com/onsails/lspkind.nvim" },
  { src = "https://github.com/editorconfig/editorconfig-vim" },
})

local ok_cmp, cmp = pcall(require, "cmp")
if ok_cmp then
  local lspkind = require("lspkind")

  cmp.setup({
    completion = { completeopt = "menu,menuone,noinsert" },
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.abort(),
      ["<CR>"] = cmp.mapping(function(fallback)
        if cmp.visible() and cmp.get_selected_entry() then
          cmp.confirm({ select = false })
        else
          fallback()
        end
      end),
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end, { "i", "s" }),
    }),
    sources = cmp.config.sources({
      { name = "nvim_lsp", priority = 1000, max_item_count = 5 },
      { name = "luasnip", priority = 750, max_item_count = 3 },
      { name = "buffer", priority = 500, max_item_count = 3 },
      { name = "path", priority = 250, max_item_count = 3 },
    }),
    formatting = {
      format = lspkind.cmp_format({
        mode = "symbol_text",
        maxwidth = 50,
        ellipsis_char = "...",
        menu = {
          nvim_lsp = "[LSP]",
          luasnip = "[Snippet]",
          buffer = "[Buffer]",
          path = "[Path]",
        },
      }),
    },
    window = {
      completion = cmp.config.window.bordered({
        winhighlight = "Normal:CmpNormal,FloatBorder:CmpBorder,CursorLine:PmenuSel,Search:None",
      }),
      documentation = cmp.config.window.bordered({
        winhighlight = "Normal:CmpDocNormal,FloatBorder:CmpDocBorder,CursorLine:PmenuSel,Search:None",
      }),
    },
  })
end

-- Step 2: Snippets & Text Objects
vim.pack.add({
  { src = "https://github.com/L3MON4D3/LuaSnip" },
  { src = "https://github.com/rafamadriz/friendly-snippets" },
  { src = "https://github.com/echasnovski/mini.nvim" },
})

local ok_luasnip, luasnip = pcall(require, "luasnip")
if ok_luasnip then
  luasnip.setup({})
  require("luasnip.loaders.from_vscode").lazy_load()
end

-- Mini plugins
local function setup_mini(name)
  local ok, plugin = pcall(require, "mini." .. name)
  if ok then
    plugin.setup({})
  end
end

setup_mini("pairs")
setup_mini("surround")
setup_mini("ai")

-- Step 3: Formatting (Conform)
vim.pack.add({ { src = "https://github.com/stevearc/conform.nvim" } })
local ok_conform, conform = pcall(require, "conform")
if ok_conform then
  conform.setup({
    formatters_by_ft = {
      lua = { "stylua" },
      fish = { "fish_indent" },
      sh = { "shfmt" },
      php = { "php_cs_fixer" },
      typescript = { "prettierd", "prettier" },
      javascript = { "prettierd", "prettier" },
      html = { "prettier" },
      css = { "prettier" },
      scss = { "prettier" },
      json = { "biome" },
      go = { "gofmt", "gofumpt", "goimports", "golines" },
      xml = { "xmlformatter" },
      htmlangular = { "prettier" },
      vue = { "prettier" },
      sql = { "pgformatter" },
    },
    formatters = {
      php_cs_fixer = {
        command = "docker",
        args = {
          "compose",
          "exec",
          "php",
          "vendor/bin/php-cs-fixer",
          "--allow-risky=yes",
          "--config=.php-cs-fixer.php",
          "fix",
          "$RELATIVE_FILEPATH",
        },
        cwd = require("conform.util").root_file({ "composer.json", "composer.lock" }),
        env = { PHP_CS_FIXER_IGNORE_ENV = 1 },
      },
    },
  })

  vim.keymap.set({ "n", "v" }, "<leader>f", function()
    conform.format({ lsp_fallback = true, async = false, timeout_ms = 500 })
  end, { desc = "Format file or range" })

  vim.keymap.set({ "n", "v" }, "<leader>cf", function()
    conform.format({ lsp_fallback = true, async = false, timeout_ms = 500 })
  end, { desc = "Format file or range (Conform)" })
end

-- Step 4: AI Tools (Windsurf)
vim.pack.add({
  { src = "https://github.com/Exafunction/windsurf.vim" },
})

-- Windsurf configuration
vim.g.windsurf_disable_bindings = 1
vim.g.windsurf_idle_delay = 75
vim.g.windsurf_filetypes = {
  markdown = false,
  help = false,
  text = false,
}
vim.g.codeium_no_map_tab = 1

local ok_windsurf, windsurf = pcall(require, "codeium")
if ok_windsurf then
  windsurf.setup({})
end
-- Windsurf keymaps
-- Accept completion with Ctrl+j or <Tab> (if you prefer)
vim.keymap.set("i", "<C-j>", function()
  return vim.fn["codeium#Accept"]()
end, { expr = true, silent = true, desc = "Windsurf: Accept" })
vim.keymap.set("i", "<M-]>", function()
  return vim.fn["codeium#CycleCompletions"](1)
end, { expr = true, silent = true, desc = "Windsurf: Next" })
vim.keymap.set("i", "<M-[>", function()
  return vim.fn["codeium#CycleCompletions"](-1)
end, { expr = true, silent = true, desc = "Windsurf: Previous" })
vim.keymap.set("i", "<C-x>", function()
  return vim.fn["codeium#Clear"]()
end, { expr = true, silent = true, desc = "Windsurf: Clear" })

-- Toggle Windsurf
vim.keymap.set("n", "<leader>at", function()
  if vim.g.windsurf_enabled == 0 then
    vim.cmd("Codeium Enable")
    vim.g.windsurf_enabled = 1
    print("Windsurf enabled")
  else
    vim.cmd("Codeium Disable")
    vim.g.windsurf_enabled = 0
    print("Windsurf disabled")
  end
end, { desc = "Windsurf: Toggle" })

-- Authenticate Windsurf
vim.keymap.set("n", "<leader>aa", ":Windsurf Auth<CR>", { desc = "Windsurf: Authenticate" })

-- Better visibility for suggestions
vim.api.nvim_set_hl(0, "WindsurfSuggestion", { link = "Comment" })

-- Step 5: Autotag
vim.pack.add({ { src = "https://github.com/windwp/nvim-ts-autotag" } })
local ok_autotag, autotag = pcall(require, "nvim-ts-autotag")
if ok_autotag then
  autotag.setup()
end

-- Add php specific plugins
vim.pack.add({
  { src = "https://github.com/ta-tikoma/php.easy.nvim" },
})

local ok_php_easy, php_easy = pcall(require, "php-easy-nvim")
if ok_php_easy then
  php_easy.setup({})

  vim.api.nvim_create_autocmd("FileType", {
    pattern = "php",
    callback = function()
      local opts = { buffer = true, silent = true }
      vim.keymap.set("n", "-b", "<CMD>PHPEasyDocBlock<CR>", opts)
      vim.keymap.set("n", "-r", "<CMD>PHPEasyReplica<CR>", opts)
      vim.keymap.set("n", "-c", "<CMD>PHPEasyCopy<CR>", opts)
      vim.keymap.set("n", "-d", "<CMD>PHPEasyDelete<CR>", opts)
      vim.keymap.set("n", "-ii", "<CMD>PHPEasyInitInterface<CR>", opts)
      vim.keymap.set("n", "-ic", "<CMD>PHPEasyInitClass<CR>", opts)
      vim.keymap.set("n", "-iac", "<CMD>PHPEasyInitAbstractClass<CR>", opts)
      vim.keymap.set("n", "-it", "<CMD>PHPEasyInitTrait<CR>", opts)
      vim.keymap.set("n", "-ie", "<CMD>PHPEasyInitEnum<CR>", opts)
      vim.keymap.set({ "n", "v" }, "-c", "<CMD>PHPEasyAppendConstant<CR>", opts)
      vim.keymap.set({ "n", "v" }, "-p", "<CMD>PHPEasyAppendProperty<CR>", opts)
      vim.keymap.set({ "n", "v" }, "-m", "<CMD>PHPEasyAppendMethod<CR>", opts)
      vim.keymap.set("n", "-_", "<CMD>PHPEasyAppendConstruct<CR>", opts)
      vim.keymap.set("n", "-a", "<CMD>PHPEasyAppendArgument<CR>", opts)
      vim.keymap.set("n", "-#", "<CMD>PHPEasyAttribute<CR>", opts)
      vim.keymap.set("n", "-uu", "<CMD>PHPEasyRemoveUnusedUses<CR>", opts)
      vim.keymap.set("n", "-e", "<CMD>PHPEasyExtends<CR>", opts)
      vim.keymap.set("n", "-i", "<CMD>PHPEasyImplements<CR>", opts)
      vim.keymap.set("n", "_i", "<CMD>PHPEasyAppendInvoke<CR>", opts)
    end,
  })
end
