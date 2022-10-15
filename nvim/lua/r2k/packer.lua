local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- Bufferline
  use {
    'akinsho/bufferline.nvim',
    tag = "v2.*",
    config = function()
      require("bufferline").setup{
        options = {
          indicator = {
            style = 'none'
          },
          show_buffer_icons = false,
          show_buffer_close_icons = false
        }
      }
    end
  }

  --
  -- Themes
  --
  use {
	  'sainnhe/gruvbox-material'
  }

  --
  -- Nvim-Tree
  --
  use {
    'nvim-tree/nvim-tree.lua',
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  --
  -- Treesitter
  --
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }

  --
  -- Telescope
  --

	use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
	-- or                            , branch = '0.1.x',
	  requires = {'nvim-lua/plenary.nvim'}
	}

  --
  -- LazyGit
  --
    use {
	    'kdheepak/lazygit.nvim'
    }

  --
  -- LSP
  --
  use {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
    'hrsh7th/nvim-cmp', -- Autocompletion plugin
    'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
    'hrsh7th/cmp-buffer', -- Autocomplete in buffer
    'saadparwaiz1/cmp_luasnip', -- snippets
    'rafamadriz/friendly-snippets' -- Collection of snippets
  }
  use{"L3MON4D3/LuaSnip", tag = "v1.*"}


  --
  -- Comment.vim
  --
  use {
      'numToStr/Comment.nvim',
      config = function()
          require('Comment').setup()
      end
  }

  --
  -- Surround.vim
  --
  use {
    'tpope/vim-surround'
  }

  -- Colors in Buffer
  --
  use {
    'norcalli/nvim-colorizer.lua',
  }


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
