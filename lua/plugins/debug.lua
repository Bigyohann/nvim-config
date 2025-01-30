return {
  {
    "mfussenegger/nvim-dap",

    opts = function()
      local dap = require("dap")
      local path = require("mason-registry").get_package("php-debug-adapter"):get_install_path()
      dap.adapters.php = {
        type = "executable",
        command = "node",
        args = { path .. "/extension/out/phpDebug.js" },
      }
      dap.configurations.php = {
        {
          name = "Listen for Xdebug",
          type = "php",
          request = "launch",
          port = 9003,
          pathMappings = {
            ["/srv/app"] = "${workspaceFolder}",
          },
          xdebugSettings = {
            extended_properties = 1,
            max_children = 200,
            max_data = 512,
            max_depth = 5,
            show_hidden = 1,
          },
        },
      }
    end,
  },
}
