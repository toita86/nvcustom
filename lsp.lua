return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- Haskell
      vim.lsp.config("hls", {})

      -- Python
      vim.lsp.config("basedpyright", {
        settings = {
          python = {
            venvPath = ".",
            venv = ".venv",
          },
          basedpyright = {
            analysis = {
              typeCheckingMode = "basic",
              autoImportCompletions = true,
              inlayHints = {
                variableTypes = true,
                functionReturnTypes = true,
                callArgumentNames = true,
              },
            },
          },
        },
      })

      -- C / C++
      vim.lsp.config("clangd", {
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--query-driver=/usr/bin/clang++",
          "--compile-commands-dir=.",
        },
        init_options = {
          clangdFileStatus = true,
        },
      })

      -- CMake
      vim.lsp.config("neocmake", {})

      -- Enable servers
      vim.lsp.enable {
        "hls",
        "basedpyright",
        "clangd",
        "neocmake",
      }
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}

      vim.list_extend(opts.ensure_installed, {
        "hls", -- Haskell
        "basedpyright", -- Python
        "clangd", -- C/C++
        "neocmake", -- neocmake
      })
    end,
  },
}
