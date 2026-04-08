-- Step 8: Treesitter
vim.pack.add({
  {
    src = "https://github.com/nvim-treesitter/nvim-treesitter",
    version = "main",
  },
})

local ok, ts_configs = pcall(require, "nvim-treesitter.configs")
if ok then
  ts_configs.setup({
    ensure_installed = {
      "lua",
      "php",
      "phpdoc",
      "html",
      "javascript",
      "css",
      "blade",
      "go",
      "typescript",
      "vue",
      "python",
      "angular",
      "json",
      "scss",
      "dockerfile",
      "norg",
      "markdown",
      "markdown_inline",
    },
    sync_install = true,
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = true,
    },
  })
end
