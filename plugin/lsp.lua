-- Step 6: LSP Config
vim.pack.add({
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/folke/lazydev.nvim" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/antosha417/nvim-lsp-file-operations" },
  { src = "https://github.com/hrsh7th/cmp-nvim-lsp" },
  { src = "https://github.com/williamboman/mason.nvim" },
  { src = "https://github.com/williamboman/mason-lspconfig.nvim" },
})

local ok_lazydev, lazydev = pcall(require, "lazydev")
if ok_lazydev then
  lazydev.setup()
end

local ok_lsp_file_ops, lsp_file_ops = pcall(require, "lsp-file-operations")
if ok_lsp_file_ops then
  lsp_file_ops.setup()
end
local servers = {
  "gopls",
  "biome",
  "angularls",
  "bashls",
  "clangd",
  "cssls",
  "docker_compose_language_service",
  "dockerls",
  "intelephense",
  "gitlab_ci_ls",
  "html",
  "jsonls",
  "lua_ls",
  "marksman",
  "ts_ls",
  "yamlls",
}

local ok_mason, mason = pcall(require, "mason")
if ok_mason then
  mason.setup({
    ensure_installed = {
      "gopls",
      "clang-format",
      "biome",
      "deno",
      "angular-language-server",
      "bash-language-server",
      "clangd",
      "css-lsp",
      "docker-compose-language-service",
      "dockerfile-language-server",
      "gitlab-ci-ls",
      "hadolint",
      "html-lsp",
      "intelephense",
      "json-lsp",
      "jsonlint",
      "lua-language-server",
      "markdownlint",
      "marksman",
      "prettier",
      "shfmt",
      "stylua",
      "typescript-language-server",
      "yaml-language-server",
    },
  })
end

local ok_cmp_lsp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
local capabilities = ok_cmp_lsp and cmp_nvim_lsp.default_capabilities() or {}

local config_path = vim.fn.stdpath("config")

for _, server in ipairs(servers) do
  local opts = {
    capabilities = capabilities,
  }

  local custom_config_path = config_path .. "/lsp/" .. server .. ".lua"
  if vim.fn.filereadable(custom_config_path) == 1 then
    local custom_opts = dofile(custom_config_path)
    if type(custom_opts) == "table" then
      opts = vim.tbl_deep_extend("force", opts, custom_opts)
    end
  end

  -- Native Neovim 0.12 setup
  vim.lsp.config(server, opts)
  vim.lsp.enable(server)
end
