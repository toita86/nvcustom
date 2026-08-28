local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<Esc>")

map("n", "gx", function()
  vim.ui.open(vim.fn.expand "%:p")
end, { desc = "Open file externally" })

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
