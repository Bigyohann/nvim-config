return {
  -- {
  --   "olimorris/codecompanion.nvim",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --   },
  --   opts = {
  --     strategies = {
  --       -- Change the default chat adapter
  --       chat = {
  --         adapter = "qwen",
  --       },
  --       inline = {
  --         adapter = "qwen",
  --       },
  --       cmd = {
  --         "qwen",
  --       },
  --     },
  --     adapters = {
  --       qwen = function()
  --         return require("codecompanion.adapters").extend("ollama", {
  --           name = "qwen", -- Give this adapter a different name to differentiate it from the default ollama adapter
  --           schema = {
  --             model = {
  --               default = "codellama:code",
  --             },
  --           },
  --         })
  --       end,
  --     },
  --     -- NOTE: The log_level is in `opts.opts`
  --     opts = {
  --       log_level = "DEBUG", -- or "TRACE"
  --     },
  --   },
  -- },
  {
    "Exafunction/windsurf.vim",
    lazy = false,
    config = function()
      vim.g.codeium_no_map_tab = 1

      vim.keymap.set("i", "<C-j>", function()
        return vim.fn["codeium#Accept"]()
      end, { expr = true, silent = true })
    end,
  },
}
