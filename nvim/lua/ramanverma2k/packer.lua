local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  -- Packer Plugin Manager
  use("wbthomason/packer.nvim")

  -- Tokyonight Theme
  use ("folke/tokyonight.nvim")

  -- Barbar plugin for Tabline
  use {
    "romgrk/barbar.nvim",
    -- requires = {'kyazdani42/nvim-web-devicons'} // For file icons on tabline
  }

  -- Vim-Surround
  use("tpope/vim-surround")

  -- Telescope for Fuzzy Finding and preview
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Treesitter (Code Highlighting)
  use("nvim-treesitter/nvim-treesitter", {
      run = ":TSUpdate"
  })

  -- Native Lsp, config & snippets
  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin

  -- Emmet support 
  use 'mattn/emmet-vim'

  -- Lspsaga
  use({
      "glepnir/lspsaga.nvim",
      branch = "main",
  })

  -- LazyGit
  use('kdheepak/lazygit.nvim')

  -- Comment
  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }

  -- Prettier
  use {
    'prettier/vim-prettier',
    run = 'yarn install --frozen-lockfile --production',
  }

  use {
    'norcalli/nvim-colorizer.lua'
  }

  -- Lsp Lines
  use {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  }

  -- ALE
  use 'dense-analysis/ale'

  if packer_bootstrap then
    require('packer').sync()
  end
end)
