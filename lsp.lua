return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- Haskell
      vim.lsp.config("hls", {})

      -- Python
      vim.lsp.config("pyright", {
        settings = {
          python = {
            venvPath = ".",
            venv= ".venv",
            analysis = {
              typeCheckingMode = "basic",
              autoImportCompletions = true,
            },
          },
        },
      })

      -- C / C++
      vim.lsp.config("clangd", {
        cmd = {
          "clangd-14",
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
        "pyright",
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
        "pyright", -- Python
        "clangd", -- C/C++
        "neocmake", -- neocmake
      })
    end,
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown" },
    opts = {
      completions = {
        lsp = {
          enabled = true,
        },
      },
    },
  },
}
