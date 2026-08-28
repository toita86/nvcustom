local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<Esc>")

map("n", "gx", function()
  vim.ui.open(vim.fn.expand "%:p")
end, { desc = "Open file externally" })
