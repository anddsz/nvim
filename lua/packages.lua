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
    -- Packer
    use 'wbthomason/packer.nvim'

    -- Language Server Protocol
    use 'williamboman/nvim-lsp-installer'

    use 'nvim-treesitter/nvim-treesitter'



    use {
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
    }



    -- Utilities
    use {
        'vim-airline/vim-airline',
        requires = { 
            'vim-airline/vim-airline-themes',
            'ryanoasis/vim-devicons',
        },
    }
    use 'preservim/nerdtree'
    use 'preservim/tagbar'
    use 'tpope/vim-commentary'
    use 'tpope/vim-surround'
    use {
        'windwp/nvim-autopairs',
        config = function() require('plugins.nvim-autopairs') end 
    }
    use {
        'nvim-telescope/telescope.nvim', requires = {
            'nvim-lua/plenary.nvim' 
        },
    }

    -- Visuals
    use 'sainnhe/gruvbox-material'

    if packer_bootstrap then
        require('packer').sync()
    end
end)
