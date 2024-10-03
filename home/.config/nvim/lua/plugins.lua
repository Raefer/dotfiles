return {
    { -- Gitsigns
        "lewis6991/gitsigns.nvim",
    },

    { -- Lualine
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    { -- Nvim-tree
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    { -- Comment
        "numToStr/Comment.nvim",
    },

    { -- Indent-blankline
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
    },

    { -- Which-key
        "folke/which-key.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    { -- Mason-lspconfig
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
            "j-hui/fidget.nvim",
        },
    },

    { -- Telescope
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-live-grep-args.nvim", version = "^1.0.0" },
            { "nvim-telescope/telescope-fzf-native.nvim",     build = "make" },
        },
    },

    { -- Nvim-cmp
        "hrsh7th/nvim-cmp",
        dependencies = {
            "neovim/nvim-lspconfig",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "saadparwaiz1/cmp_luasnip",
            {
                "L3MON4D3/LuaSnip",
                build = "make install_jsregexp",
                dependencies = { "rafamadriz/friendly-snippets" },
            },
        },
    },

    { -- Treesitter
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
    },

    { -- Conform
        "stevearc/conform.nvim",
    },

    { -- Neorg
        "nvim-neorg/neorg",
        lazy = false,
        version = "*",
    },

    { -- Todo-comments
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    { -- Theme: Catppuccin
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
    },

    { -- Theme: Nightfox
        "EdenEast/nightfox.nvim",
        priority = 1000,
    },

    { -- Theme: Everforest
        "sainnhe/everforest",
        lazy = false,
        priority = 1000,
    },

    { -- Theme: Gruvbox-material
        "sainnhe/gruvbox-material",
        lazy = false,
        priority = 1000,
    },

    { -- Theme: Onedark
        "navarasu/onedark.nvim",
        priority = 1000,
    },
}
