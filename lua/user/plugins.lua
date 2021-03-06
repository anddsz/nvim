local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

return require('packer').startup(function(use)
    -- Packer
    use 'wbthomason/packer.nvim'

    use 'nvim-treesitter/nvim-treesitter'

    use 'nvim-lualine/lualine.nvim'
    use 'akinsho/bufferline.nvim'

    use 'kyazdani42/nvim-tree.lua'
    use 'kyazdani42/nvim-web-devicons'

    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            'nvim-lua/plenary.nvim' 
        },
    }

    use 'neovim/nvim-lspconfig'

    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-vsnip',
            'hrsh7th/vim-vsnip'
        },
    }

    use 'lukas-reineke/indent-blankline.nvim'

    use 'numToStr/Comment.nvim'

    -- Visuals
    use 'sainnhe/gruvbox-material'

    if packer_bootstrap then
        require('packer').sync()
    end
end)
