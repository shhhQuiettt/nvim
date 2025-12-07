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

    -- Commenter
    use("tpope/vim-commentary")


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
       "hrsh7th/nvim-cmp",
       requires = {
           {
               "hrsh7th/cmp-nvim-lsp",
               -- "quangnguyen30192/cmp-nvim-ultisnips",
               -- 'saadparwaiz1/cmp_luasnip',
               "hrsh7th/cmp-buffer",
               "hrsh7th/cmp-path",
               -- "onsails/lspkind.nvim",
           },
       },
       config = function()
           require("plugins.cmp-config.config")
       end,
    })

    use { "catppuccin/nvim", 
        as = "catppuccin" , 
        config = function()
        vim.cmd.colorscheme "catppuccin-mocha"
    end  }


   use({
       "voldikss/vim-floaterm",
       config = function()
           require("plugins.floaterm.config")
       end,
   })


   -- Copilot
   use({
       "github/copilot.vim",
       config = function()
           require("plugins.copilot.config")
       end,
   })


   -- show git diffs
   use({ "airblade/vim-gitgutter" })



   use({
       "nvim-treesitter/nvim-treesitter",
       run = ":TSUpdate",
       config = function()
           require("plugins.treesitter.config")
       end,
   })

   use({
     "nvim-treesitter/nvim-treesitter-textobjects",
     after = "nvim-treesitter",
     requires = "nvim-treesitter/nvim-treesitter",
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


end)
--    -- Colorscheme
--    use({
--        "ellisonleao/gruvbox.nvim",
--        config = function()
--            -- vim.o.background = "light"
--            -- vim.cmd([[colorscheme gruvbox]])
--        end,
--    })

--    -- Auto brackets closing


--    use({
--        "maxmellon/vim-jsx-pretty",
--        -- filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
--        ft = { "jsx", "tsx", "js", "ts" },
--        config = function()
--            print("vim-jsx-pretty loaded")
--        end,
--    })

--    use({ "evanleck/vim-svelte", ft = { "svelte" } })

--    use({
--        "jackguo380/vim-lsp-cxx-highlight",
--        -- config = function()
--        --     require("")
--        -- end,
--        ft = { "c", "cpp" },
--    })

--    use({
--        "R-nvim/R.nvim",
--        config = function()
--            require("plugins.rnvim.config")
--        end,
--        ft = { "r", "rmd" },
--    })

--    --treesitter



--    use({
--        "rcarriga/nvim-dap-ui",
--        requires = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },

--        after = "nvim-dap",
--        config = function()
--            require("plugins.dap_ui.config")
--        end,
--    })

--    use({
--        "theHamsta/nvim-dap-virtual-text",
--        after = "nvim-dap",
--        config = function()
--            require("nvim-dap-virtual-text").setup()
--        end,
--    })

--    --java
--    use({
--        "mfussenegger/nvim-jdtls",
--        config = function()
--            require("plugins.jdtls.config")
--        end,
--        after = { "nvim-lspconfig", "nvim-dap" },
--        ft = { "java" },
--    })

--    -- line
--    use({
--        "nvim-lualine/lualine.nvim",
--        requires = { "nvim-tree/nvim-web-devicons", opt = true },
--        config = function()
--            require("lualine").setup()
--        end,
--    })

--    use({
--        "iamcco/markdown-preview.nvim",
--        run = function() vim.fn["mkdp#util#install"]() end,
--        ft = { "markdown" },
--    })


--    -- use({
--    --     "luk400/vim-jukit",
--    --     config = function()
--    --         require("plugins.jukit.config")
--    --     end,
--    -- })
--    -- end)


