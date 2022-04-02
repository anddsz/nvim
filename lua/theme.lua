vim.o.termguicolors = true

vim.g.tokyonight_style = "night"
require('lualine').setup{
    options = { theme = 'tokyonight' }
}

vim.cmd[[colorscheme tokyonight]]
