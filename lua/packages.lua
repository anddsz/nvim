local fn = vim.fn
local cmd = vim.cmd

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end
]])

cmd([[packadd packer.nvim]])
return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'preservim/nerdtree'
    use 'preservim/tagbar'

    use({
        'windwp/nvim-autopairs',
        config = function() require('plugins.nvim-autopairs') end
    })

    use({
        'nvim-telescope/telescope.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        },
    })

    use({
        'neovim/nvim-lspconfig',
        requires = {
            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-vsnip',
            'hrsh7th/vim-vsnip'
        },
        config = function() require('plugins.nvim-lspconfig') end
    })

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use 'tpope/vim-commentary'
    use 'tpope/vim-surround'

    use 'nvim-treesitter/nvim-treesitter'

    use 'williamboman/nvim-lsp-installer'

    use 'folke/tokyonight.nvim'
    use 'ap/vim-css-color'

    if packer_bootstrap then
        require('packer').sync()
    end
end)