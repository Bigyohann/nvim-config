return {
  "L3MON4D3/LuaSnip",
  --   lazy = false,
  config = function()
    require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snippets" } })
  end,
}
