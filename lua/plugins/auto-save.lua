return {
  {
    "okuuva/auto-save.nvim",
    lazy = false,
    opts = {
      trigger_events = {
        defer_save = { "InsertLeave", "TextChanged" },
      },
    },
  },
}
