-- Bootstrap lazy.nvim (automatically install if missing)
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

-- Setup plugins
require("lazy").setup({
    -- Simple plugins
    "tpope/vim-surround",
    "tpope/vim-commentary",
    "airblade/vim-gitgutter",

    -- Fzf / Telescope
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("plugins.telescope-c.config")
        end,
    },

    -- Autocompletion (CMP)
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            -- "quangnguyen30192/cmp-nvim-ultisnips",
            -- "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            -- "onsails/lspkind.nvim",
        },
        config = function()
            require("plugins.cmp-config.config")
        end,
    },

    -- LSP Config
    {
        "neovim/nvim-lspconfig",
        dependencies = { "hrsh7th/nvim-cmp" }, -- Load after cmp
        config = function()
            require("plugins.lsp")
        end,
    },

    -- Colorscheme
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000, -- Ensure it loads first
        config = function()
            vim.cmd.colorscheme "catppuccin-mocha"
        end,
    },

    -- Floaterm
    {
        "voldikss/vim-floaterm",
        config = function()
            require("plugins.floaterm.config")
        end,
    },

    -- Copilot
    {
        "github/copilot.vim",
        config = function()
            require("plugins.copilot.config")
        end,
    },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        lazy = false,
        config = function()
            require("plugins.treesitter.config")
        end,
    },

    -- {
    --     "nvim-treesitter/nvim-treesitter-textobjects",
    --     dependencies = { "nvim-treesitter/nvim-treesitter" },
    -- },

    -- Debugger (DAP)
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "mfussenegger/nvim-dap-python",
        },
        config = function()
            require("plugins.dap.config")
        end,
    },

    -- R Language
    {
        "R-nvim/R.nvim",
        ft = { "r", "rmd" },
        config = function()
            require("plugins.rnvim.config")
        end,
    },

    -- -----------------------------------------------------------
    -- Migrated Commented Plugins (Uncomment to enable)
    -- -----------------------------------------------------------

    -- {
    --    "ellisonleao/gruvbox.nvim",
    --    config = function()
    --        -- vim.o.background = "light"
    --        -- vim.cmd([[colorscheme gruvbox]])
    --    end,
    -- },

    -- {
    --    "maxmellon/vim-jsx-pretty",
    --    ft = { "jsx", "tsx", "js", "ts" },
    --    config = function()
    --        print("vim-jsx-pretty loaded")
    --    end,
    -- },

    -- { "evanleck/vim-svelte", ft = { "svelte" } },

    -- {
    --    "jackguo380/vim-lsp-cxx-highlight",
    --    ft = { "c", "cpp" },
    -- },

    -- {
    --    "rcarriga/nvim-dap-ui",
    --    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    --    config = function()
    --        require("plugins.dap_ui.config")
    --    end,
    -- },

    -- {
    --    "theHamsta/nvim-dap-virtual-text",
    --    dependencies = { "mfussenegger/nvim-dap" },
    --    config = function()
    --        require("nvim-dap-virtual-text").setup()
    --    end,
    -- },

    -- {
    --    "mfussenegger/nvim-jdtls",
    --    dependencies = { "neovim/nvim-lspconfig", "mfussenegger/nvim-dap" },
    --    ft = { "java" },
    --    config = function()
    --        require("plugins.jdtls.config")
    --    end,
    -- },

    -- {
    --    "nvim-lualine/lualine.nvim",
    --    dependencies = { "nvim-tree/nvim-web-devicons" },
    --    config = function()
    --        require("lualine").setup()
    --    end,
    -- },

    -- {
    --    "iamcco/markdown-preview.nvim",
    --    build = function() vim.fn["mkdp#util#install"]() end,
    --    ft = { "markdown" },
    -- },

    -- {
    --     "luk400/vim-jukit",
    --     config = function()
    --         require("plugins.jukit.config")
    --     end,
    -- },
})
