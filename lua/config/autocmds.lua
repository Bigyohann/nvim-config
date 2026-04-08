local function augroup(name)
  return vim.api.nvim_create_augroup("bigyohann_" .. name, { clear = true })
end

-- Disable autoformat for lua files
vim.api.nvim_create_autocmd({ "FileType" }, {
  group = augroup("disable_autoformat"),
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
  group = augroup("treesitter_fallback"),
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
  group = augroup("gitlab_ci_yaml"),
  pattern = "*.gitlab-ci*.{yml,yaml}",
  callback = function()
    vim.bo.filetype = "yaml.gitlab"
    vim.b.autoformat = false
  end,
})
