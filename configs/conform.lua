return {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "black", "isort" },
    markdown = {
      "mdformat",
      extra_args = { "--extensions", "myst" },
    },
  },

  formatters = {
    isort = {
      prepend_args = { "--profile", "black" },
    },
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}
