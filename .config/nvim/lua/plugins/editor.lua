return {
  { "nvim-tree/nvim-web-devicons" },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "echasnovski/mini.icons" },
    opts = function()
      local utils = require("core.utils")
      local copilot_colors = {
        [""] = utils.get_hlgroup("Comment"),
        ["Normal"] = utils.get_hlgroup("Comment"),
        ["Warning"] = utils.get_hlgroup("DiagnosticError"),
        ["InProgress"] = utils.get_hlgroup("DiagnosticWarn"),
      }

      local filetype_map = {
        lazy = { name = "lazy.nvim", icon = "💤" },
        minifiles = { name = "minifiles", icon = "🗂️ " },
        snacks_terminal = { name = "terminal", icon = "🐚" },
        mason = { name = "mason", icon = "🔨" },
        TelescopePrompt = { name = "telescope", icon = "🔍" },
        ["copilot-chat"] = { name = "copilot", icon = "🤖" },
      }

      return {
        options = {
          component_separators = { left = " ", right = " " },
          section_separators = { left = " ", right = " " },
          theme = "auto",
          globalstatus = true,
          disabled_filetypes = { statusline = { "dashboard", "alpha" } },
        },
        sections = {
          lualine_a = {
            {
              "mode",
              icon = "",
              fmt = function(mode)
                return mode:lower()
              end,
            },
          },
          lualine_b = { { "branch", icon = "" } },
          lualine_c = {
            {
              "diagnostics",
              symbols = {
                error = " ",
                warn = " ",
                info = " ",
                hint = "󰝶 ",
              },
            },
            {
              function()
                local devicons = require("nvim-web-devicons")
                local ft = vim.bo.filetype
                local icon
                if filetype_map[ft] then
                  return " " .. filetype_map[ft].icon
                end
                if icon == nil then
                  icon = devicons.get_icon(vim.fn.expand("%:t"))
                end
                if icon == nil then
                  icon = devicons.get_icon_by_filetype(ft)
                end
                if icon == nil then
                  icon = " 󰈤"
                end

                return icon .. " "
              end,
              color = function()
                local _, hl = require("nvim-web-devicons").get_icon(vim.fn.expand("%:t"))
                if hl then
                  return hl
                end
                return utils.get_hlgroup("Normal")
              end,
              separator = "",
              padding = { left = 0, right = 0 },
            },
            {
              "filename",
              padding = { left = 0, right = 0 },
              fmt = function(name)
                if filetype_map[vim.bo.filetype] then
                  return filetype_map[vim.bo.filetype].name
                else
                  return name
                end
              end,
            },
            {
              function()
                local buffer_count = require("core.utils").get_buffer_count()

                return "+" .. buffer_count - 1 .. " "
              end,
              cond = function()
                return require("core.utils").get_buffer_count() > 1
              end,
              color = utils.get_hlgroup("Operator", nil),
              padding = { left = 0, right = 1 },
            },
            {
              function()
                local tab_count = vim.fn.tabpagenr("$")
                if tab_count > 1 then
                  return vim.fn.tabpagenr() .. " of " .. tab_count
                end
              end,
              cond = function()
                return vim.fn.tabpagenr("$") > 1
              end,
              icon = "󰓩",
              color = utils.get_hlgroup("Special", nil),
            },
            {
              function()
                return require("nvim-navic").get_location()
              end,
              cond = function()
                return package.loaded["nvim-navic"] and require("nvim-navic").is_available()
              end,
              color = utils.get_hlgroup("Comment", nil),
            },
          },
          lualine_x = {
            {
              ---@diagnostic disable: undefined-field
              require("noice").api.status.mode.get,
              cond = function()
                local ignore = {
                  "-- INSERT --",
                  "-- TERMINAL --",
                  "-- VISUAL --",
                  "-- VISUAL LINE --",
                  "-- VISUAL BLOCK --",
                }
                local mode = require("noice").api.status.mode.get()
                return require("noice").api.status.mode.has() and not vim.tbl_contains(ignore, mode)
              end,
              color = utils.get_hlgroup("Comment"),
              ---@diagnostic enable: undefined-field
            },
            {
              require("lazy.status").updates,
              cond = require("lazy.status").has_updates,
              color = utils.get_hlgroup("String"),
            },
            {
              function()
                local icon = " "
                local status = require("copilot.api").status.data
                return icon .. (status.message or "")
              end,
              cond = function()
                local ok, clients = pcall(vim.lsp.get_clients, { name = "copilot", bufnr = 0 })
                return ok and #clients > 0
              end,
              color = function()
                if not package.loaded["copilot"] then
                  return
                end
                local status = require("copilot.api").status.data
                return copilot_colors[status.status] or copilot_colors[""]
              end,
            },
            { "diff" },
          },
          lualine_y = {
            {
              "progress",
            },
            {
              "location",
              color = utils.get_hlgroup("Boolean"),
            },
          },
          lualine_z = {},
        },
      }
    end,
  },
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      opts.presets = {
        command_palette = {
          views = {
            cmdline_popup = {
              position = {
                row = 25,
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
                -- row = "67%",
                row = 28,
                col = "50%",
              },
            },
          },
        },
        long_message_to_split = true, -- long messages will be sent to a split
        lsp_doc_border = true,
      }
    end,
  },
  -- {
  --   "nvim-telescope/telescope-file-browser.nvim",
  --   dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  -- },
  {
    "folke/snacks.nvim",
    opts = {
      styles = {
        input = {
          backdrop = false,
          position = "float",
          border = "rounded",
          title_pos = "center",
          height = 1,
          width = 60,
          relative = "editor",
          noautocmd = true,
          row = 20,
        },
      },
      -- explorer = {},
      -- picker = {
      --   sources = {
      --     explorer = {},
      --   },
      -- },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
  },
  -- maybe need in the future
  -- {
  --   "shellRaining/hlchunk.nvim",
  --   event = { "BufReadPre", "BufNewFile" },
  --   config = function()
  --     require("hlchunk").setup({
  --       chunk = {
  --         enable = true,
  --       },
  --     })
  --   end,
  -- },
  -- Yazi
  {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    -- dependencies = { "folke/snacks.nvim", lazy = true },
    keys = {
      -- 👇 in this section, choose your own keymappings!
      {
        -- "<leader>-",
        "<leader>e",
        mode = { "n", "v" },
        "<cmd>Yazi<cr>",
        desc = "Open yazi at the current file",
      },
      {
        -- Open in the current working directory
        "<leader>cw",
        "<cmd>Yazi cwd<cr>",
        desc = "Open the file manager in nvim's working directory",
      },
      {
        "<c-up>",
        "<cmd>Yazi toggle<cr>",
        desc = "Resume the last yazi session",
      },
    },
    opts = {
      -- if you want to open yazi instead of netrw, see below for more info
      open_for_directories = false,
      keymaps = {
        show_help = "<f1>",
      },
    },
    -- 👇 if you use `open_for_directories=true`, this is recommended
    init = function()
      -- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
      -- vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
    end,
  },
}
