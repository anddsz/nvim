vim.o.termguicolors = true

vim.cmd[[colorscheme gruvbox]]
require('lualine').setup{
    options = {
        theme = 'gruvbox',
    },
}
