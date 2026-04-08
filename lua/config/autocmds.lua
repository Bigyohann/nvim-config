-- Disable autoformat for lua files
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "lua", "php", "yml", "yaml", "htmlangular", "typescript", "javascript" },
  callback = function()
    vim.b.autoformat = false
  end,
})

vim.filetype.add({
  pattern = {
    [".*%.component%.html"] = "htmlangular",
    [".*%.container%.html"] = "htmlangular",
    [".*%.page%.html"] = "htmlangular",
    [".*%.view%.html"] = "htmlangular",
  },
})

vim.filetype.add({
  pattern = {
    [".*%.blade%.php"] = "blade",
    ["Dockerfile.*"] = "dockerfile",
    ["docker-compose.*"] = "yaml.docker-compose",
  },
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "*" },
  callback = function()
    local filetype = vim.bo.filetype
    if filetype and filetype ~= "" then
      local success = pcall(function()
        vim.treesitter.start()
      end)
      if success then
        return
      end
    end
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.gitlab-ci*.{yml,yaml}",
  callback = function()
    vim.bo.filetype = "yaml.gitlab"
    vim.b.autoformat = false
  end,
})
