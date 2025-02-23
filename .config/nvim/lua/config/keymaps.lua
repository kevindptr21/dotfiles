-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap

-- Move cursor using h,j,k,l when insert mode
keymap.set("i", "<D-H>", "<Left>", { desc = "Move left", remap = true })
keymap.set("i", "<D-J>", "<Down>", { desc = "Move down", remap = true })
keymap.set("i", "<D-K>", "<Up>", { desc = "Move up", remap = true })
keymap.set("i", "<D-L>", "<Right>", { desc = "Move right", remap = true })

-- Move to window using the <ctrl> hjkl keys
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Move Lines
keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })

-- lazy
keymap.set("n", "<leader>lv", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- new file
keymap.set("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

-- incr & decr number
keymap.set("n", "+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "-", "<C-x>", { desc = "Decrement number" })

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Split Window
keymap.set("n", "sh", ":split<Return>", { noremap = true, silent = true, desc = "Split window horizontally" })
keymap.set("n", "sv", ":vsplit<Return>", { noremap = true, silent = true, desc = "Split window vertically" })
keymap.set("n", "\\", ":split<Return>", { noremap = true, silent = true, desc = "Split window horizontally" })
keymap.set("n", "|", ":vsplit<Return>", { noremap = true, silent = true, desc = "Split window vertically" })
keymap.set("n", "sx", "<cmd>close<CR>", { noremap = true, silent = true, desc = "Close current split" })

-- Resize Window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- Close Insert Mode
keymap.set("i", "jk", "<Esc>")

-- -- Multi cursor
-- keymap.set("i", "<C-d>", function()
--   local new_text = vim.fn.input("Replace with?: ")
--   local cmd = "normal! *Ncgn" .. new_text
--   vim.cmd(cmd)
-- end, { desc = "ctrl+d vs code alternative" })
--
