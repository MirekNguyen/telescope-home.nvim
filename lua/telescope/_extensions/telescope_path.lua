local tpath = require("telescope-path")

return require("telescope").register_extension {
  setup = function(ext_config, config)
		tpath.opts = vim.tbl_deep_extend("force", tpath.default_config, ext_config)

    -- access extension config and user config
  end,
  exports = {
    telescope_path = require("telescope-path").find
  },
}
