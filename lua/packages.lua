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

    use {
        'nvim-treesitter/nvim-treesitter',
        config = require('plugins.treesitter'),
    }

    -- Utilities
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 
            'kyazdani42/nvim-web-devicons',
        },
        config = require('plugins.lualine'),
    }

    use {
        'kyazdani42/nvim-tree.lua',
        config = require('plugins.tree'),
    }

    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            'nvim-lua/plenary.nvim' 
        },
    }

    use {
        'neoclide/coc.nvim',
        branch = 'release',
        config = require('plugins.coc'),
    }

    -- Visuals
    use 'joshdick/onedark.vim'

    if packer_bootstrap then
        require('packer').sync()
    end
end)
