return {
  {
    "rose-pine/neovim",
    name = "Rose Pine",
    lazy = false,
    -- name = "rose-pine",
    -- lazy = false,
    -- -- priority = 1000,
    -- enabled = false,
    -- config = function()
    --   local rosepine = require("rose-pine")
    --
    --   rosepine.setup({
    --     styles = {
    --       bold = false,
    --       italic = false,
    --     },
    --   })
    --
    --   vim.cmd.colorscheme("rose-pine")
    -- end,
  },
  {
    "sainnhe/sonokai",
    lazy = false,
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
  },
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    config = function()
      require("cyberdream").setup({
        transparent = true,
        italic_comments = false,
        hide_fillchars = true,
        terminal_colors = false,
        cache = true,
        borderless_telescope = { border = false, style = "flat" },
        theme = {
          variant = "auto",
          overrides = function(c)
            return {
              CursorLine = { bg = c.bg },
              CursorLineNr = { fg = c.magenta },
            }
          end,
        },
      })
    end,
  },
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        transparent_background = true,
        italic_comments = false,
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
    },
  },
}
