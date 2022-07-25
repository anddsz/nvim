local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)

    -- Packer
    use 'wbthomason/packer.nvim'

    use {
        'nvim-treesitter/nvim-treesitter',
        config = require('plugin.treesitter'),
    }

    -- Utilities
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 
            'kyazdani42/nvim-web-devicons',
        },
        config = require('plugin.lualine'),
    }

    use {
        'kyazdani42/nvim-tree.lua',
        config = require('plugin.tree'),
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
        config = require('plugin.coc'),
    }

    use {
        'lukas-reineke/indent-blankline.nvim',
        config = require('plugin.indent-blankline'),
    }

    use {
        'numToStr/Comment.nvim',
        config = require('plugin.comment'),
    }

    -- Visuals
    use 'morhetz/gruvbox'

    if packer_bootstrap then
        require('packer').sync()
    end
end)
