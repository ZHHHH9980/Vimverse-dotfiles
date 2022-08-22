local packer = require('packer')

packer.startup(function(use)
    -- Packer 可以管理自己本身
    use('wbthomason/packer.nvim')
    -- 你的插件列表...
    use('machakann/vim-sandwich')

    use('jiangmiao/auto-pairs')
    
    -- auto comment
    use('preservim/nerdcommenter')
    -- indent-blankline
    use("lukas-reineke/indent-blankline.nvim")
    -- fzf
    use ({ "junegunn/fzf", run = ":call fzf#install()" })
    use('junegunn/fzf.vim')
    -- color theme
    use('olimorris/onedarkpro.nvim')
    use('folke/tokyonight.nvim')

    -- mutiple cursor
    use('terryma/vim-multiple-cursors')

    -- nvim-tree
    use({ 'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons' })
    -- bufferline
    use({ 'akinsho/bufferline.nvim', requires = { 'kyazdani42/nvim-web-devicons', 'moll/vim-bbye' }, tag = 'v1.2.0' })
    -- lualine
    use({ 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons' } })
    use('arkav/lualine-lsp-progress')
    use({ 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' }, tag = 'nvim-0.5.1' })
    -- telescope extensions
    -- use('LinArcX/telescope-env.nvim')
    -- dashboard-nvim
    use('glepnir/dashboard-nvim')
    -- project
    use('ahmedkhalf/project.nvim')
    -- treesitter
    use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
    -- ranger
    use({ 'kevinhwang91/rnvimr' })
    -- vim-easymotion
    use('easymotion/vim-easymotion')
    --------------------- LSP --------------------
    -- lspconfig
    use({ 'neovim/nvim-lspconfig', 'williamboman/nvim-lsp-installer' })

    -- 补全引擎
    -- use("hrsh7th/nvim-cmp")
    -- snippet 引擎
    -- use("hrsh7th/vim-vsnip")
    -- 补全源
    -- use("hrsh7th/cmp-vsnip")
    -- use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
    -- use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
    -- use("hrsh7th/cmp-path") -- { name = 'path' }
    -- use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }

    -- 常见编程语言代码段
    -- use("rafamadriz/friendly-snippets")

    -- frontend

    -- formatter
    use({ 'neoclide/coc.nvim', branch = 'release' })

end)

pcall(
    vim.cmd,
    [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]]
)
