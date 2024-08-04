require('plugins')

--------------------------
-- General configs
--------------------------
vim.g.mapleader = " "

vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.smartindent = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.colorcolumn = "80"
vim.opt.signcolumn = "auto:1"

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

--------------------------
-- Keymap
--------------------------
vim.keymap.set("n", "<C-n>", vim.cmd.noh)
