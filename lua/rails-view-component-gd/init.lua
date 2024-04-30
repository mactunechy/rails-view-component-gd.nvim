

local get_file_path = function ()
   local line = vim.api.nvim_get_current_line()

  local namespace = line:match("(%w+::%w+)")

  if not namespace then
    namespace = vim.fn.expand("<cword>")
  end

  if not namespace then
    return print("Not a view component")
  end

  local file_path = namespace:gsub("::", "/"):gsub("(%w)(%u)", function (a,b)
    return a .. "_" .. b
  end):lower()

  return file_path
end

local open_file = function (path)
  if vim.loop.fs_stat(path) then
    vim.cmd("edit " .. path)
  end
end


-- Public API ---

local M = {}

M.open_class = function ()
  local  file_path = get_file_path()
  local relative_path = "app/components/" .. file_path .. '.rb'

  open_file(relative_path)
end

M.open_template = function ()
  local file_extension = vim.fn.expand("%:e")
  local  file_path = get_file_path()
  local relative_path = "app/components/" .. file_path .. '.html.' .. file_extension

  open_file(relative_path)
end

return M

