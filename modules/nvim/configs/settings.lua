vim.g.mapleader = " "

vim.g.python3_host_prog=vim.fn.expand("~/.python_environments/NVIM/bin/python3")

vim.opt.signcolumn = "yes:1" -- always show sign column to avoid screen shift

vim.opt.conceallevel = 1 -- so that `` is visible in markdown files

vim.o.termguicolors = true -- set term gui colors most terminals support this
