return {
  {
    "folke/snacks.nvim",
    opts = {
      bigfile = { enabled = false },
    },
    keys = {
      { "<leader>ff", function() Snacks.picker.lsp_workspace_symbols() end, desc = "Find Workspace symbols" },
      { "<leader><leader>", function() Snacks.picker.files() end, desc = "Find files" },
      { "<leader>fw", function() Snacks.picker.grep() end, desc = "Find grep" },
      { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Find buffers" },
      { "<leader>gR", function() Snacks.picker.lsp_references() end, nowait = true, desc = "Find references" },
      { "<leader>gD", function() Snacks.picker.lsp_declarations() end, desc = "Find declarations" },
      { "<leader>gd", function() Snacks.picker.lsp_definitions() end, desc = "Find definitions" },
      { "<leader>gi", function() Snacks.picker.lsp_implementations() end, desc = "Find implementations" },
      { "<leader>gt", function() Snacks.picker.lsp_type_definitions() end, desc = "Find type definitions" },
    },
  },
}