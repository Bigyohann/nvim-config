return {
  "mrjones2014/smart-splits.nvim",
  lazy = false,
  opts = {
    -- set to true to disable multiplexer integration
    -- or set to 'tmux', 'wezterm', or 'kitty'
    multiplexer_integration = "wezterm",
    -- wezterm integration needs the wezterm CLI to be in your $PATH
  },
  keys = {
    -- resizing splits
    -- these keymaps will also accept a range, e.g. STICKY_RESIZE_MODE
    { "<A-h>", function() require("smart-splits").resize_left() end, desc = "Resize left" },
    { "<A-j>", function() require("smart-splits").resize_down() end, desc = "Resize down" },
    { "<A-k>", function() require("smart-splits").resize_up() end, desc = "Resize up" },
    { "<A-l>", function() require("smart-splits").resize_right() end, desc = "Resize right" },
    -- moving between splits
    { "<C-h>", function() require("smart-splits").move_cursor_left() end, desc = "Move to left split" },
    { "<C-j>", function() require("smart-splits").move_cursor_down() end, desc = "Move to bottom split" },
    { "<C-k>", function() require("smart-splits").move_cursor_up() end, desc = "Move to top split" },
    { "<C-l>", function() require("smart-splits").move_cursor_right() end, desc = "Move to right split" },
    -- swapping buffers between windows
    { "<leader><leader>h", function() require("smart-splits").swap_buf_left() end, desc = "Swap buffer left" },
    { "<leader><leader>j", function() require("smart-splits").swap_buf_down() end, desc = "Swap buffer down" },
    { "<leader><leader>k", function() require("smart-splits").swap_buf_up() end, desc = "Swap buffer up" },
    { "<leader><leader>l", function() require("smart-splits").swap_buf_right() end, desc = "Swap buffer right" },
  },
}
