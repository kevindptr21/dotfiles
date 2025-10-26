---Ported from: https://github.com/scottmckendry/cyberdream.nvim
---@module "picker.assets.colorschemes.cyberdream"
---@author kevindptr
---@license GNU-GPLv3

---@class PickList
local M = {}

local color = require("utils").fn.color

M.scheme = {
  foreground = "#ffffff",
  background = "#16181a",
  cursor_bg = "#ffffff",
  cursor_fg = "#16181a",
  cursor_border = "#ffffff",
  selection_fg = "#ffffff",
  selection_bg = "#3c4048",
  scrollbar_thumb = "#16181a",
  split = "#16181a",
  ansi = {
    "#16181a",
    "#ff6e5e",
    "#5eff6c",
    "#f1ff5e",
    "#5ea1ff",
    "#bd5eff",
    "#5ef1ff",
    "#ffffff",
  },
  brights = {
    "#3c4048",
    "#ff6e5e",
    "#5eff6c",
    "#f1ff5e",
    "#5ea1ff",
    "#bd5eff",
    "#5ef1ff",
    "#ffffff",
  },
  indexed = { [16] = "#ffbd5e", [17] = "#ff6e5e" },
  compose_cursor = "#FF5C57",
  copy_mode_active_highlight_bg = { Color = "#2A2D40" },
  copy_mode_active_highlight_fg = { Color = "#E4E4E4" },
  copy_mode_inactive_highlight_bg = { Color = "#33364A" },
  copy_mode_inactive_highlight_fg = { Color = "#E4E4E4" },
  quick_select_label_bg = { Color = "#FF5C57" },
  quick_select_label_fg = { Color = "#0F111B" },
  quick_select_match_bg = { Color = "#F3F99D" },
  quick_select_match_fg = { Color = "#0F111B" },
  visual_bell = "#2A2D40",
  tab_bar = {
    background = "#16181a",
    inactive_tab_edge = "#1C1E30",
    active_tab = { fg_color = "#E4E4E4", bg_color = "#1F1F28" },
    inactive_tab = { fg_color = "#F1F1F0", bg_color = "#33364A" },
    inactive_tab_hover = { fg_color = "#57C7FF", bg_color = "#33364A" },
    new_tab = { fg_color = "#000000", bg_color = "#ffffff" },
    new_tab_hover = { fg_color = "#E4E4E4", bg_color = "#1F1F28", intensity = "Bold" },
  },
}

function M.get()
  return { id = "cyberdream", label = "CyberDream Theme" }
end

function M.activate(Config, callback_opts)
  local theme = M.scheme
  color.set_scheme(Config, theme, callback_opts.id)
end

return M
