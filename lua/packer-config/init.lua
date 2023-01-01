return require('packer').startup(function(use)
    use { 'wbthomason/packer.nvim',
        config = function()
            vim.cmd([[
                      augroup packer_user_config
                        autocmd!
                        autocmd BufWritePost */nvim/lua/packer-config/init.lua source <afile> | PackerCompile
                        autocmd BufWritePost */nvim/lua/plugins/* source <afile> | PackerCompile
                      augroup end
                    ]])
        end
    }

    -- Let you sourand objects
    use 'tpope/vim-surround'

    -- Commenter
    use 'tpope/vim-commentary'

    -- File tree
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons',
        },
        config = function() require("plugins.nvim-tree.config") end
        -- tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

    -- Fzf
    use { 'nvim-telescope/telescope.nvim',
        tag = '0.1.0',
        requires = { { 'nvim-lua/plenary.nvim' } },
        config = function() require("plugins.telescope-c.config") end
    }

    -- LSP Config
    use {
        'neovim/nvim-lspconfig',
        config = function() require("plugins.lsp") end,
        after = "nvim-cmp"
    }

    use { "jose-elias-alvarez/null-ls.nvim",
        config = function() require("plugins.null-ls.config") end,
    }
    -- Autocompletion
    use {
        "hrsh7th/nvim-cmp",
        requires = { {
            'hrsh7th/cmp-nvim-lsp',
            'quangnguyen30192/cmp-nvim-ultisnips',
            -- 'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'onsails/lspkind.nvim'
        } },
        config = function() require("plugins.cmp-config.config") end
    }


    use { 'voldikss/vim-floaterm',
        config = function()
            require("plugins.floaterm.config")
        end
    }

    -- Colorscheme
    use { "ellisonleao/gruvbox.nvim",
        config = function() vim.cmd [[colorscheme gruvbox]] end
    }

    -- use({ "L3MON4D3/LuaSnip",  after = "nvim-cmp", requires = {
    --     use "rafamadriz/friendly-snippets"
    -- },
    --     config = function() require "plugins.luasnip-config.config" end
    -- })
    use { 'SirVer/ultisnips',
        requires = {
            'honza/vim-snippets'
        },
        after = "nvim-cmp" }

    use 'honza/vim-snippets'

    -- use {
    --     'nvim-treesitter/nvim-treesitter',
    --     config = function() require("plugins.treesitter.config") end,
    --     run = function()
    --         local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
    --         ts_update()
    --     end,
    --     requires = {
    --         "p00f/nvim-ts-rainbow"
    --     }
    -- }

    -- Auto brackets closing

    use "cohama/lexima.vim"

end)
