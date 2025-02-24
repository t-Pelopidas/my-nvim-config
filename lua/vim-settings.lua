vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set ruler")
vim.cmd("set cindent")
vim.cmd("set smartindent")
vim.cmd("set mouse=")


vim.g.mapleader = " "

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")


vim.keymap.set("v", "<leader>y", '\"+y')

vim.wo.number = true

vim.opt.relativenumber = true

vim.opt.hlsearch = false

vim.opt.termguicolors = true

