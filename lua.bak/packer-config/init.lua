return require("packer").startup(function(use)
    use({
        "wbthomason/packer.nvim",
        config = function()
            vim.cmd([[
                      augroup packer_user_config
                        autocmd!
                        autocmd BufWritePost */nvim/lua/packer-config/init.lua source <afile> | PackerCompile
                        autocmd BufWritePost */nvim/lua/plugins/* source <afile> | PackerCompile
                      augroup end
                    ]])
        end,
    })

    -- Let you sourand objects
    use("tpope/vim-surround")
    use("tpope/vim-eunuch")

    -- Commenter
    use("tpope/vim-commentary")

    -- File tree
    use({
        "nvim-tree/nvim-tree.lua",
        requires = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("plugins.nvim-tree.config")
        end,
        -- tag = "nightly", -- optional, updated every week. (see issue #1193)
    })

    -- Fzf
    use({
        "nvim-telescope/telescope.nvim",
        requires = { { "nvim-lua/plenary.nvim" } },
        config = function()
            require("plugins.telescope-c.config")
        end,
    })

    -- LSP Config
    use({
        "neovim/nvim-lspconfig",
        config = function()
            require("plugins.lsp")
        end,
        after = "nvim-cmp",
    })

    use({
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            require("plugins.null-ls.config")
        end,
    })
    -- Autocompletion
    use({
        "hrsh7th/nvim-cmp",
        requires = {
            {
                "hrsh7th/cmp-nvim-lsp",
                -- "quangnguyen30192/cmp-nvim-ultisnips",
                -- 'saadparwaiz1/cmp_luasnip',
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
                "onsails/lspkind.nvim",
            },
        },
        config = function()
            require("plugins.cmp-config.config")
        end,
    })

    use({
        "voldikss/vim-floaterm",
        config = function()
            require("plugins.floaterm.config")
        end,
    })

    -- Colorscheme
    use({
        "ellisonleao/gruvbox.nvim",
        config = function()
            -- vim.o.background = "light"
            -- vim.cmd([[colorscheme gruvbox]])
        end,
    })
    -- Using Packer
    use({
        "navarasu/onedark.nvim",
        config = function()
            require("onedark").setup({ style = "warmer" })
            vim.cmd([[colorscheme onedark]])
        end,
    })
    use({
        "jacoborus/tender.vim",
        -- config = function()
        --     vim.cmd([[colorscheme tender]])
        -- end,
    })

    -- use({
    --     "SirVer/ultisnips",
    --     -- requires = {
    --     --     "honza/vim-snippets",
    --     -- },
    --     after = "nvim-cmp",
    -- })

    -- use("honza/vim-snippets")

    -- Auto brackets closing

    use("cohama/lexima.vim")

    -- Copilot
    use({
        "github/copilot.vim",
        config = function()
            require("plugins.copilot.config")
        end,
    })

    -- Jupyter client
    -- use({
    --     "untitled-ai/jupyter_ascending.vim",
    --     config = function()
    --         require("plugins.jupyter_ascending.config")
    --     end,
    --     cond = require("plugins.jupyter_ascending.cond"),
    -- })

    -- use({ "airblade/vim-gitgutter" })

    use({
        "maxmellon/vim-jsx-pretty",
        -- filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
        ft = { "jsx", "tsx", "js", "ts" },
        config = function()
            print("vim-jsx-pretty loaded")
        end,
    })

    use({ "evanleck/vim-svelte", ft = { "svelte" } })

    use({
        "jackguo380/vim-lsp-cxx-highlight",
        -- config = function()
        --     require("")
        -- end,
        ft = { "c", "cpp" },
    })

    use({
        "jamespeapen/Nvim-R",
        config = function()
            require("plugins.nvim-r.config")
        end,
        ft = { "r", "rmd", "Rmd" },
    })

    --treesitter
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function()
            require("plugins.treesitter.config")
        end,
    })

    --debbuger
    use({
        "mfussenegger/nvim-dap",
        config = function()
            require("plugins.dap.config")
        end,

        requires = {
            "mfussenegger/nvim-dap-python",
        },
    })

    use({
        "rcarriga/nvim-dap-ui",
        requires = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },

        after = "nvim-dap",
        config = function()
            require("plugins.dap_ui.config")
        end,
    })

    use({
        "theHamsta/nvim-dap-virtual-text",
        after = "nvim-dap",
        config = function()
            require("nvim-dap-virtual-text").setup()
        end,
    })

    --java
    use({
        "mfussenegger/nvim-jdtls",
        config = function()
            require("plugins.jdtls.config")
        end,
        after = { "nvim-lspconfig", "nvim-dap" },
        ft = { "java" },
    })

    -- line
    use({
        "nvim-lualine/lualine.nvim",
        requires = { "nvim-tree/nvim-web-devicons", opt = true },
        config = function()
            require("lualine").setup()
        end,
    })

    use({
        "glacambre/firenvim",
        config = function()
            require("plugins.firenvim.config")
        end,
        build = ":call firenvim#install(0)",
    })
end)
