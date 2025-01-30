---Ported from: https://github.com/Gogh-Co/Gogh
---@module "picker.assets.colorschemes.sonokai"
---@author kevindptr
---@license GNU-GPLv3

---@class PickList
local M = {}

local color = require("utils").fn.color

M.scheme = {
  foreground = "#F2F2F2",
  background = "#2C2E34",
  cursor_bg = "#F2F2F2",
  cursor_fg = "#2C2E34",
  cursor_border = "#F2F2F2",
  selection_bg = "#4E5173",
  selection_fg = "#F2F2F2",
  scrollbar_thumb = "#4B4E6D",
  split = "#3B3D52",
  ansi = {
    "#3B3F4F",
    "#F65866",
    "#A7DF78",
    "#FFD580",
    "#82AAFF",
    "#C792EA",
    "#89DDFF",
    "#E5E5E5",
  },
  brights = {
    "#545C7E",
    "#FF5370",
    "#C3E88D",
    "#FFCB6B",
    "#69DDFF",
    "#C792EA",
    "#89DDFF",
    "#FFFFFF",
  },
  indexed = {},
  compose_cursor = "#F7768E",
  copy_mode_active_highlight_bg = { Color = "#4E5173" },
  copy_mode_active_highlight_fg = { Color = "#F2F2F2" },
  copy_mode_inactive_highlight_bg = { Color = "#4B4E6D" },
  copy_mode_inactive_highlight_fg = { Color = "#F2F2F2" },
  quick_select_label_bg = { Color = "#F65866" },
  quick_select_label_fg = { Color = "#2C2E34" },
  quick_select_match_bg = { Color = "#FFD580" },
  quick_select_match_fg = { Color = "#2C2E34" },
  visual_bell = "#4E5173",
  tab_bar = {
    background = "#2C2E34",
    inactive_tab_edge = "#3B3D52",
    active_tab = { fg_color = "#F2F2F2", bg_color = "#3B3F4F" },
    inactive_tab = { fg_color = "#E5E5E5", bg_color = "#4B4E6D" },
    inactive_tab_hover = { fg_color = "#82AAFF", bg_color = "#4B4E6D" },
    new_tab = { fg_color = "#82AAFF", bg_color = "#2C2E34" },
    new_tab_hover = { fg_color = "#82AAFF", bg_color = "#2C2E34", intensity = "Bold" },
  },
}
function M.get()
  return { id = "sonokai", label = "Sonokai (Gogh)" }
end

function M.activate(Config, callback_opts)
  local theme = M.scheme
  color.set_scheme(Config, theme, callback_opts.id)
end

return M

------Ported from: https://github.com/Gogh-Co/Gogh
------@module "picker.assets.colorschemes.sonokai"
------@author kevindptr
------@license GNU-GPLv3
---
------@class PickList
---local M = {}
---
---local color = require("utils").fn.color
---
---M.scheme = {
---  foreground = "#E3E5E8",
---  background = "#1A1B26",
---  cursor_bg = "#E3E5E8",
---  cursor_fg = "#1A1B26",
---  cursor_border = "#E3E5E8",
---  selection_bg = "#2D4F67",
---  selection_fg = "#E3E5E8",
---  scrollbar_thumb = "#4B5263",
---  split = "#3C4354",
---  ansi = {
---    "#3B3F51",
---    "#F7768E",
---    "#9ECE6A",
---    "#E0AF68",
---    "#7AA2F7",
---    "#BB9AF7",
---    "#7DCFFF",
---    "#A9B1D6",
---  },
---  brights = {
---    "#545c7e",
---    "#FF6077",
---    "#A3E430",
---    "#FFC777",
---    "#6FBBFF",
---    "#C099FF",
---    "#B4F0FF",
---    "#C0CAF5",
---  },
---  indexed = {},
---  compose_cursor = "#F7768E",
---  copy_mode_active_highlight_bg = { Color = "#2D4F67" },
---  copy_mode_active_highlight_fg = { Color = "#E3E5E8" },
---  copy_mode_inactive_highlight_bg = { Color = "#4B5263" },
---  copy_mode_inactive_highlight_fg = { Color = "#E3E5E8" },
---  quick_select_label_bg = { Color = "#F7768E" },
---  quick_select_label_fg = { Color = "#1A1B26" },
---  quick_select_match_bg = { Color = "#E0AF68" },
---  quick_select_match_fg = { Color = "#1A1B26" },
---  visual_bell = "#2D4F67",
---  tab_bar = {
---    background = "#1A1B26",
---    inactive_tab_edge = "#3C4354",
---    active_tab = { fg_color = "#C0CAF5", bg_color = "#3B3F51" },
---    inactive_tab = { fg_color = "#A9B1D6", bg_color = "#4B5263" },
---    inactive_tab_hover = { fg_color = "#7AA2F7", bg_color = "#4B5263" },
---    new_tab = { fg_color = "#7AA2F7", bg_color = "#1A1B26" },
---    new_tab_hover = { fg_color = "#7AA2F7", bg_color = "#1A1B26", intensity = "Bold" },
---  },
---}
---function M.get()
---  return { id = "sonokai", label = "Sonokai (Gogh)" }
---end
---
---function M.activate(Config, callback_opts)
---  local theme = M.scheme
---  color.set_scheme(Config, theme, callback_opts.id)
---end
---
---return M
