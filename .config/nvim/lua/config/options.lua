-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

vim.g.snacks_animate = false
vim.g.lazyvim_prettier_needs_config = false

-- Editor Config
-- Tab and Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- Searching
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true

-- Text Rendering
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.wrap = false

-- UI
opt.cursorline = true
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.splitright = true
opt.splitbelow = true
opt.relativenumber = true
opt.number = true
opt.scrolloff = 8

-- MISC
opt.backspace = "indent,eol,start"
opt.spell = true
opt.spelllang = { "en_us" }
