local M = {
  opts =  {}
}

M.default_config = {
  search_dir = "$HOME",
  previewer = false,
  hidden = true,
  gitignore = true
}

local builtin = require("telescope.builtin")

M.setup = function(opts)
end

M.config = function(opts)
  M.opts = vim.tbl_deep_extend("force", M.default_config, opts)
end

M.find = function()
  local ignore_file = vim.fn.expand("$HOME/.config/dotfiles/config/fdignore")
  if M.opts.ignore_file then
    find_command = { "fd", "--ignore-file", ignore_file, "--type", "f"}
  else
    find_command = { "fd", "--type", "f"}
  end
  if M.opts.hidden == true then
    table.insert(find_command, "-H")
  end
  if M.opts.gitignore == true then
    table.insert(find_command, "-I")
  end


  builtin.find_files({
    prompt_title = "Telescope path",
    cwd = M.opts.dir,
    find_command = find_command,
    previewer = M.opts.previewer
  })
end

return M
