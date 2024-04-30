
local COMPONENTS_FOLDER = 'app/components/'

local get_file_path = function()
  local line = vim.api.nvim_get_current_line()

  local namespace = line:match("(%w+::%w+)")

  if not namespace then
    namespace = vim.fn.expand("<cword>")
  end

  if not namespace then
    return print("Not a view component")
  end

  local file_path = namespace:gsub("::", "/"):gsub("(%w)(%u)", function(a, b)
    return a .. "_" .. b
  end):lower()

  return file_path
end

local open_file = function(path)
  if vim.loop.fs_stat(path) then
    vim.cmd("edit " .. path)
  end
end


-- Public API ---

local M         = {}

M.open_class    = function()
  local file_path = get_file_path()
  local relative_path = COMPONENTS_FOLDER .. file_path .. '.rb'

  open_file(relative_path)
end

M.open_spec     = function()
  local file_path = vim.fn.fnamemodify(vim.fn.expand("%:p"), ":~:."):gsub("%..*", "")
  local destination = file_path:gsub("app", "spec") .. "_spec.rb"

  if not vim.loop.fs_stat(destination) then
    return print("ViewComponent spec does not exist")
  end

  open_file(destination)
end

M.open_template = function()
  local file_extension = vim.fn.expand("%:e")
  local file_path = get_file_path()
  local destination = COMPONENTS_FOLDER .. file_path .. '.html.' .. file_extension

  open_file(destination)
end

M.toggle        = function()
  local file_extension = vim.fn.expand("%:e")
  local file_path = vim.fn.fnamemodify(vim.fn.expand("%:p"), ":~:."):gsub("%..*", "")

  local desitnation_file_paths = {
    slim = function() return file_path .. ".rb" end,
    erb  = function() return file_path .. ".rb" end,
    rb   = function()
      local relative_path = file_path .. ".html.slim"

      if not vim.loop.fs_stat(relative_path) then
        relative_path = file_path .. ".html.erb"
      end

      return relative_path
    end
  }

  local destination = desitnation_file_paths[file_extension]()
  open_file(destination)
end

return M
