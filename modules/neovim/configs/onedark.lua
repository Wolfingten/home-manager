require('onedark').setup({
  style = 'darker'
})

require('onedark').load()

vim.o.termguicolors = true
vim.cmd'colorscheme onedark'
