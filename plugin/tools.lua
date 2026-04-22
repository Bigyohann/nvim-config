-- Tools Categorized Plugins (Debug, Test, Git, Sessions)

-- Step 1: DAP (Debug Adapter Protocol)
vim.pack.add({
  { src = "https://github.com/mfussenegger/nvim-dap" },
  { src = "https://github.com/rcarriga/nvim-dap-ui" },
  { src = "https://github.com/theHamsta/nvim-dap-virtual-text" },
  { src = "https://github.com/nvim-neotest/nvim-nio" },
})

local ok_dap, dap = pcall(require, "dap")
local ok_dapui, dapui = pcall(require, "dapui")

if ok_dap and ok_dapui then
  dapui.setup()

  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
  end
  dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
  end
  dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
  end

  vim.keymap.set("n", "<leader>du", function()
    dapui.toggle()
  end, { desc = "DAP UI" })
  vim.keymap.set("n", "<leader>db", function()
    dap.toggle_breakpoint()
  end, { desc = "Breakpoint" })
  vim.keymap.set("n", "<leader>dc", function()
    dap.continue()
  end, { desc = "Continue" })
  vim.keymap.set("n", "<leader>di", function()
    dap.step_into()
  end, { desc = "Step Into" })
  vim.keymap.set("n", "<leader>do", function()
    dap.step_over()
  end, { desc = "Step Over" })
end

-- Step 3: Diffview
vim.pack.add({ { src = "https://github.com/sindrets/diffview.nvim" } })
local ok_diffview, diffview = pcall(require, "diffview")
if ok_diffview then
  vim.keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen<cr>", { desc = "Diffview Open" })
  vim.keymap.set("n", "<leader>gfh", "<cmd>DiffviewFileHistory %<cr>", { desc = "File History" })
end

-- Step 4: Grug-far (Search and Replace)
vim.pack.add({ { src = "https://github.com/MagicDuck/grug-far.nvim" } })
local ok_grug, grug = pcall(require, "grug-far")
if ok_grug then
  grug.setup({
    transient = true,
  })

  vim.keymap.set("n", "<leader>sr", function()
    grug.open({ prefills = { paths = vim.fn.expand("%") } })
  end, { desc = "Grug-far: Search and replace current file" })

  vim.keymap.set("n", "<leader>sR", function()
    grug.open({})
  end, { desc = "Grug-far: Search and replace global" })
end
