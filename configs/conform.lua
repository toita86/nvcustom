return {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "black" },
    markdown = {
      "mdformat",
      extra_args = { "--extensions", "myst" },
    },
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}
