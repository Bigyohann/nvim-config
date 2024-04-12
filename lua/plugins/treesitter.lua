return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = { "lua" },
    highlight = {
      enable = true,
      use_languatree = true,
      additional_vim_regex_highlighting = true,
    },
    indent = {
      enable = true,
      disable = {
        "php",
      },
    },
  },
}
