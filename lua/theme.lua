vim.o.termguicolors = true
<<<<<<< HEAD
vim.g.tokyonight_style = "night"
vim.cmd[[colorscheme tokyonight]]

require('lualine').setup{
    options = {
        theme = 'tokyonight',
=======

vim.cmd[[colorscheme gruvbox]]
require('lualine').setup{
    options = {
        theme = 'gruvbox',
>>>>>>> 53d1aeb (23-03-22)
    },
}
