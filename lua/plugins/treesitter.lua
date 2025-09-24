return {
  "nvim-treesitter/nvim-treesitter",
  branch = 'master',
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = {"bash", "c", "cpp", "html", "lua", "python", "yaml"},
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
