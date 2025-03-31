return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      -- "hrsh7th/cmp-nvim-lsp",
      { "antosha417/nvim-lsp-file-operations", config = true },
    },
    opts = function(_, opts)
      opts.autoformat = false

      local defaultServers = {
        "html",
        "cssls",
        "ts_ls",
        "clangd",
        "jsonls",
        "bashls",
        "lua_ls",
        "dockerls",
        "yamlls",
        "docker_compose_language_service",
        "gopls",
        "gitlab_ci_ls",
        "sqlls",
        "yamlls",
        "pylsp",
        "volar",
      }
      for _, server in ipairs(defaultServers) do
        opts.servers[server] = {}
      end

      local phpStubs = {
        "apache",
        "bcmath",
        "bz2",
        "calendar",
        "com_dotnet",
        "Core",
        "ctype",
        "curl",
        "date",
        "dba",
        "dom",
        "ds",
        "enchant",
        "exif",
        "fileinfo",
        "filter",
        "fpm",
        "ftp",
        "gd",
        "hash",
        "iconv",
        "imap",
        "interbase",
        "intl",
        "json",
        "ldap",
        "libxml",
        "mbstring",
        "mcrypt",
        "meta",
        "mssql",
        "mysqli",
        "oci8",
        "odbc",
        "openssl",
        "pcntl",
        "pcre",
        "PDO",
        "pdo_ibm",
        "pdo_mysql",
        "pdo_pgsql",
        "pdo_sqlite",
        "pgsql",
        "Phar",
        "posix",
        "pspell",
        "readline",
        "recode",
        "Reflection",
        "regex",
        "session",
        "shmop",
        "SimpleXML",
        "snmp",
        "soap",
        "sockets",
        "sodium",
        "SPL",
        "sqlite3",
        "standard",
        "superglobals",
        "sybase",
        "sysvmsg",
        "sysvsem",
        "sysvshm",
        "tidy",
        "tokenizer",
        "wddx",
        "xml",
        "xmlreader",
        "xmlrpc",
        "xmlwriter",
        "Zend OPcache",
        "zip",
        "zlib",
      }

      opts.servers.intelephense = {
        settings = {
          intelephense = {
            files = {
              exclude = {
                "**/.git/**",
                "**/.svn/**",
                "**/.hg/**",
                "**/CVS/**",
                "**/.DS_Store/**",
                "**/node_modules/**",
                "**/bower_components/**",
                "**/vendor/**/{Tests,tests}/**",
                "**/.history/**",
                "**/vendor/**/vendor/**",
                "**/var/**",
              },
            },
            stubs = phpStubs,
          },
        },
      }

      opts.servers.graphql = {
        filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
      }

      opts.servers.emmet_ls = {
        filetypes = {
          "html",
          "typescriptreact",
          "javascriptreact",
          "css",
          "sass",
          "scss",
          "less",
          "svelte",
          "htmlangular",
        },
      }

      opts.servers.twiggy_language_server = {
        filetypes = { "twig" },
        cmd = { "twiggy-language-server", "--stdio" },
      }

      -- local languageServerPath = "/opt/homebrew/lib/"
      -- local cmd =
      --   { "ngserver", "--stdio", "--tsProbeLocations", languageServerPath, "--ngProbeLocations", languageServerPath }
      --
      -- opts.servers.angularls = {
      --   cmd = cmd,
      --   on_new_config = function(new_config)
      --     new_config.cmd = cmd
      --   end,
      -- }

      -- opts.servers.vtsls = {
      --   init_options = {
      --     plugins = {
      --       {
      --         name = "@vue/typescript-plugin",
      --         location = languageServerPath .. "@vue/language-server",
      --         languages = { "vue" },
      --       },
      --     },
      --   },
      --   filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
      -- }

      opts.servers.biome = {
        filetypes = { "json" },
      }
    end,
  },
}
