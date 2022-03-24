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
        config = function() require('plugins.telescope') end
    })

    use({
        'neovim/nvim-lspconfig',
        requires = {
<<<<<<< HEAD
            'hrsh7th/nvim-cmp',
=======
>>>>>>> 53d1aeb (23-03-22)
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
<<<<<<< HEAD
            'hrsh7th/cmp-vsnip',
            'hrsh7th/vim-vsnip'
        },
        config = function() require('plugins.nvim-lspconfig') end
=======
            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-vsnip',
            'hrsh7th/vim-vsnip'
        },
        config = function() require('plugins.lsp') end
>>>>>>> 53d1aeb (23-03-22)
    })

    use({
        'nvim-lualine/lualine.nvim',
<<<<<<< HEAD
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
=======
        requires = { 'ryanoasis/vim-devicons', opt = true },
>>>>>>> 53d1aeb (23-03-22)
    })

    use({
        'akinsho/bufferline.nvim',
        config = function() require('plugins.bufferline') end
    })

    use 'williamboman/nvim-lsp-installer'
<<<<<<< HEAD
    use 'folke/tokyonight.nvim'
=======

    use 'morhetz/gruvbox'
>>>>>>> 53d1aeb (23-03-22)

    use 'ap/vim-css-color'

  if packer_bootstrap then
    require('packer').sync()
  end
end)
