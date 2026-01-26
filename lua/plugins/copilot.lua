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
  --         adapter = "gemini_cli",
  --       },
  --       inline = {
  --         adapter = "gemini_cli",
  --       },
  --       cmd = {
  --         "gemini_cli",
  --       },
  --     },
  --     adapters = {
  --       acp = {
  --         gemini_cli = function()
  --           return require("codecompanion.adapters").extend("gemini_cli", {
  --             defaults = {
  --               auth_method = "oauth-personal", -- "oauth-personal"|"gemini-api-key"|"vertex-ai"
  --             },
  --           })
  --         end,
  --       },
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
