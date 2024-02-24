vim.opt.clipboard = "unnamedplus"
vim.opt.tabstop = 4 
vim.opt.softtabstop = 4
vim.opt.relativenumber = true
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.hidden = true
vim.opt.nu = true
vim.opt.wrap = false
vim.opt.hlsearch = false
vim.opt.eb = false
vim.opt.smartcase = true
vim.opt.swapfile  = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"
vim.opt.cursorline = true

local prefix = vim.env.XDG_CONFIG_HOME or vim.fn.expand("~/.config")
vim.opt.undodir = { prefix .. '/nvim/undodir' }

vim.g.mapleader = ","

