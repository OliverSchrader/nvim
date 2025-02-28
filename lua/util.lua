local util = {}

function util.get_parent_project_name()
  local project_directory = vim.loop.cwd()
  if not project_directory then
    vim.notify('Unable to get the project directory', vim.log.levels.WARN)
    return nil
  end

  local project_name = vim.fs.basename(project_directory)
  if not project_name then
    vim.notify('Unable to get the project name', vim.log.levels.WARN)
    return nil
  end

  local parent_dir = vim.fn.fnamemodify(project_directory, ':h') -- Get parent dir
  local parent_dir_name = vim.fn.fnamemodify(parent_dir, ':t')

  return parent_dir_name .. ' - ' .. project_name
end

return util
