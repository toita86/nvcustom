---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "chadracula",
}

M.nvdash = {
  load_on_startup = true,
}

M.ui = {
  statusline = {
    enabled = true,
    theme = "default",
    separator_style = "arrow",
    modules = require "nvcustom.statusline",
    order = {
      "mode",
      "file",
      "git",
      "%=",
      "lsp_msg",
      "diagnostics",
      "lsp",
      "python_env",
      "cpp_standard",
      "cwd",
      "cursor",
    },
  },
}

return M
