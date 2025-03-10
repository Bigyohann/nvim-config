return {
  "nvim-treesitter/nvim-treesitter",
  disable = function(lang, buf)
    local max_filesize = 100 * 1024 -- 100 KB
    local ok, stats = pcall(vim.api.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
    if ok and stats and stats.size > max_filesize then
      return true
    end
  end,
  opts = {
    ensure_installed = {
      "lua",
      "blade",
      "php",
      "go",
      "gosum",
      "gomod",
      "phpdoc",
      "angular",
      "css",
      "javascript",
      "json",
      "scss",
      "typescript",
      "vue",
      "python",
    },
    highlight = {
      enable = true,
      use_languatree = true,
      additional_vim_regex_highlighting = true,
    },
    indent = {
      enable = true,
      disable = {},
    },
  },
}
