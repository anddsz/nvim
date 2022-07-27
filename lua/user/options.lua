local settings = {
    backup = false,
    completeopt = { "menu", "menuone", "noselect" },
    conceallevel = 0,
    fileencoding = "utf-8",
    hlsearch = true,
    ignorecase = true,
    smartcase = true,
    smartindent = true,
    swapfile = false,
    updatetime = 300,
    writebackup = false,
    expandtab = true,
    shiftwidth = 4,
    tabstop = 4,
    cursorline = true,
    number = true,
    relativenumber = true,
    numberwidth = 4,
    wrap = false,
    scrolloff = 8,
    sidescrolloff = 8,
    termguicolors = true,
}

vim.opt.shortmess:append "c"

for option, parameter in pairs(settings) do
    vim.opt[option] = parameter
end
