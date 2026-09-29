local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<Esc>")

map("n", "<leader>gx", function()
  local file = vim.fn.expand "%:p"

  if vim.bo.filetype == "pdf" then
    vim.fn.jobstart({ "firefox", file }, { detach = true })
  else
    vim.ui.open(file)
  end
end, { desc = "Open file externally" })

-- Change these two names to the themes you want to toggle between.
local toggle_themes = { "gruvbox_light", "chadracula" }

map("n", "<leader>tt", function()
  local current = require("nvconfig").base46.theme
  local next_theme = toggle_themes[1]

  if current == toggle_themes[1] then
    next_theme = toggle_themes[2]
  end

  require("nvchad.themes.utils").reload_theme(next_theme)
end, { desc = "Toggle theme between d/l presets" })

map("n", "<leader>ui", function()
  local enabled = vim.lsp.inlay_hint.is_enabled { bufnr = 0 }
  vim.lsp.inlay_hint.enable(not enabled, { bufnr = 0 })
end, { desc = "Toggle inlay hints" })

local function project_root()
  local result = vim.fn.systemlist {
    "git",
    "-C",
    vim.fn.getcwd(),
    "rev-parse",
    "--show-toplevel",
  }

  if vim.v.shell_error == 0 and result[1] and result[1] ~= "" then
    return result[1]
  end

  return vim.fn.getcwd()
end

map("n", "<leader>sr", function()
  require("spectre").open_file_search()
end, { desc = "Search and replace in buffer" })

map("n", "<leader>sR", function()
  require("spectre").open { cwd = project_root() }
end, { desc = "Search and replace in project" })

map({ "n", "v" }, "<leader>sw", function()
  require("spectre").open_visual()
end, { desc = "Search and replace selection" })
