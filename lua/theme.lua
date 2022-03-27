vim.o.termguicolors = true

vim.g.tokyonight_style = "night"

vim.cmd[[colorscheme tokyonight]]
require('lualine').setup{
    options = {
        theme = 'tokyonight',
    },
}
