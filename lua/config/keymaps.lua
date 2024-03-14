vim.g.mapleader = " " -- set leader key to space

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- remove the arrow keys to force myself to use hjkl
keymap.set({ "n", "v", "i" }, "<up>", "<Nop>", opts)
keymap.set({ "n", "v", "i" }, "<down>", "<Nop>", opts)
keymap.set({ "n", "v", "i" }, "<left>", "<Nop>", opts)
keymap.set({ "n", "v", "i" }, "<right>", "<Nop>", opts)

-- use jk to exit insert mode
-- using better-escape.nvim now
-- keymap.set("i", "jk", "<ESC>", opts)

-- select all
keymap.set("n", "<C-a>", "ggVG<cr>", opts)

-- paste without replacing clipboard
keymap.set("v", "p", '"_dP', opts)

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", opts)

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", opts) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", opts) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", opts) -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>", opts) -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>", opts) -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>", opts) -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>", opts) --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>", opts) --  go to previous tab

-- indent
keymap.set("n", "<leader><Tab>", ">>", opts)
keymap.set("n", "<leader><S-Tab>", "<<", opts)
keymap.set("v", "<leader><Tab>", ">gv", opts)
keymap.set("v", "<leader><S-Tab>", "<gv", opts)
