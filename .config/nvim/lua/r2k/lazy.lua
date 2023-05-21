local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        'rebelot/kanagawa.nvim',
        name = 'kanagawa',
        lazy = false,
        priority = 1000,
        config = function()
            require("kanagawa").load("wave")
        end
    },

    -- Telescope
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    -- Treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate",
    },

    -- Lsp
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            {
                'L3MON4D3/LuaSnip',
                version = '1.*',
            },
            { 'rafamadriz/friendly-snippets' },
        }
    },

    -- Others
    { 'theprimeagen/harpoon' },
    { 'mbbill/undotree' },
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    },
    { 'tpope/vim-surround' },
    { 'kdheepak/lazygit.nvim' },
})
