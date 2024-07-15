return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        fish = { "fish_indent" },
        sh = { "shfmt" },
        php = { "php-cs-fixer" },
        typescript = { "prettierd", "prettier" },
        javascript = { "prettierd", "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        json = { "biome" },
      },
    },
  },
}
