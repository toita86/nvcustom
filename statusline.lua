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

local function configured_cpp_standard()
  if vim.b.cpp_standard_checked then
    return vim.b.cpp_standard
  end

  vim.b.cpp_standard_checked = true
  local filename = vim.api.nvim_buf_get_name(0)
  local directory = filename ~= "" and vim.fs.dirname(filename) or vim.uv.cwd()
  local config = vim.fs.find({ "compile_commands.json", "compile_flags.txt", "CMakeLists.txt" }, {
    upward = true,
    path = directory,
    type = "file",
  })[1]

  if not config then
    return nil
  end

  for _, line in ipairs(vim.fn.readfile(config)) do
    local flag = line:match("%-std=([%w%+%-]+)") or line:match("/std:(c%+%+[%w%-]+)")
    local standard = flag and (flag:match("c%+%+([%w%-]+)$") or flag:match("gnu%+%+([%w%-]+)$"))
    if standard then
      vim.b.cpp_standard = "C++" .. standard
      return vim.b.cpp_standard
    end

    local cmake_standard = line:match("CXX_STANDARD%s+([0-9]+)")
      or line:match("CMAKE_CXX_STANDARD%s+([0-9]+)")
    if cmake_standard then
      vim.b.cpp_standard = "C++" .. cmake_standard
      return vim.b.cpp_standard
    end
  end

  return nil
end

M.cpp_standard = function()
  local cpp_filetypes = {
    c = true,
    cpp = true,
    cuda = true,
    h = true,
    hpp = true,
    objc = true,
    objcpp = true,
  }

  if not cpp_filetypes[vim.bo.filetype] then
    return ""
  end

  return "  " .. (configured_cpp_standard() or "C++") .. " "
end

return M
