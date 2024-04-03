return { -- change some telescope options and a keymap to browse plugin files
  {
    "nvim-telescope/telescope.nvim",
    -- change some options
    keys = {
      { "<leader>fr", "<cmd> Telescope lsp_dynamic_workspace_symbols <cr>", desc = "Find Workspace symbols" },
      { "<leader>ff", "<cmd> Telescope find_files <cr>", desc = "Find files" },
      { "<leader>fw", "<cmd> Telescope live_grep<cr>", desc = "Find grep" },
      { "<leader>fb", "<cmd> Telescope buffers <cr>", desc = "Find buffers" },
    },
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
  },
}
