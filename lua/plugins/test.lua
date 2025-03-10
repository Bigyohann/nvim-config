return {
  { "olimorris/neotest-phpunit" },
  {
    "nvim-neotest/neotest",
    opts = {
      adapters = {
        ["neotest-phpunit"] = {
          env = {
            CONTAINER = "php",
            REMOTE_PHPUNIT_BIN = "vendor/bin/phpunit",
          },
          filter_dirs = { "vendor" },
          phpunit_cmd = function()
            return "/Users/bigyohann/.config/scripts/nvim/dockertestphp.sh"
          end,
        },
      },
    },
  },
}
