return {
  { "nvim-tree/nvim-web-devicons", enabled = false },
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      opts.presets = {
        command_palette = {
          views = {
            cmdline_popup = {
              position = {
                row = "50%",
                col = "50%",
              },
              size = {
                min_width = 60,
                width = "auto",
                height = "auto",
              },
            },
            cmdline_popupmenu = {
              position = {
                row = "67%",
                col = "50%",
              },
            },
          },
        },
      }
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
          show_hidden_count = true,
          hide_dotfiles = false,
          hide_gitignored = true,
          hide_by_name = {
            -- '.git',
            -- '.DS_Store',
            -- 'thumbs.db',
          },
          never_show = {},
        },
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      return {
        options = {
          icons_enabled = true,
          theme = "auto",
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          globalstatus = false,
          refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
          },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { "filename" },
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "filename" },
          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {},
      }
    end,
  },
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        -- dashboard configuration
        preset = {

          header = [[
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣤⣤⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣾⠿⠋⠉⠉⢿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣴⡿⠛⠁⠀⠀⠀⠀⠀⢿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣴
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣴⣾⡿⠟
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣾⡿⠛⠉⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣶⣶⣤⣤⣤⣀⣀⠀⠀⠀⣤⣶⣿⠟⠋⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣿⣿⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡤⠤⠿⡻⠛⠉⠉⠛⠛⢿⠿⣿⣷⣿⣿⠟⠁⠀⠀⠀⠀⠀⠀⡼
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠇⠹⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡴⠋⠀⣠⠎⠀⠀⠀⠀⢀⡔⠃⠀⢀⡞⠉⠁⠀⠀⠀⠀⠀⠀⢀⡜⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡞⠀⠀⣰⠃⠀⠀⠀⠀⡰⠋⠀⠀⣠⠊⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣁⢀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣾⣿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⣰⠃⠀⠀⠀⠀⡜⠁⠀⠀⡰⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢀⣴
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⡟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣦⡴⠃⠀⠀⠀⠀⢸⠀⠀⠀⡰⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣅
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⣿⢿⣿⣿⠋⠀⠀⠀⠀⠀⠀⢀⣠⣶⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠳⠶⠚⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈
⠀⠀⠀⠀⠀⠀⠀⣴⡿⠿⢿⣷⣦⣄⠀⣿⠃⠀⠈⠁⠀⠀⠀⠀⠀⠀⣰⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⢀⣤⣤⣼⣿⠀⠀⠀⣿⣿⣿⣿⣿⣄⡀⠀⠀⠀⠀⠀⠀⠀⣸⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣴⣾⣿⣶⣤⡀⠀⠀⠀⠀⠀⠀
⠀⢀⣴⣿⠛⠉⠉⠉⠀⠀⠀⠉⠙⢛⠛⠿⣿⣿⣦⣄⠀⠀⠀⠀⠀⢿⣿⣿⣿⣿⣿⡟⠀⠀⠀⠐⠀⠀⠀⠀⠀⠀⠂⠠⡀⠀⠀⠀⠀⠀⠀⣾⣿⣿⣿⣿⣿⣿⣿⡄⠀⠀⠀⠀⠀
⣴⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠳⢤⡈⠙⠿⣿⣿⣶⣄⡀⠀⠈⠛⠻⠿⠟⠋⠀⡠⢡⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀
⣿⡇⠀⠀⠀⣠⡾⣛⣿⣶⡀⠀⠀⠀⠀⠀⠉⠓⠤⡈⠉⠻⢿⣿⣶⣄⡀⠀⠀⠀⠀⠐⠀⠸⣄⠀⠀⠀⢠⡄⠀⠀⠀⠀⢀⡀⠀⠡⠀⠀⠀⢿⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀⠀⠀
⣿⡇⠀⠀⢰⡟⢰⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠁⠂⢄⡑⠢⢀⠉⠻⢿⣿⣦⣄⡀⠀⠀⠀⠀⠈⠓⠒⠚⠁⠙⢄⣀⣀⣠⠞⠁⠀⠀⡀⠀⠀⠈⠻⢿⣿⣿⣿⠿⠛⠀⠀⠀⠀⠀⠀
⣿⡇⠀⠀⠘⣷⡘⣿⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠑⠠⢁⠂⠀⠈⠛⠿⣿⣶⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⣿⡇⠀⠀⠀⠈⠛⠿⠟⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⠀⠀⠀⢹⠛⠻⣿⣶⣤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡐⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⣿⠉⣿⣿⣶⣤⡀⣀⣤⣤⣄⣀⠀⠀⠊⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⣿⡇⠀⠀⠀⠀⠀⣿⣖⠀⠀⣈⠀⠀⠀⠈⠙⠲⢤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⣿⠀⣿⠀⢸⠛⢿⣿⡿⠛⠿⢿⣿⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⣿⡇⠀⠀⠳⣦⡀⠀⠀⢀⠔⠀⠀⠀⠀⠀⠀⠀⢸⠈⠛⠳⣤⣀⠀⠀⠀⠀⠀⢸⡀⠀⣿⠀⣿⠀⢸⠀⠈⣏⠛⣶⣄⡀⠈⢿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⣿⡇⢀⠀⠀⠀⠉⠉⠉⠁⠀⠀⣠⣤⣤⣄⡀⠀⢸⠀⠀⠀⡇⠈⡟⠲⢤⣀⠀⠸⣷⣄⣿⠀⣿⠀⢸⠀⠀⣿⠀⣿⠀⠉⠓⠺⣿⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⢿⣿⣬⠑⠒⢤⣄⣀⣀⣤⡤⢦⣅⠉⠛⢯⣽⣳⣾⣄⡁⠀⡇⠀⡇⠀⠀⠈⠙⠲⢬⡙⠻⣿⣿⣦⣼⡀⠀⣿⠀⣿⠀⠀⠀⠀⠈⢿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠈⠛⠿⣿⣶⣤⣀⡉⠛⢦⣄⡀⠈⠙⠶⣤⣈⠙⠻⢿⣿⣷⣧⣀⡇⠀⠀⠀⠀⠀⠀⠈⠙⠲⢌⡙⠿⣿⣿⣿⣀⣾⠀⠀⠀⠀⠀⢸⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠉⠛⠿⣿⣷⣶⣬⣙⡳⠄⠀⠀⠉⠙⠶⣤⣈⠙⠳⣯⣻⡶⣤⣀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠲⢬⣛⠿⣿⠀⠀⠀⠀⠀⠈⣿⡇⠀⠀⠀⠀⠀⠀⠰⣄⠀⠀⠀⠀⢀⡶⠶
⠀⠀⠀⠀⠀⠀⠀⠀⠙⠛⠿⣿⣿⣿⣶⣤⣄⡀⠀⠀⠙⠷⢦⣤⡈⠙⠶⣽⣓⣦⣄⡀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠲⢤⣀⠀⠀⠀⠀⣿⡇⠀⠒⢀⠀⠀⠀⢀⠈⠳⢤⣀⣀⣼⠇⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠛⣿⣿⡿⠿⠿⠿⠶⣶⣦⣈⡙⠓⢦⣄⣉⣿⣬⠿⠷⠦⣤⣤⣤⣄⣀⠀⠀⠀⠀⠈⠙⠲⣤⣠⣿⣿⠀⠀⠀⠑⠂⠐⠋⠀⠀⠀⠉⠉⠁⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⡏⠀⠀⠀⠀⠀⠀⠉⢻⣿⡶⠋⠉⠁⠀⠀⠀⠀⠀⠀⠈⠉⠙⠻⣿⣦⣄⠀⠀⠀⠀⣿⣿⣿⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠻⣷⣤⡀⢀⣿⡏⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⢿⣾⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
          ]],
        },
      },
    },
  },
}
