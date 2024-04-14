return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "olimorris/neotest-phpunit",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-phpunit")({
            filter_dirs = { "vendor" },
            env = {
              CONTAINER = "php",
              REMOTE_PHPUNIT_BIN = "vendor/bin/phpunit",
            },
            phpunit_cmd = function()
              return "~/.config/scripts/nvim/dockertestphp.sh"
            end,
          }),
        },
      })
    end,
    keys = {
      { "<leader>ta", "<cmd>lua require('neotest').run.run('./tests')<cr>", desc = "Run all tests" },
      { "<leader>tr", "<cmd>lua require('neotest').summary<cr>", desc = "Get run results" },
      { "<leader>tf", '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<cr>', desc = "Run current file tests" },
    },
  },
}
