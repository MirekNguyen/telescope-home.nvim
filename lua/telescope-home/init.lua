local M = {
  opts =  {}
}

M.default_config = {
}

local builtin = require("telescope.builtin")

M.setup = function(opts)
end

M.config = function(opts)
  M.opts = vim.tbl_deep_extend("force", default_config, opts)
end

M.find = function()
  local home_directory = vim.fn.expand("$HOME")
  local ignore_file = vim.fn.expand("$HOME/.config/dotfiles/config/fdignore")

  builtin.find_files({
    prompt_title = "Telescope home",
    cwd = home_directory,
    find_command = { "fd", "-I", "-H", "--ignore-file", ignore_file, "--type", "f"},
    layout_config = {
      vertical = { 
        width = 0.5,
        height = 0.5
      }
      -- other layout configuration here
    },
    previewer = false
  })
end

return M
