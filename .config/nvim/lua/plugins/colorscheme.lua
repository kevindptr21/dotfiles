return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    enabled = false,
    config = function()
      local rosepine = require("rose-pine")

      rosepine.setup({
        styles = {
          bold = false,
          italic = false,
        },
      })

      vim.cmd.colorscheme("rose-pine")
    end,
  },
  {
    "sainnhe/sonokai",
    event = "VeryLazy",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.sonokai_style = "andromeda"
      vim.cmd.colorscheme("sonokai")
    end,
  },
}
