local aj = require("telescope-home")

return require("telescope").register_extension {
  setup = function(ext_config, config)
		aj.opts = vim.tbl_deep_extend("force", aj.default_config, ext_config)

    -- access extension config and user config
  end,
  exports = {
    telescope_home = require("telescope-home").find
  },
}
