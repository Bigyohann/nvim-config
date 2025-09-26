return {
  {
    "catppuccin/nvim",
    lazy = true,
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      theme = "catppuccino",
    },
  },
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    disable = true,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-macchiato",
    },
  },
}
