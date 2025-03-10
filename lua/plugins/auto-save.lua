return {
  {
    "okuuva/auto-save.nvim",
    opts = {
      trigger_events = {
        trigger_events = { -- See :h events
          immediate_save = { "BufLeave", "FocusLost", "QuitPre", "VimSuspend" }, -- vim events that trigger an immediate save
          defer_save = { "InsertLeave", "TextChanged" }, -- vim events that trigger a deferred save (saves after `debounce_delay`)
          cancel_deferred_save = { "InsertEnter" }, -- vim events that cancel a pending deferred save
        },
      },
    },
  },
}
