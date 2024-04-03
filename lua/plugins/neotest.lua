return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      adapters = {
        ["neotest-phpunit"] = {
          env = {
            CONTAINER = "php",
            REMOTE_PHPUNIT_BIN = "vendor/bin/phpunit",
          },
          root_files = { "composer.json", "phpunit.xml", ".gitignore" },
          phpunit_cmd = function()
            return "/Users/bigyohann/.config/big/runtestscriptphp.sh"
          end,
        },
      },
    },
  },
}
