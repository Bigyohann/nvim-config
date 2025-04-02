return { -- change some telescope options and a keymap to browse plugin files
  {
    "nvim-telescope/telescope.nvim",
    -- change some options
    keys = {
      { "<leader>ff", "<cmd> Telescope lsp_dynamic_workspace_symbols <cr>", desc = "Find Workspace symbols" },
      { "<leader><leader>", "<cmd> Telescope find_files <cr>", desc = "Find files" },
      { "<leader>fw", "<cmd> Telescope live_grep <cr>", desc = "Find grep" },
      { "<leader>fb", "<cmd> Telescope buffers <cr>", desc = "Find buffers" },
      { "<leader>gR", "<cmd> Telescope lsp_references <cr>", desc = "Find references" },
      { "<leader>gD", "<cmd> Telescope lsp_declarations <cr>", desc = "Find declarations" },
      { "<leader>gd", "<cmd> Telescope lsp_definitions <cr>", desc = "Find definitions" },
      { "<leader>gi", "<cmd> Telescope lsp_implementations <cr>", desc = "Find implementations" },
      { "<leader>gt", "<cmd> Telescope lsp_type_definitions <cr>", desc = "Find type definitions" },

    },
    opts = {
      defaults = {
        file_ignore_patterns = { "md" },
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
  },
}
