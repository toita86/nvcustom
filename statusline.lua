local M = {}

M.python_env = function()
  if vim.bo.filetype ~= "python" then
    return ""
  end

  local env = vim.env.VIRTUAL_ENV

  if not env then
    return "  system "
  end

  return "  " .. vim.fn.fnamemodify(env, ":t") .. " "
end

return M
