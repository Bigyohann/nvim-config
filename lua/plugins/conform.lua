return {
  {
    "stevearc/conform.nvim",
    opts = {
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
          env = {
            PHP_CS_FIXER_IGNORE_ENV = 1,
          },
        },
      },
    },
  },
}
