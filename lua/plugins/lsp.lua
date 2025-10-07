return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      -- "hrsh7th/cmp-nvim-lsp",
      { "antosha417/nvim-lsp-file-operations", config = true },
    },
    opts = function(_, opts)
      opts.autoformat = false

      local lsp_files = vim.fn.globpath(vim.fn.stdpath("config") .. "/lua/plugins/lsp", "*.lua", false, true)
      for _, file in ipairs(lsp_files) do
        local server = vim.fn.fnamemodify(file, ":t:r")
        local ok, config = pcall(require, "plugins.lsp." .. server)
        if ok then
          opts.servers[server] = config
        end
      end
    end,
  },
}
